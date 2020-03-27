<?php 

namespace app\controllers;

use app\models\Main;
use vendor\core\base\Controller;

use R;

/**
 * Description of PostsNew
 * 
 */
class AppController extends Controller {

    public $menu;
    public $meta = [];

    public function __construct ($route) {
        parent::__construct($route);
        if($this->route['controller'] == 'Main' && $this->route['action'] == 'test'){
            echo '<h1>TEST</h1>';//даёт надпись TEST только на странице контроллера Main  http://myframework/main/test
        }
        new Main;
        $this->menu = \R::findAll('category');
    }

    /**
     * метод для заполнения метаданных
     */
    protected function setMeta($title = '', $desc = '', $keywords = '') {
        $this->meta['title'] = $title;
        $this->meta['desc'] = $desc;
        $this->meta['keywords'] = $keywords;
    }

}







?>