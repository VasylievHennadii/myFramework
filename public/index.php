<?php 

$query = rtrim($_SERVER['QUERY_STRING'], '/');// получаем нашу строку запроса

require '../vendor/core/Router.php';//подключаем класс Router
require '../vendor/libs/functions.php';//подключаем библиотеку функций

Router::add('posts/add', ['controller' => 'Posts', 'action' => 'add']);
Router::add('posts', ['controller' => 'Posts', 'action' => 'index']);
Router::add('', ['controller' => 'Main', 'action' => 'index']);

debug(Router::getRoutes());

if(Router::matchRoute($query)) {
    debug(Router::getRoute());
}else{
    echo '404';
}






?>