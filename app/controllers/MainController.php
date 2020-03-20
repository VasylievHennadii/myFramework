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
       //скопировали рандомную таблицу "publications.publications" себе в таблицу posts 
    //    $res = $model->query("CREATE TABLE posts SELECT * FROM publications.publications"); 
        $posts = $model->findAll() ;
        debug($posts);    
        $title = 'PAGE TITLE';
        $this->set(compact('title'));
    }

}







?>