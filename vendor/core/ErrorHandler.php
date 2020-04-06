<?php 

namespace vendor\core;

class ErrorHandler {

    public function __construct() {
        if(DEBUG){
            error_reporting(-1);//-1 показывает все ошибки
        }else{
            error_reporting(0);//не показывает ошибки
        }
        // устанавливаем пользовательский обработчик ошибок
        set_error_handler([$this, 'errorHandler']);//вызов метода errorHandler
        ob_start();// включаем буфферизацию вывода (вывод скрипта сохраняется во внутреннем буфере)
        register_shutdown_function([$this, 'fatalErrorHandler']);// регистрируем функцию, которая выполняется после завершения работы скрипта (например, после фатальной ошибки)
        set_exception_handler([$this, 'exceptionHandler']);
    }
    
    /**
     * Обработчик ошибок
     * @param int $errno уровень ошибки
     * @param string $errstr сообщение об ошибке
     * @param string $errfile имя файла, в котором произошла ошибка
     * @param int $errline номер строки, в которой произошла ошибка
     * @return boolean
     */
    public function errorHandler($errno, $errstr, $errfile, $errline){ 
        //логируем ошибки 
        $this->logErrors($errstr, $errfile, $errline);     
        // error_log("[" . date('Y-m-d H:i:s') . "] Текст ошибки: {$errstr} | Файл: {$errfile}, | Строка: {$errline}\n-------------\n", 3, __DIR__ . '/errors.log');
        // выводим свое сообщение об ошибке
        $this->displayError($errno, $errstr, $errfile, $errline);
        // return false;//ошибка передается дальше

        // не запускаем внутренний обработчик ошибок PHP
        return true;//ошибка не передается дальше
    }
    
    /**
     * метод перехвата фатальных ошибок
     */
    public function fatalErrorHandler(){        
        $error = error_get_last();//получаем последнюю ошибку  
        // если была ошибка и она фатальна     
        if(!empty($error) && $error['type'] & ( E_ERROR | E_PARSE | E_COMPILE_ERROR | E_CORE_ERROR)){
            $this->logErrors($error['message'], $error['file'], $error['line']);
            // error_log("[" . date('Y-m-d H:i:s') . "] Текст ошибки: {$error['message']} | Файл: {$error['file']}, | Строка: {$error['line']}\n-------------\n", 3, __DIR__ . '/errors.log');            
            ob_end_clean();// очищаем буффер (не выводим стандартное сообщение об ошибке)
            $this->displayError($error['type'], $error['message'], $error['file'], $error['line']);
        }else{
            // отправка (вывод) буфера и его отключение
            ob_end_flush();
        }
    }

    //метод для обработки исключений
    public function exceptionHandler($e){  
        $this->logErrors($e->getMessage(), $e->getFile(), $e->getLine());          
        // error_log("[" . date('Y-m-d H:i:s') . "] Текст ошибки: {$e->getMessage()} | Файл: {$e->getFile()}, | Строка: {$e->getLine()}\n-------------\n", 3, __DIR__ . '/errors.log');      
        $this->displayError('Исключение', $e->getMessage(), $e->getFile(), $e->getLine(), $e->getCode());
    }

    /**
     * метод логирования ошибок
     */
    protected function logErrors($message = '', $file = '', $line = '') {
        error_log("[" . date('Y-m-d H:i:s') . "] Текст ошибки: {$message} | Файл: {$file}, | Строка: {$line}\n-------------\n", 3, ROOT . '/tmp/errors.log');  
    }

    protected function displayError($errno, $errstr, $errfile, $errline, $response = 500){
        http_response_code($response);
        if($response == 404){
            require WWW . '/errors/404.html';
            die;
        }
        if(DEBUG){
            require WWW . '/errors/dev.php';
        }else{
            require WWW . '/errors/prod.php';
        }
        die;
    }
}


?>