<?php 

namespace vendor\libs;

/**
 * Description of Cache
 * 
 */
class Cache {

    public function __construct() {
        
    }
    
    /**
     * метод для записи данных в файл Cache
     * $seconds - время, на которое сохраняются данные кеш
     */
    public function set($key, $data, $seconds = 3600){
        //сначала провепяем актуальны ли данные кеш; если да - кладем данные в папку tmp/cache
        $content['data'] = $data;
        $content['end_time'] = time() + $seconds; //time() - это текущее время
        if(file_put_contents(CACHE . '/' . md5($key) . 'txt', serialize($content))){
            return true;
        }
        return false;

    }

    /**
     * метод для чтения данных из файла Cache
     */
    public function get(){

    }

    /**
     * метод для удаления данных из файла Cache
     */

}




?>