<?php 

namespace fw\core;

use fw\core\Registry;
use fw\core\ErrorHandler;

/**
 * Description of App
 * 
 */
class App {

    public static $app;

    public function __construct() {
        session_start();
        self::$app = Registry::instance();
        new ErrorHandler();
    }

}



?>