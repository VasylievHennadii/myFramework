<?php 

namespace vendor\core;

/**
 * Description of Registry
 * 
 */
class Registry {
    public static $objects = [];

    protected static $instance;

    protected function __construct() {
        require_once ROOT . '/config/config.php';
        foreach($config['components'] as $name => $component) {
            self::$objects[$name] = new $component;
        }
    }

    /**
     * если в self::$instance ничего не записано, то мы в него запишем объект данного класса new self(в нем будет pdo с подключением)
     * реализация Паттерна (шаблона) проектирования Singleton
     */
    public static function instance() {
        if(self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }

    /**
     * метод __get
     */
    public function __get($name) {
        if(is_object(self::$objects[$name])){
            return self::$objects[$name];
        }
    }

    /**
     * метод __set
     */
    public function __set($name, $object) {
        if(!isset(self::$objects[$name])){
            self::$objects[$name] = new $object;
        }
    }

    public function getList(){
        echo'<pre>';
        var_dump(self::$objects);
        echo'</pre>';
    }
}


?>