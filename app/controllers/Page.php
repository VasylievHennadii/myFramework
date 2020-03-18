<?php 

namespace app\controllers;

// use vendor\core\base\Controller;

/**
 * Description of Page
 * 
 */
class Page extends App {

    public function viewAction() {
        debug($this->route);
        debug($_GET);
        echo $_GET['page'];
        echo 'Page::view';
    }
    
}




?>