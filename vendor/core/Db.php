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


    /**
     * если в self::$instance ничего не записано, то мы в него запишем объект данного класса new self(в нем будет pdo с подключением)
     */
    public static function instance() {
        if(self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }

    /**
     * метод для выполнения запросов
     * будет выполняться, когда делается sql запрос, а данные из бд нам не нужны. Нам нужен ответ true/false
     * @param $sql
     * 
     */
    public function execute($sql) {
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute();
    }

    /**
     * метод для выполнения запросов
     * возвращает данные из бд
     * @param $sql
     * 
     */
    public function query($sql) {
        $stmt = $this->pdo->prepare($sql);
        $res = $stmt->execute();
        if($res !== false){
            return $stmt->fetchAll();
        }
        return [];
    }

}


?>