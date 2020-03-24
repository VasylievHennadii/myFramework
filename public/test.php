<?php

require 'rb.php';
$db = require '../config/config_db.php';
R::setup($db['dsn'],$db['user'],$db['pass'], $options);
var_dump(R::testConnection());



?>