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
    }

    // создаем свой метод обработки ошибок
    public function errorHandler($errno, $errstr, $errfile, $errline){
        
        // return false;//ошибка передается дальше
        return true;//ошибка не передается дальше
    }

    protected function displayError($errno, $errstr, $errfile, $errline, $response = 500){
        http_response_code($response);
        if(DEBUG){

        }else{
            
        }
    }


    
}

new ErrorHandler();

echo $test;




?>