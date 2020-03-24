<?php

require 'rb.php';
$db = require '../config/config_db.php';
R::setup($db['dsn'],$db['user'],$db['pass'], $options);
R::freeze(true);//замораживаем структуру таблицы от изменений параметров данных
// var_dump(R::testConnection());//проверка соединения с БД -> true/false


//Create (для примера создаём новую таблицу категорий в нашей БД)
// $cat = R::dispense('category');
// $cat->title = 'Категория 1';//создаем поле title(поле id создается автоматически)
// $id = R::store($cat);//сохраняем изменения(поля) в БД
// var_dump($id);


//Read(чтение данных)
// $cat = R::load('category', $id);
$cat = R::load('category', 2);//чтение данных с $id=2
print_r($cat);






?>