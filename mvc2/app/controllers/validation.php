<?php
require_once("controller.php");

class Validation extends Controller
{

    private static $_errors = [];

    private function __construct()
    {
    }

    public static function validate($src, $rules = [])
    {

        foreach ($src as $item => $item_value) {
            if (key_exists($item, $rules)) {
                foreach ($rules[$item] as $rule => $rule_value) {

                    if (is_int($rule))
                        $rule = $rule_value;

                    switch ($rule) {
                        case 'required':
                            if (empty($item_value) && $rule_value) {
                                self::addError($item, ucwords($item) . ' required');
                            }
                            break;

                        case 'minLen':
                            if (strlen($item_value) < $rule_value) {
                                self::addError($item, ucwords($item) . ' should be minimum ' . $rule_value . ' characters');
                            }
                            break;

                        case 'maxLen':
                            if (strlen($item_value) > $rule_value) {
                                self::addError($item, ucwords($item) . ' should be maximum ' . $rule_value . ' characters');
                            }
                            break;

                        case 'numeric':
                            if (!ctype_digit($item_value) && $rule_value) {
                                self::addError($item, ucwords($item) . ' should be numeric');
                            }
                            break;

                        case 'alpha':
                            if (!ctype_alpha(str_replace(' ', '', $item_value)) && $rule_value) {
                                self::addError($item, ucwords($item) . ' should be alphabetic characters');
                            }
                    }
                }
            }
        }
    }

    private static function addError($item, $error)
    {
        self::$_errors[$item][] = $error;
    }


    public static function error()
    {
        if (empty(self::$_errors)) return false;
        return self::$_errors;
    }
}
// test 

// $data = ['username' => '', 'password' => 'pass'];
// $rules = [
//     'username' => ['required', 'minLen' => 6, 'maxLen' => 150, 'alpha'],
//     'password' => ['required', 'minLen' => 8]
// ];

// Validation::validate($data, $rules);
// var_dump(Validation::error());
