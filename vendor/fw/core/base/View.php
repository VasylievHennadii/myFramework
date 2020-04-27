<?php

namespace fw\core\base;

use fw\core\App;

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

    public static $meta = ['title' => '', 'desc' => '', 'keywords' => ''];

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

    /**
     * метод сжатия данных
     */
    protected function compressPage($buffer){
       
        $search = [
            "/(\n)+/",
            "/\r\n+/",
            "/\n(\t)+/",
            "/\n(\ )+/",
            "/\>(\n)+</",
            "/\>\r\n</",
        ];
        $replace = [
            "\n",
            "\n",
            "\n",
            "\n",
            '><',
            '><',
        ];
        return preg_replace($search, $replace, $buffer);
    }

    public function render($vars) {   
        Lang::load(App::$app->getProperty('lang'), $this->route);     
        $this->route['prefix'] = str_replace('\\', '/', $this->route['prefix']);       
        if(is_array($vars)){
            extract($vars);
        } 
        $file_view = APP . "/views/{$this->route['prefix']}{$this->route['controller']}/{$this->view}.php";

        ob_start([$this, 'compressPage']);// 1 вариант - функция сжатия данных с помощью нашего метода compressPage
        // ob_start('ob_gzhandler');// 2** вариант - архивация данных с помощью встроенных методов браузера ob_gzhandler
        {
            // header("Content-Encoding: gzip");//2** вариант - архивация данных с помощью встроенных методов браузера ob_gzhandler
            if(is_file($file_view)){           
                require $file_view;
            }else{
                // echo "<p>Не найден вид<b>$file_view</b></p>";
                throw new \Exception("<p>Не найден вид<b>$file_view</b></p>", 404);
            }
    
            $content = ob_get_contents();
        }        
        ob_clean();
        // $content = ob_get_clean();//очищает буфер обмена и складывает в $content  
        
        if(false !== $this->layout){
            $file_layout = APP . "/views/layouts/{$this->layout}.php";//подключение шаблона
            if(is_file($file_layout)){  
                $content = $this->getScript($content); 
                $scripts = [];
                if(!empty($this->scripts[0])){
                    $scripts = $this->scripts[0];
                }             
                require $file_layout;
            }else{
                // echo "<p>Не найден шаблон<b>$file_layout</b></p>";
                throw new \Exception("<p>Не найден шаблон<b>$file_layout</b></p>", 404);
            }
        }        
    }

    /**
     * метод ищет скрипты, вырезает скрипты из вида если они есть, и возвращает $content без скриптов
     */    
    protected function getScript($content){
        $pattern = "#<script.*?>.*?</script>#si";
        preg_match_all($pattern, $content, $this->scripts);
        if(!empty($this->scripts)){
            $content = preg_replace($pattern, '', $content);
        }
        return $content;
    }

    /**
     * метод будет получать и возвращать метаданные(формирует HTML код)
     */    
    public static function getMeta(){
        echo '<title>' . self::$meta['title'] . '</title>
        <meta name="description" content="' . self::$meta['desc'] . '">
        <meta name="keywords" content="' . self::$meta['keywords'] . '">';
    }

    /**
     * метод будет устанавливать метаданные
     */   
    public static function setMeta($title = '', $desc = '', $keywords = ''){
        self::$meta['title'] = $title;
        self::$meta['desc'] = $desc;
        self::$meta['keywords'] = $keywords;
    }

    /**
     * метод включает SIDEBAR
     */
    public function getPart($file){
        $file = APP . "/views/{$file}.php";//подключение шаблона
        if(is_file($file)){             
            require_once $file;
        }else{
            echo "File {$file} not found...";
        }
    }

}




?>