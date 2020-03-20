<?php 

namespace app\controllers;

use app\models\Main;

/**
 * Description of Main
 * 
 */
class MainController extends AppController{

    // public $layout = 'main';

    public function indexAction() {
       $model = new Main;
        $title = 'PAGE TITLE';
        $this->set(compact('title'));
    }

}







?>