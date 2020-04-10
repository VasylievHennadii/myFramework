<?php 

namespace app\controllers\admin;

use app\controllers\admin\AppController;

class UserController extends AppController {

    /**
     * метод для главной страницы админки
     */
    public function indexAction(){
        echo __METHOD__;
    }

    /**
     * метод для test страницы админки
     */
    public function testAction(){
        echo __METHOD__;
    }
}


?>