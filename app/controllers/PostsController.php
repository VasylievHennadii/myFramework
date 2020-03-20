<?php 

namespace app\controllers;

// use vendor\core\base\Controller;

/**
 * Description of Posts
 * 
 */
class PostsController extends AppController {    

    public function indexAction() {
        echo 'Posts::index';
    }

    public function testAction() {
        debug($this->route);
        echo 'Posts::test';
    }
    
}







?>