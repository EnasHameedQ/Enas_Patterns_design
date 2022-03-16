<?php class User{
    private $email;
    private $password;
    private  $phone;
    private $addres;
    private $birthdate;
    function __construct($email, $password)
    {
        $this->email=$email;
        $this->password=$password;

    }
    function setPhone($phone){
        $this->phone = $phone;
    }
    function setAddres($addres)
    {
        $this->addres = $addres;
    }
 
    function setBirthdate($birthdate)
    {
        $this->birthdate = $birthdate;
    }
    
}
?>