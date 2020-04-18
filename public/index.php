<?php

use fw\core\App;
use fw\core\Router;//импорт полного имени(пути) класса. подключение простанства имён

$query = rtrim($_SERVER['QUERY_STRING'], '/');// получаем нашу строку запроса

define('DEBUG', 1);//1 - режим отладки, 2- режим продакшн
define('WWW', __DIR__);
define('CORE', dirname(__DIR__) . '/vendor/fw/core');
define('ROOT', dirname(__DIR__));
define('LIBS', dirname(__DIR__) . '/vendor/fw/libs');
define('APP', dirname(__DIR__) . '/app');
define('CACHE', dirname(__DIR__) . '/tmp/cache');
define('LAYOUT', 'blog');

require '../vendor/fw/libs/functions.php';//подключаем библиотеку функций
require __DIR__ . '/../vendor/autoload.php';

//функция автозагрузки
// spl_autoload_register(function($class){
//     $file = ROOT . "/" . str_replace('\\', '/', $class) . '.php';    
//     if(is_file($file)) {
//         require_once $file;
//     }
// });

new App;

/**
 * my routs
 */
Router::add('^page/(?P<action>[a-z-]+)/(?P<alias>[a-z-]+)$', ['controller' => 'Page']);
Router::add('^page/(?P<alias>[a-z-]+)$', ['controller' => 'Page', 'action' => 'view']);

/**
 * default routs
 */
//правила для админской части
Router::add('^admin$', ['controller' => 'User', 'action' => 'index', 'prefix' => 'admin']);
Router::add('^admin/?(?P<controller>[a-z-]+)/?(?P<action>[a-z-]+)?$', ['prefix' => 'admin']);



// правила по умолчанию, которые обслуживают всю маршрутизацию фреймворка. Работают с регулярными выражениями
// 1 правило провалидирует пустую строку(т.е. домен нашего сайта) и отработает контроллер и действия по умолчанию
// '^$' - обозначение пустой строки в регулярных выражениях
Router::add('^$', ['controller' => 'Main', 'action' => 'index']);

// 2 правило должно валидировать все остальные url адреса вида controller/action -> posts/index или pages/view/about
// где about - параметр в action view
Router::add('^(?P<controller>[a-z-]+)/?(?P<action>[a-z-]+)?$');

Router::dispatch($query);







?>