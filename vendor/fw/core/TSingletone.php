<?php 

namespace fw\core;

/**
 * использование трейдов
 * снипет код, который подключается к различным классам
 */

trait TSingletone {
    
    protected static $instance;

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
}




?>