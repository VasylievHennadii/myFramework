<?php 

$query = $_SERVER['QUERY_STRING'];

require '../vendor/core/Router.php';

Router::add('posts/add', ['controller' => 'Posts', 'action' => 'add']);

print_r(Router::getRoutes());






?>