<?php 

$query = rtrim($_SERVER['QUERY_STRING'], '/');// получаем нашу строку запроса

define('WWW', __DIR__);
define('CORE', dirname(__DIR__) . '/vendor/core');
define('ROOT', dirname(__DIR__));
define('APP', dirname(__DIR__) . '/app');

require '../vendor/core/Router.php';//подключаем класс Router
require '../vendor/libs/functions.php';//подключаем библиотеку функций
// require '../app/controllers/Main.php';
// require '../app/controllers/Posts.php';
// require '../app/controllers/PostsNew.php';

spl_autoload_register(function($class){
    $file = APP . "/controllers/$class.php";
    if(is_file($file)) {
        require_once $file;
    }
});


//my routs
Router::add('^pages/?(?P<action>[a-z-]+)?$', ['controller' => 'Posts']);

//default routs
// правила по умолчанию, которые обслуживают всю маршрутизацию фреймворка. Работают с регулярными выражениями
// 1 правило провалидирует пустую строку(т.е. домен нашего сайта) и отработает контроллер и действия по умолчанию
// '^$' - обозначение пустой строки в регулярных выражениях
Router::add('^$', ['controller' => 'Main', 'action' => 'index']);

// 2 правило должно валидировать все остальные url адреса вида controller/action -> posts/index или pages/view/about
// где about - параметр в action view
Router::add('^(?P<controller>[a-z-]+)/?(?P<action>[a-z-]+)?$');

debug(Router::getRoutes());

Router::dispatch($query);







?>