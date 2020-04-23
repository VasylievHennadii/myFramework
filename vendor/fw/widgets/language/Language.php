<?php 

namespace fw\widgets\Language;

use fw\core\App;
use R;

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
        $this->languages = App::$app->getProperty('langs');
        $this->language = App::$app->getProperty('lang');
        echo $this->getHtml();
    }

    /**
     * метод получает из БД список языков
     */
    public static function getLanguages(){
        return R::getAssoc("SELECT code, title, base FROM languages ORDER BY base DESC");
    }

    /**
     * метод получает активный язык
     * хранение в куках
     */
    public static function getLanguage($languages){
        if(isset($_COOKIE['lang']) && array_key_exists($_COOKIE['lang'], $languages)){
            $key = $_COOKIE['lang'];
        }else{
            $key = key($languages);
        }
        $lang = $languages[$key];
        $lang['code'] = $key;
        return $lang;
    }

    /**
     * метод получает Html код вывода языков
     */
    protected function getHtml(){
        ob_start();
        require_once $this->tpl;
        return ob_get_clean();
    }
}




?>