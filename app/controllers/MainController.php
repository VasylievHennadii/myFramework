<?php 

namespace app\controllers;

use app\models\Main;

use R;
use vendor\core\App;

/**
 * Description of Main
 * 
 */
class MainController extends AppController{

    // public $layout = 'main';

    public function indexAction() {       
        // R::fancyDebug(true);
        $model = new Main;  

        // // кеширование
        // $posts = App::$app->cache->get('posts');//получаем(возвращаем) данные из кеша методом get
        // //если данные не были возвращены, мы их получаем и заносим в кеш
        // if(!$posts) {
        //     $posts = \R::findAll('posts');//получаем данные из БД
        //     App::$app->cache->set('posts', $posts, 3600*24);// заносим в кеш (кешируется на 1 сутки)
        // }        
        // // App::$app->cache->set('posts', $posts);// кешируется на 1 час по дефолту        
        
        $posts = \R::findAll('posts');
        $post = \R::findOne('posts', 'id = 1');
        $menu = $this->menu;       
        $title = 'PAGE TITLE';
        $this->setMeta('Главная страница', 'Описание страницы', 'Ключевые слова');       
        $meta = $this->meta;
        $this->set(compact('title', 'posts', 'menu', 'meta'));
    }

    public function testAction() {       
        $this->layout = 'test';
    }
}







?>