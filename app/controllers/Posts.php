<?php 

namespace app\controllers;

use vendor\core\base\Controller;

/**
 * Description of Posts
 * 
 */
class Posts extends Controller {    

    public function indexAction() {
        echo 'Posts::index';
    }

    public function testAction() {
        debug($this->route);
        echo 'Posts::test';
    }
    
}







?>