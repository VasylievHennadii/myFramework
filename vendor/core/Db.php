<?php 

namespace vendor\core;

/**
 * Dscription of Db
 * 
 */
class Db {

    protected $pdo;
    protected static $instance;

    protected function __construct() {
        $db = require ROOT . '/config/config_db.php';
        $this->pdo = new \PDO($db['dsn'],$db['user'],$db['pass']);
    }

}


?>