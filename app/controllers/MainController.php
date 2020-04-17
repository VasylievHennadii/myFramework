<?php 

namespace app\controllers;

use app\models\Main;

use R;
use fw\core\App;
use fw\core\base\View;
use fw\libs\Pagination;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

/**
 * Description of Main
 * 
 */
class MainController extends AppController{

    // public $layout = 'main';

    public function indexAction() {  
        
        // create a log channel
        // $log = new Logger('name');
        // $log = new Logger('name');
        // $log->pushHandler(new StreamHandler(ROOT . '/tmp/your.log', Logger::WARNING));

        // add records to the log
        // $log->warning('Foo');
        // $log->error('Bar');

        // $mailer = new PHPMailer();
        // var_dump($mailer);

        $model = new Main;

        //реализация pagination
        $total = \R::count('posts');
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $perpage = 1;

        $pagination = new Pagination($page, $perpage, $total);
        $start = $pagination->getStart();




        // echo $test;
        // trigger_error("E_USER_ERROR", E_USER_ERROR);
        
        // // кеширование
        // $posts = App::$app->cache->get('posts');//получаем(возвращаем) данные из кеша методом get
        // //если данные не были возвращены, мы их получаем и заносим в кеш
        // if(!$posts) {
        //     $posts = \R::findAll('posts');//получаем данные из БД
        //     App::$app->cache->set('posts', $posts, 3600*24);// заносим в кеш (кешируется на 1 сутки)
        // }        
        // // App::$app->cache->set('posts', $posts);// кешируется на 1 час по дефолту        

        $posts = \R::findAll('posts', "LIMIT $start, $perpage");        
        $menu = $this->menu;       
        $title = 'PAGE TITLE';
        // $this->setMeta('Главная страница', 'Описание страницы', 'Ключевые слова');       
        // $meta = $this->meta;
        View::setMeta('Главная страница', 'Описание страницы', 'Ключевые слова');
        $this->set(compact('title', 'posts', 'menu', 'meta', 'pagination', 'total'));
    }

    public function testAction() {   
        if($this->isAjax()){
            $model = new Main();
            // $data = ['answer' => 'Ответ с сервера', 'code' => 200];
            // echo json_encode($data);
            $post = R::findOne('posts', "id = {$_POST['id']}");
            $this->loadView('_test', compact('post'));
            die;
        }
        echo 222;        
    }
}







?>