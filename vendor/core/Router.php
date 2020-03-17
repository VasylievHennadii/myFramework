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
            if (preg_match("#$pattern#i", $url, $matches)) {        
                foreach($matches as $k => $v) {
                    if (is_string($k)) {
                        $route[$k] = $v;
                    }
                }
                if (!isset($route['action'])) {
                    $route['action'] = 'index';
                }
                self::$route = $route;                
                return true;
            }
        }
        return false;
    }

    public static function dispatch($url) {
        if(self::matchRoute($url)) {
           $controller = self::$route['controller'];
           if(class_exists($controller)) {
               echo 'ok';
           }else{
               echo "Контроллер <b>$controller</b> не найден";
           }
        }else{
            http_response_code(404);
            include '404.html';
        }
    }


 }






?>