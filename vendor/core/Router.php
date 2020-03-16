<?php 

/**
 * Description of Router
 * 
 */

 class Router {

    // public function __construct() {
    //     echo 'Привет, мир!';
    // }

    protected static $routes = [];//таблица маршрутов
    protected static $route = [];//текущий маршрут, который должен отработать

    // метод add добавляет маршруты, которые вводит пользователь, в таблицу маршрутов
    public static function add($regexp, $route = []) {
        self::$routes[$regexp] = $route;
    }

    //метод для распечатки маршрутов
    public static function getRoutes() {
        return self::$routes;
    }

    //метод всегда вернет текущий маршрут, с которым работает наше приложение
    public static function getRoute() {
        return self::$route;
    }

    //метод ищет совпадение с запросом в таблице маршрутов
    public static function matchRoute($url) {
        foreach(self::$routes as $pattern => $route) {
            if ($url == $pattern) {
                self::$route = $route;
                return true;
            }
        }
        return false;
    }


 }






?>