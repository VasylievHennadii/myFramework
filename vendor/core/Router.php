<?php 

namespace vendor\core;

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
                $route['controller'] = self::upperCamelCase($route['controller']);
                self::$route = $route;                
                return true;
            }
        }
        return false;
    }

    /**
     * перенаправляет URL по корректному маршруту
     * @param string $url входящий URL
     * @return void ничего не возвращает
     */
    public static function dispatch($url) {
        $url = self::removeQueryString($url);      
        if(self::matchRoute($url)) {
           $controller = 'app\controllers\\' . self::$route['controller'];                  
           if(class_exists($controller)) {
               $cObj = new $controller(self::$route);
               $action = self::lowerCamelCase(self::$route['action']) . 'Action';     
               if(method_exists($cObj, $action)) {
                   $cObj->$action();
               }else{
                echo "Метод <b>$controller::$action</b> не найден";
               }
           }else{
               echo "Контроллер <b>$controller</b> не найден";
           }
        }else{
            http_response_code(404);
            include '404.html';
        }
    }

    /**
     * из вида page-news делает вид PageNews
     * преобразует имена к виду CamelCase
     * @param string $name строка для преобразования
     * @return string
     */
    protected static function upperCamelCase($name) {
        // $name = str_replace('-', ' ', $name);//заменяем '-' на ' ' в переменной $name
        // $name = ucwords($name);//делает первую букву строки заглавной
        // $name = str_replace(' ', '', $name);//заменяем ' ' на '' в переменной $name

        return str_replace(' ', '', ucwords(str_replace('-', ' ', $name)));      
    }

    /**
     * из вида PageNews делает вид pageNews
     * преобразует имена к виду сamelCase
     * @param string $name строка для преобразования
     * @return string
     */
    protected static function lowerCamelCase($name) {
        return lcfirst(self::upperCamelCase($name));      
    }

    /**
     * метод обрезает возможные get-параметры
     * возвращает только неявные get-параметры, обрезая явные
     * posts-new/test/?page=2&var1=1&var2=2 вернет posts-new/test
     * @param string $url запрос URL
     * @return string     
     */
    protected static function removeQueryString($url) {
        if($url){
            $params = explode('&', $url, 2);//складываем в переменную $params в качестве массива строку, разбитую по &
            if(false === strpos($params[0], '=')) {//если в первом элементе массива нет '=', 
                return rtrim($params[0], '/');// то мы его возвращаем с обрезанным концевым '/'
            }else{
                return '';
            }            
        }
    }


 }






?>