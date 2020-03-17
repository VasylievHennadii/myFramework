<?php 

/**
 * Description of Router
 * 
 */

 class Router {

    /**
     * таблица маршрутов
     * @var array
     */
    protected static $routes = [];

    /**
     * текущий маршрут, который должен отработать
     * @var array
     */
    protected static $route = [];
   
    /**
     * метод add добавляет маршруты, которые вводит пользователь, в таблицу маршрутов
     * 
     * @param string $regexp регулярное выражение маршрута
     * @param array $route маршрут ([controller, action, params])
     */
    public static function add($regexp, $route = []) {
        self::$routes[$regexp] = $route;
    }

    /**
     * возвращает таблицу маршрутов
     * 
     * @return array
     */
    public static function getRoutes() {
        return self::$routes;
    }
    
    /**
     * возвращает текущий маршрут, с которым работает наше приложение (controller, action, [params])
     * 
     * @return array
     */
    public static function getRoute() {
        return self::$route;
    }
    
    /**
     * ищет совпадение с запросом в таблице маршрутов(ищет url в таблице маршрутов)
     * @param string $url входящий URL
     * @return boolean
     */
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