<?php 

namespace app\controllers;

// use vendor\core\base\Controller;

/**
 * Description of Main
 * 
 */
class Main extends App{

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