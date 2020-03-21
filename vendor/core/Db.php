<?php 

namespace vendor\core;

use PDO;

/**
 * Dscription of Db
 * 
 */
class Db {

    protected $pdo;
    protected static $instance;
    public static $countSql = 0;
    public static $queries = [];
    

    protected function __construct() {
        $db = require ROOT . '/config/config_db.php';
        $options = [
            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
        ];
        $this->pdo = new \PDO($db['dsn'],$db['user'],$db['pass'], $options);
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
    public function execute($sql, $params = []) {
        self::$countSql++;
        self::$queries[] = $sql;
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute($params);
    }

    /**
     * метод для выполнения запросов
     * возвращает данные из бд
     * @param $sql
     * 
     */
    public function query($sql, $params = []) {
        self::$countSql++;
        self::$queries[] = $sql;
        $stmt = $this->pdo->prepare($sql);
        $res = $stmt->execute($params);
        if($res !== false){
            return $stmt->fetchAll();
        }
        return [];
    }

}


?>