<?php 

namespace app\controllers\admin;

use app\controllers\admin\AppController;
use fw\core\base\View;

class UserController extends AppController {

    // public $layout = 'default';

    /**
     * метод для главной страницы админки
     */
    public function indexAction(){
        View::setMeta('Админка :: Главная страница', 'Описание админки', 'Ключевики админки');
        $test = 'Тестовая переменная';
        $data = ['test', '2'];

        //один способ вывода данных
        // $this->set([
        //     'test' => $test,
        //     'data' => $data,
        // ]);

        //другой способвывода данных
        $this->set(compact('test', 'data'));

    }

    /**
     * метод для test страницы админки
     */
    public function testAction(){
        // $this->layout = 'admin';
    }
}


?>