<?php 


/*Все ошибки, условно, можно разбить на категории по нескольким критериям.
Фатальность:
    *Фатальные
        Неустранимые ошибки. Работа скрипта прекращается.
        E_ERROR, E_PARSE, E_CORE_ERROR, E_COMPILE_ERROR.
    *Не фатальные
        Устранимые ошибки. Работа скрипта не прекращается.
        E_WARNING, E_NOTICE, E_CORE_WARNING, E_COMPILE_WARNING, E_USER_WARNING, E_USER_NOTICE, E_STRICT, E_DEPRECATED, E_USER_DEPRECATED.
    *Смешанные
        Фатальные, но только, если не обработаны функцией, определенной пользователем в set_error_handler().
        E_USER_ERROR, E_RECOVERABLE_ERROR.

Возможность перехвата ошибки функцией, определенной в set_error_handler():
    *Перехватываемые (не фатальные и смешанные)
        E_USER_ERROR, E_RECOVERABLE_ERROR, E_WARNING, E_NOTICE, E_USER_WARNING, E_USER_NOTICE, E_STRICT, E_DEPRECATED, E_USER_DEPRECATED.
    *Не перехватываемые (фатальные)
        E_ERROR, E_PARSE, E_CORE_ERROR, E_CORE_WARNING, E_COMPILE_ERROR, E_COMPILE_WARNING.
        
        Источник https://habr.com/ru/post/161483/   
        */


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
     * Обработчик не фатальных ошибок
     * @param int $errno уровень ошибки
     * @param string $errstr сообщение об ошибке
     * @param string $errfile имя файла, в котором произошла ошибка
     * @param int $errline номер строки, в которой произошла ошибка
     * @return boolean
     */
    public function errorHandler($errno, $errstr, $errfile, $errline){ 
        //логируем ошибки 
        $this->logErrors($errstr, $errfile, $errline); 

        //если включен режим отладки(DEBUG=1), мы останавливаем приложение при любой ошибке.
        //иначе (режим продакшн DEBUG=0) - мы ошибку логируем и не останавливаем приложение(исключение - смешанные ошибки вида E_USER_ERROR, E_RECOVERABLE_ERROR)
        if(DEBUG || in_array($errno, [E_USER_ERROR, E_RECOVERABLE_ERROR])){            
            $this->displayError($errno, $errstr, $errfile, $errline);
        }
        
        // return false;//ошибка передается дальше
        
        return true;//ошибка не передается дальше, не запускаем внутренний обработчик ошибок PHP
    }
    
    /**
     * метод перехвата фатальных ошибок
     */
    public function fatalErrorHandler(){        
        $error = error_get_last();//получаем последнюю ошибку  
        // если была ошибка и она фатальна     
        if(!empty($error) && $error['type'] & ( E_ERROR | E_PARSE | E_COMPILE_ERROR | E_CORE_ERROR)){
            $this->logErrors($error['message'], $error['file'], $error['line']);           
            ob_end_clean();// очищаем буфер (не выводим стандартное сообщение об ошибке)
            $this->displayError($error['type'], $error['message'], $error['file'], $error['line']);
        }else{
            // отправка (вывод) буфера и его отключение
            ob_end_flush();
        }
    }

    /**
     * метод для обработки исключений
     */    
    public function exceptionHandler($e){  
        $this->logErrors($e->getMessage(), $e->getFile(), $e->getLine());        
        $this->displayError('Исключение', $e->getMessage(), $e->getFile(), $e->getLine(), $e->getCode());
    }

    /**
     * метод логирования ошибок
     */
    protected function logErrors($message = '', $file = '', $line = '') {
        error_log("[" . date('Y-m-d H:i:s') . "] Текст ошибки: {$message} | Файл: {$file}, | Строка: {$line}\n-------------\n", 3, ROOT . '/tmp/errors.log');  
    }

    /**
     * метод остановки приложения и вывода ошибки
     */
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