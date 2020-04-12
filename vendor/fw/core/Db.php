<?php 

namespace fw\core;

use R;

// use PDO;

/**
 * Dscription of Db
 * 
 */
class Db {

    use TSingletone;//подключаем кусок кода из TSingletone

    protected $pdo;
    // protected static $instance;
    public static $countSql = 0;
    public static $queries = [];
    

    protected function __construct() {
        $db = require ROOT . '/config/config_db.php';
        require LIBS . '/rb.php';
        \R::setup($db['dsn'],$db['user'],$db['pass']);
        \R::freeze(true);//замораживаем структуру таблицы от изменений параметров данных
        // \R::fancyDebug(TRUE);//распечатываем запросы
        // $options = [
        //     \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
        //     \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
        // ];
        // $this->pdo = new \PDO($db['dsn'],$db['user'],$db['pass'], $options);
    }


    //убрали этот кусок кода с использованием TSingletone
    // /**
    //  * если в self::$instance ничего не записано, то мы в него запишем объект данного класса new self(в нем будет pdo с подключением)
    //  * реализация Паттерна (шаблона) проектирования Singleton
    //  */
    // public static function instance() {
    //     if(self::$instance === null) {
    //         self::$instance = new self;
    //     }
    //     return self::$instance;
    // }

    /**
     * метод для выполнения запросов
     * будет выполняться, когда делается sql запрос, а данные из бд нам не нужны. Нам нужен ответ true/false
     * @param $sql
     * 
     */
    // public function execute($sql, $params = []) {
    //     self::$countSql++;
    //     self::$queries[] = $sql;
    //     $stmt = $this->pdo->prepare($sql);
    //     return $stmt->execute($params);
    // }

    /**
     * метод для выполнения запросов
     * возвращает данные из бд
     * @param $sql
     * 
     */
    // public function query($sql, $params = []) {
    //     self::$countSql++;
    //     self::$queries[] = $sql;
    //     $stmt = $this->pdo->prepare($sql);
    //     $res = $stmt->execute($params);
    //     if($res !== false){
    //         return $stmt->fetchAll();
    //     }
    //     return [];
    // }

}


?>