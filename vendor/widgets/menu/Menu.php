<?php 

namespace vendor\widgets\menu;

class Menu {

    protected $data;//простой массив с данными
    protected $tree;//массив дерево
    protected $menuHtml;//html код меню
    protected $tpl;// путь к шаблону, который используем для построения кода html меню
    protected $container;//родительский тег-обертка, в который оборачиваем наше меню(либо ul, либо select, либо что-то другое)
    protected $table;//таблица, из которой выбираются данные(по умолчанию - таблица категорий)
    protected $cache;//кеширование меню

    public function __construct() {
        $this->run();
    }

    /**
     * метод запускает все прочие методы, строящие для нас меню
     */
    protected function run(){
        //получаем массив $data используя redBeanPHP
        $this->data = \R::getAssoc("SELECT * FROM categories");//вернет массив из БД, ключом которого является первый элемент(здесь это id)
        $this->tree = $this->getTree();
        debug($this->tree);
    }

    /**
     * метод получающий дерeво из данного массива
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


}





?>