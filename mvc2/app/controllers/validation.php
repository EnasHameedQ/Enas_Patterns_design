<?php
require_once("controller.php");

class Validation extends Controller {

    private $_errors = [];


    public function validate($src, $rules = [] ){

        foreach($src as $item => $item_value){
            if(key_exists($item, $rules)){
                foreach($rules[$item] as $rule => $rule_value){

                    if(is_int($rule))
                         $rule = $rule_value;

                    switch ($rule){
                        case 'required':
                        if(empty($item_value) && $rule_value){
                            $this->addError($item,ucwords($item). ' required');
                        }
                        break;

                        case 'minLen':
                        if(strlen($item_value) < $rule_value){
                            $this->addError($item, ucwords($item). ' should be minimum '.$rule_value. ' characters');
                        }       
                        break;

                        case 'maxLen':
                        if(strlen($item_value) > $rule_value){
                            $this->addError($item, ucwords($item). ' should be maximum '.$rule_value. ' characters');
                        }
                        break;

                        case 'numeric':
                        if(!ctype_digit($item_value) && $rule_value){
                            $this->addError($item, ucwords($item). ' should be numeric');
                        }
                        break;

                     case 'alpha':
                        if(!ctype_alpha(str_replace(' ', '', $item_value)) && $rule_value){
                        $this->addError($item, ucwords($item). ' should be alphabetic characters');
                        }
                  
                    }
                }
            }
        }    
    }

    private function addError($item, $error){
        $this->_errors[$item][] = $error;
    }


    public function error(){
        if(empty($this->_errors)) return false;
        return $this->_errors;
    }  }
// test 

    $data = ['username' => '', 'password' => 'pass'];
$rules = [
    'username' => ['required', 'minLen' => 6,'maxLen' => 150, 'alpha'],
    'password' => ['required', 'minLen' => 8]
];
$v = new Validation();
$v->validate($data, $rules);
if($v->error()){
    print_r($v->error());
} else{
    echo 'Ok';
}
?>