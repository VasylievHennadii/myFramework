<?php 

namespace app\controllers;

use app\models\Main;
use vendor\core\base\Controller;

use R;

/**
 * Description of PostsNew
 * 
 */
class AppController extends Controller {

    public $menu;

    public function __construct ($route) {
        parent::__construct($route);
        if($this->route['action'] == 'test'){
            echo '<h1>TEST</h1>';//даёт надпись TEST только на странице http://myframework/main/test
        }
        new Main;
        $this->menu = \R::findAll('category');
    }

}







?>