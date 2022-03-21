<?php

class Database{
    private $dbHost = localhost;
    private $dbUser =root;
    private $dbPass = "";
    private $dbName = DB_NAME;

    private $statement;
    private $dbHandler;
    private $error;

    public function __construct()
    {
        $conn = 'mysql:host=' . $this->dbHost . ';dbname=' . $this->dbName;
        $options = array(
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        );
        try {
            $this->dbHandler = new PDO($conn, $this->dbUser, $this->dbPass, $options);
        } catch (PDOException $e) {
            $this->error = $e->getMessage();
            echo $this->error;
        }
    }


   public function select(array $columns, $from = null, $partition = null)
    {
    $i = (int)0;
    $select_clause = [];

    foreach ($columns as $alias => $col) {
    if ($i == $alias) {
    $select_clause[] = $col;
    } else {
    $select_clause[] = $col . ' AS ' . $alias;
    }

    if (is_int($alias)) {
    $i = (int)($alias+1);
    }
    }

    $this->select = 'SELECT ' . implode(",\n", $select_clause);
    $this->from = !empty($from) ? (' FROM ' . $from) : null;

    if (!empty($this->from) && !empty($partition)) {
    $this->from .= $partition;
    }

    return $this;
    }
    // <!-- update -->
    public function update($table_reference, array $assignment_list, $update_options = null)
    {
    $i = (int)0;
    $set_clause = [];

    foreach ($assignment_list as $key => $val) {
    if (is_int($key)) {
    $set = $val;
    } else {
    $set = $key;
    $bind_array = $val;
    $this->bind_array = array_merge($this->bind_array, $bind_array);
    }

    if ($i > (int)0) {
    $set_clause[] = $set;
    } else {
    $set_clause[] = 'SET ' . $set;
    }

    $i++;
    }

    $this->update .= 'UPDATE ' . $update_options . ' ' . $table_reference . ' ' . implode(', ', $set_clause);

    return $this ;
    }
    // <!--insert  -->
    public function insert($table_reference, array $assignment_list, $insert_options = null, $partition_reference = null)
    {
    $columns = $values = [];

    foreach ($assignment_list as $column => $value) {
    $columns[] = $column;
    $values[] = '?';
    $this->bind_array[] = $value;
    }

    $insert_clause = 'INSERT ' . $insert_options . ' INTO ' . $table_reference;

    if (!empty($partition_reference)) {
    $insert_clause .= ' PARTITION ' . $partition_reference;
    }

    $insert_clause .= ' (' . implode(', ', $columns) . ') VALUES (' . implode(', ', $values) . ')';

    $this->insert = $insert_clause;

    return $this;
    }
    // <!--delete  -->
    public function delete($table_reference, $delete_options = null, $partition_reference = null)
    {
    $delete_clause = 'DELETE ' . $delete_options . ' FROM ' . $table_reference;

    if (!empty($partition_reference)) {
    $delete_clause .= ' PARTITION ' . $partition_reference;
    }

    $this->delete = $delete_clause;

    return $this;
    }
    // <!--join  -->
    public function join($reference, $condition = null, $join_type = 'INNER')
    {
    if (
    !in_array(strtoupper($join_type), ['NATURAL', 'NATURAL INNER', 'NATURAL LEFT', 'NATURAL RIGHT', 'NATURAL OUTER'])
    && substr(strtoupper($condition), 0, 3) != 'ON '
    ) {
    $condition = 'ON ' . $condition;
    }

    $this->join .= ' ' . $join_type . ' JOIN ' . $reference . ' ' . $condition;

    return $this;
    }
    // <!-- where  -->
    public function where(array $clause)
    {
    $i = (int)0;
    $where_clause = [];

    foreach ($clause as $key => $val) {
    if (is_int($key)) {
    $where = $val;
    } else {
    $where = $key;
    $bind_array = $val;
    $this->bind_array = array_merge($this->bind_array, $bind_array);
    }

    if ($i > (int)0) {
    $where_clause[] = 'AND ' . $where;
    } else {
    if (empty($this->where)) {
    $where_clause[] = ' WHERE (' . $where;
    } else {
    $where_clause[] = ' AND (' . $where;
    }
    }

    $i++;
    }

    $this->where .= "\n" . implode("\n", $where_clause) . ')';

    return $this;
    }


    // <!-- OR where  -->
    // <!-- serch -->
    public function search($repository, $query, $search)
    {
    $name = $this->name();
    if ($repository->hasColumn($name)) {
    $query->orWhere($query->getFrom() . ".{$name} LIKE '%{$search}%'");
    } else {
    $query->orWhere("{$name} LIKE '%{$search}%'");
    }
    }

    // <!--groupBy -->
    public function groupBy(array $group_by)
    {
    foreach ($group_by as $key => $g) {
    $group_by[$key] = trim($g);
    }

    $group_by_clause = ' GROUP BY ' . implode(',', $group_by);

    $this->group_by = $group_by_clause;

    return $this;
    }
    // <!-- orderBy -->
    public function orderBy(array $order_by)
    {
    $order_by_clause = [];

    foreach ($order_by as $key => $val) {
    if (is_int($key)) {
    $order = $val);
    $sort = 'ASC';
    } else {
    $order = $key;
    $sort = in_array(strtoupper($val), ['ASC', 'DESC']) ? $val : 'ASC';
    }

    $order_by_clause[] = $order . ' ' . $sort;
    }

    $order_by_clause = ' ORDER BY ' . implode(', ', $order_by_clause);

    $this->order_by = $order_by_clause;

    return $this;
    }
    // <!--LIMT  -->
    public function limit($row_count = 10, $offset = 0)
    {
    $row_count = number_format($row_count, 0, '', '');
    $this->limit = ' LIMIT ' . $offset . ', ' . $row_count;

    return $this;
    }
    // <!--  COUNT -->
    // public function count()
    // {
    // $qb = $repository->createQueryBuilder('t');
    // return $qb
    // ->select('count(t.id)')
    // ->getQuery()
    // ->getSingleScalarResult();
    // }
    // public function count()
    // {
    // $qb = $repository->createQueryBuilder('t');
    // return $qb
    // ->select('count(t.id)')
    // ->getQuery()
    // ->useQueryCache(true)
    // ->useResultCache(true, 3600)
    // ->getSingleScalarResult();
    // } 
    }