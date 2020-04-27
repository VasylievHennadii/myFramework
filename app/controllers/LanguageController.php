<?php 

namespace app\controllers;

use fw\core\App;

/**
 * контроллер для переключения языков, записывает в куки на неделю для всего сайта
 * 
 */

class LanguageController extends AppController {

    public function changeAction() {
        $lang = !empty($_GET['lang']) ? $_GET['lang'] : null;
        if($lang){
            if(array_key_exists($lang, App::$app->getProperty('langs'))){
                setcookie('lang', $lang, time() + 3600*24*7, '/');
            }
        }
        redirect();
    }

}






?>