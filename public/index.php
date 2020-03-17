<?php 

$query = rtrim($_SERVER['QUERY_STRING'], '/');// получаем нашу строку запроса

require '../vendor/core/Router.php';//подключаем класс Router
require '../vendor/libs/functions.php';//подключаем библиотеку функций
require '../app/controllers/Main.php';
require '../app/controllers/Posts.php';

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