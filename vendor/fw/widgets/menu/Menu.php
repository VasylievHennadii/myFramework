<?php 

namespace vendor\widgets\menu;

use vendor\libs\Cache;

class Menu {

    protected $data; //простой массив с данными
    protected $tree; //массив дерево
    protected $menuHtml; //html код меню
    protected $tpl; //путь к шаблону, который используем для построения кода html меню
    protected $container = 'ul'; //родительский тег-обертка, в который оборачиваем наше меню(либо ul, либо select, либо что-то другое)
    protected $class = 'menu';
    protected $table = 'categories'; //таблица, из которой выбираются данные(по умолчанию - таблица категорий)
    protected $cache = 3600; //кеширование меню, время в сек
    protected $cacheKey = 'fw_menu';

    public function __construct($options = []) {
        $this->tpl = __DIR__ . '/menu_tpl/menu.php';
        $this->getOptions($options);
        $this->run();
    }

    /**
     * метод для использования protected $tpl
     * метод на вход принимает массив настроек
     */
    protected function getOptions($options){
        foreach($options as $k => $v){
            //если есть такое свойство виджета, то заполняем его переданным значением. Иначе - остаются по умолчанию
            if(property_exists($this, $k)){
                $this->$k = $v;
            }
        }
    }

    /**
     * метод для использования protected $container
     */
    protected function output(){
        echo "<{$this->container} class='{$this->class}'>";
            echo $this->menuHtml;
        echo "</{$this->container}>";
    }

    /**
     * метод запускает все прочие методы, строящие для нас меню
     */
    protected function run(){
        $cache = new Cache();
        $this->menuHtml = $cache->get($this->cacheKey);
        if(!$this->menuHtml){
            //получаем массив $data используя redBeanPHP
            $this->data = \R::getAssoc("SELECT * FROM {$this->table}"); //вернет массив из БД, ключом которого является первый элемент(здесь это id)

            //получаем дерево
            $this->tree = $this->getTree();
            
            $this->menuHtml = $this->getMenuHtml($this->tree);
            $cache->set($this->cacheKey, $this->menuHtml, $this->cache);
        }        
        $this->output();
    }

    /**
     * метод получающий целиком дерeво из данного массива
     */
    protected function getTree(){
        $tree = [];
        $data = $this->data;
        foreach ($data as $id=>&$node) {    
            if (!$node['parent']){
                $tree[$id] = &$node;
            }else{ 
                $data[$node['parent']]['childs'][$id] = &$node;
            }
        }
	    return $tree;
    }

    /**
     * метод построения Html кода меню
     * на каждой итерации передается не всё дерево, а только childs
     */
    protected function getMenuHtml($tree, $tab = ''){
        $str = '';
        foreach($tree as $id => $category){
            $str .= $this->catToTemplate($category, $tab, $id);
        }
        return $str;
    }

    /**
     * отправка категории в шаблон
     */
    protected function catToTemplate($category, $tab, $id){
        ob_start(); //включаем буферизацию, нужно возвращать html код, а не выводить на экран

        //подключаем некий шаблон
        require $this->tpl;

        return ob_get_clean(); //вовращаем и очищаем буфер
    }


}





?>