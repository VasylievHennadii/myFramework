<?php 

namespace app\controllers;

/**
 * Description of Main
 * 
 */
class MainController extends AppController{

    // public $layout = 'main';

    public function indexAction() {
        // $this->layout = false;
        // $this->layout = 'main';
        // $this->view = 'test';
        $name = 'Андрей';
        $hi = 'Hello';
        $colors = [
            'white' => 'белый',
            'black' => 'черный',
        ];
        $title = 'PAGE TITLE';
        $this->set(compact('name', 'hi', 'colors', 'title'));
    }

}







?>