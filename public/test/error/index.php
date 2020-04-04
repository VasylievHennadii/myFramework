<?php 

/**
 * 
 */

define("DEBUG", 1);//1-режим разработки; 0-боевой режим

class ErrorHandler {

    public function __construct() {
        if(DEBUG){
            error_reporting(-1);//-1 показывает все ошибки
        }else{
            error_reporting(0);//не показывает ошибки
        }
        set_error_handler([$this, 'errorHandler']);//вызов метода errorHandler
        ob_start();
        register_shutdown_function([$this, 'fatalErrorHandler']);
    }

    // создаем свой метод обработки ошибок
    public function errorHandler($errno, $errstr, $errfile, $errline){
        $this->displayError($errno, $errstr, $errfile, $errline);
        // return false;//ошибка передается дальше
        return true;//ошибка не передается дальше
    }

    //метод для получения фатальных ошибок
    public function fatalErrorHandler(){
        $error = error_get_last();//получаем последнюю ошибку
        if(!empty($error) && $error['type'] & ( E_ERROR | E_PARSE | E_COMPILE_ERROR | E_CORE_ERROR)){
            ob_end_clean();//очищаем буфер обмена
            $this->displayError($error['type'], $error['message'], $error['file'], $error['line']);
        }else{
            ob_end_flush();
        }
    }

    protected function displayError($errno, $errstr, $errfile, $errline, $response = 500){
        http_response_code($response);
        if(DEBUG){
            require 'views/dev.php';
        }else{
            require 'views/prod.php';
        }
        die;
    }


    
}

new ErrorHandler();

// echo $test;

test();




?>