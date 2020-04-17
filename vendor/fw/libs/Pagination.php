<?php 

namespace fw\libs;

/**
 * Description of Pagination
 * 
 */
class Pagination {

    public $currentPage; //текущая страница
    public $perpage; // сколько записей на одной странице
    public $total; //общее количество записей из БД
    public $countPages; //общее количество страниц
    public $uri; //базовый адрес,в который добавляем пагинацию

    public function __construct($page, $perpage, $total){
        $this->perpage = $perpage;
        $this->total = $total;
        $this->countPages = $this->getCountPages();
        $this->currentPage = $this->getCurrentPage($page);
        $this->uri = $this->getParams();

    }

    /**
     * метод приводит объект к строке
     */
    public function __toString(){
        return $this->getHtml();
    }

    /**
     * метод возвращает готовый Html код
     * формирует строку с пагинацией
     */
    public function getHtml(){
        $back = null; //ссылка НАЗАД
        $forward = null; //ссылка ВПЕРЕД
        $startpage = null; //ссылка в НАЧАЛО
        $endpage = null; //ссылка в КОНЕЦ
        $page2left = null; //вторая страница слева
        $page1left = null; // первая страница слева
        $page2right = null; // вторая страница справа
        $page1right = null; // первая страница справа

        if($this->currentPage > 1){
            $back = "<li><a class='nav-link' href='{$this->uri}page=" . ($this->currentPage - 1). "'>&lt;</a></li>";
        }

        if($this->currentPage < $this->countPages){
            $forward = "<li><a class='nav-link' href='{$this->uri}page=" . ($this->currentPage + 1). "'>&gt;</a></li>";
        }

        if($this->currentPage > 3){
            $startpage = "<li><a class='nav-link' href='{$this->uri}page=1'>&laquo;</a></li>";
        }

        if($this->currentPage < ($this->countPages - 2)){
            $endpage = "<li><a class='nav-link' href='{$this->uri}page={$this->countPages}'>&raquo;</a></li>";
        }

        if($this->currentPage - 2 > 0){
            $page2left = "<li><a class='nav-link' href='{$this->uri}page=" . ($this->currentPage-2). "'>" .($this->currentPage - 2). "</a></li>";
        }

        if($this->currentPage - 1 > 0){
            $page1left = "<li><a class='nav-link' href='{$this->uri}page=" . ($this->currentPage-1). "'>" .($this->currentPage - 1). "</a></li>";
        }

        if($this->currentPage + 1 <= $this->countPages){
            $page1right = "<li><a class='nav-link' href='{$this->uri}page=" . ($this->currentPage+1). "'>" .($this->currentPage + 1). "</a></li>";
        }

        if($this->currentPage + 2 <= $this->countPages){
            $page2right = "<li><a class='nav-link' href='{$this->uri}page=" . ($this->currentPage+2). "'>" .($this->currentPage + 2). "</a></li>";
        }

        return '<ul class="pagination">' . $startpage.$back.$page2left.$page1left.'<li class="active"><a>'.$this->currentPage.'</a></li>'.$page1right.$page2right.$forward.$endpage. '</ul>';
    }

    /**
     * метод возвращает общее количество страниц = total/perpage, округленное в большую сторону
     */
    public function getCountPages(){
        return ceil($this->total / $this->perpage) ?: 1;
    }

    /**
     * метод защищает от недобросовестного пользователя и выдает текущую страницу
     */
    public function getCurrentPage($page){
        if(!$page || $page < 1) $page = 1;
        if($page > $this->countPages) $page = $this->countPages;
        return $page;
    }

    /**
     * метод возвращает, с какой записи мы должны начинать выборку((1-1)*2 -> с 0 страницы, (2-1)*2 -> со 2 и т.д.)
     */
    public function getStart(){
        return ($this->currentPage - 1) * $this->perpage;
    }

    /**
     * метод вырезает page=2 и возвращает только дополнительные параметры, если они есть
     * пример: принимает site/category/phones/?page=2&lang=en 
     * возвращает uri = site/category/phones/?&lang=en
     */
    public function getParams(){
        $url = $_SERVER['REQUEST_URI'];
        $url = explode('?', $url);
        $uri = $url[0] . '?';
        if(isset($url[1]) && $url[1] != ''){
            $params = explode('&', $url[1]);
            foreach($params as $param){
                if(!preg_match("#page=#", $param)) $uri .= "{$param}&amp;";
            }
        }
        return $uri;
    }

}






?>