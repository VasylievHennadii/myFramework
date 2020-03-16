<?php 

/**
 * Description of Router
 * 
 */

 class Router {

    // public function __construct() {
    //     echo 'Привет, мир!';
    // }

    protected static $routes = [];
    protected static $route = [];

    public static function add($regexp, $route = []) {
        self::$routes[$regexp] = $route;
    }


 }






?>