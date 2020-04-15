<?php 

namespace fw\core\base;

use fw\core\Db;
use R;
use Valitron\Validator;

/**
 * Dscription of Model
 * 
 */
abstract class Model {

    protected $pdo;
    protected $table;
    protected $pk = 'id';
    public $attributes = [];
    public $errors = [];
    public $rules = [];

    public function __construct(){
        $this->pdo = Db::instance();
    }

    /**
     * метод для автоматической загрузки данных
     */
    public function load($data){
        foreach ($this->attributes as $name => $value){
            if(isset($data[$name])){
                $this->attributes[$name] = $data[$name];
            }
        }
    }

    /**
     * метод для валидации
     */
    public function validate($data){
        Validator::langDir(WWW . '/valitron/lang');
        Validator::lang('ru');
        $v = new Validator($data);
        $v->rules($this->rules);
        if($v->validate()){
            return true;
        }
        $this->errors = $v->errors();
        return false;
    }

    /**
     * метод сохранения юзеров в БД
     */
    public function save($table){
        $tbl = \R::dispense($table);
        foreach($this->attributes as $name => $value){
            $tbl->$name = $value;
        }
        return \R::store($tbl);
    }

    public function getErrors(){
        $errors = '<ul>';
        foreach($this->errors as $error){
            foreach($error as $item){
                $errors .= "<li>$item</li>";
            }
        }
        $errors .= '</ul>';
        $_SESSION['error'] = $errors;
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

    /**
     * метод позволяет выбрать что-либо из БД по призвольному sql запросу
     * 
     */
    public function findBySql($sql, $params = []){
        return $this->pdo->query($sql, $params);
    }

    /**
     * метод позволяетвыбрать из БД по произвольному сочетанию символов 
     */
    public function findLike($str, $field, $table = ''){
        $table = $table ?: $this->table;//если передана таблица, то берём её, иначе - берем таблицу модели
        $sql = "SELECT * FROM $table WHERE $field LIKE ?";
        return $this->pdo->query($sql, ['%' . $str . '%']);
    }

}


?>