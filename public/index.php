<?php 

$query = rtrim($_SERVER['QUERY_STRING'], '/');// получаем нашу строку запроса

require '../vendor/core/Router.php';//подключаем класс Router
require '../vendor/libs/functions.php';//подключаем библиотеку функций

// Router::add('posts/add', ['controller' => 'Posts', 'action' => 'add']);
// Router::add('posts', ['controller' => 'Posts', 'action' => 'index']);
// Router::add('', ['controller' => 'Main', 'action' => 'index']);


// правила по умолчанию, которые обслуживают всю маршрутизацию фреймворка. Работают с регулярными выражениями
// 1 правило провалидирует пустую строку(т.е. домен нашего сайта) и отработает контроллер и действия по умолчанию
// '^$' - обозначение пустой строки в регулярных выражениях
Router::add('^$', ['controller' => 'Main', 'action' => 'index']);


// 2 правило должно валидировать все остальные url адреса вида controller/action -> posts/index или pages/view/about
// где about - параметр в action view
Router::add('[a-z-]+/[a-z-]+', ['controller' => 'Main', 'action' => 'index']);



debug(Router::getRoutes());

if(Router::matchRoute($query)) {
    debug(Router::getRoute());
}else{
    echo '404';
}






?>