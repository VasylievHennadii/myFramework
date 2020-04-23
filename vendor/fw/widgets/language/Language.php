<?php 

namespace fw\core\Language;

class Language{

    protected $tpl; //путь к шаблону
    protected $languages; //список языков
    protected $language; //активный на данный момент язык

    public function __construct(){
        $this->tpl = __DIR__ . '/lang_tpl.php';
        $this->run();
    }
    
    /**
     * в методе run вызывается метод, который вернет вывод языков
     */
    protected function run(){

    }

    /**
     * метод получает из БД список языков
     */
    public static function getLanguages(){

    }

    /**
     * метод получает активный язык
     */
    public static function getLanguage($languages){

    }

    /**
     * метод получает Html код вывода языков
     */
    protected function getHtml(){
        
    }
}




?>