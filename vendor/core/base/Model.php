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
    protected $pk = 'id';

    public function __construct(){
        $this->pdo = Db::instance();
    }

    /**
     * метод обертка над методом execute Db
     */
    public function query($sql){
        return $this->pdo->execute($sql);
    }

    public function findAll(){
        $sql = "SELECT * FROM {$this->table}";
        return $this->pdo->query($sql);
    }

    /**
     * 
     * @param $field - поле, по которому хотим выбирать данные
     */
    public function findOne($id, $field = ''){
        //если поле $field передано, то берём его, иначе - $pk
        $field = $field ?: $this->pk;
        $sql = "SELECT * FROM {$this->table} WHERE $field = ? LIMIT 1";
        return $this->pdo->query($sql, [$id]);
    }

}


?>