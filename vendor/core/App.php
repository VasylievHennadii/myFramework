<?php 

namespace vendor\core;

use vendor\core\Registry;

/**
 * Description of App
 * 
 */
class App {

    public static $app;

    public function __construct() {
        self::$app = Registry::instance();
    }

}



?>