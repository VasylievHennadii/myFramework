<?php

namespace vendor\core\base;

/**
 * Description of View
 * 
 */
class View {

    /**
     * текущий маршрут и параметры (controller, action, params)
     * @var array
     */
    public $route = [];

    /**
     * текущий вид
     * @var string
     */
    public $view;

    /**
     * текущий шаблон
     * @var string
     */
    public $layout;

    public $scripts = [];

    public function __construct($route, $layout = '', $view = '') {       
        $this->route = $route;
        if($layout === false){
            $this->layout = false;
        }else{
            $this->layout = $layout ?: LAYOUT;
        }
        // $this->layout = $layout ?: LAYOUT;//если $layout не пустая строка - используем его, иначе - константа LAYOUT
        $this->view = $view;        
    }

    public function render($vars) {
        if(is_array($vars)){
            extract($vars);
        } 
        $file_view = APP . "/views/{$this->route['controller']}/{$this->view}.php";
        ob_start();//функция буферизации
        if(is_file($file_view)){           
            require $file_view;
        }else{
            echo "<p>Не найден вид<b>$file_view</b></p>";
        }
        $content = ob_get_clean();//очищает буфер обмена и складывает в $content  
        
        if(false !== $this->layout){
            $file_layout = APP . "/views/layouts/{$this->layout}.php";//подключение шаблона
            if(is_file($file_layout)){  
                $content = $this->getScript($content);         
                require $file_layout;
            }else{
                echo "<p>Не найден шаблон<b>$file_layout</b></p>";
            }
        }        
    }

    //метод ищет скрипты, вырезает скрипты из вида если они есть, и возвращает $content без скриптов
    protected function getScript($content){
        $pattern = "#<script.*?>.*?</script>#si";
        preg_match_all($pattern, $content, $this->scripts);
        if(!empty($this->scripts)){
            $content = preg_replace($pattern, '', $content);
        }
        return $content;
    }

}




?>