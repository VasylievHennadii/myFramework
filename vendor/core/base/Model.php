<?php 

namespace vendor\core\base;

use vendor\core\Db;

/**
 * Dscription of Model
 * 
 */
abstract class Model {

    protected $pdo;
    protected $table;

    public function __construct(){
        $this->pdo = Db::instance();
    }

    /**
     * метод обертка над методом execute Db
     */
    public function query($sql){
        return $this->pdo->execute();
    }

    public function findAll(){
        $sql = "SELECT * FROM {$this->table}";
        return $this->pdo->query($sql);
    }

}


?>