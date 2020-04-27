<?php 

namespace fw\core\base;

/**
 * базовый класс Lang в ядре нашего фреймворка
 */

class Lang {

    public static $lang_data = []; //в массиве будут лежать переводные фразы для данной страницы
    public static $lang_layout = []; //в массиве будут лежать переводные фразы для шаблона(шапка,футер, сайдбар)
    public static $lang_view = []; //в массиве будут лежать переводные фразы для контента

    /**
     * метод принимает 2 параметра: код языка и вид из базового класса View
     * 
     */
    public static function load($code, $view){        
        $lang_layout = APP . "/langs/{$code['code']}.php";//путь app\langs\ru.php
        $lang_view = APP . "/langs/{$code['code']}/{$view['controller']}/{$view['action']}.php";
        if(file_exists($lang_layout)){
            self::$lang_layout = require_once $lang_layout;
        }
        if(file_exists($lang_view)){
            self::$lang_view = require_once $lang_view;
        }
        self::$lang_data = array_merge(self::$lang_layout, self::$lang_view);
    }

    /**
     * метод возвращает языковую фразу по ключу
     */
    public static function get($key){
        return isset(self::$lang_data[$key]) ? self::$lang_data[$key] : $key;
    }

}





?>