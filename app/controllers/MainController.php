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
        $posts = $model->findAll(); 
        $posts2 = $model->findAll();
        // $post = $model->findOne(3);// выбор по id=3
        // $post = $model->findOne('Погода', 'title');
        // $post = $model->findOne('Слава');
        // debug($post);
        $title = 'PAGE TITLE';
        $this->set(compact('title', 'posts'));
    }

}







?>