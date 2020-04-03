<?php

namespace vendor\core\base;

/**
 * Description of Controller
 * 
 */
abstract class Controller {

    /**
     * текущий маршрут и параметры (controller, action, params)
     * @var array
     */
    public $route = [];

    /**
     * вид
     * @var string
     */
    public $view;

    /**
     * текущий шаблон
     * @var string
     */
    public $layout;

    /**
     * пользовательские данные
     * @var array
     */
    public $vars = [];

    public function __construct($route) {
        $this->route = $route;
        $this->view = $route['action'];
    }

    public function getView() {
        $vObj = new View($this->route, $this->layout, $this->view);
        $vObj->render($this->vars);
    }

    public function set($vars){
        $this->vars = $vars;
    }

    //метод проверяет поступили ли данные асинхронно и возвращает true
    public function isAjax(){
        return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] === 'XMLHttpRequest';
    }

    //метод для подключения вида
    public function loadView($view, $vars = []){
        extract($vars);
        require APP . "/views/{$this->route['controller']}/{$view}.php";
    }

}
 







?>