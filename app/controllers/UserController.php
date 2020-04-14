<?php

namespace app\controllers;

use app\models\User;
use fw\core\base\View;

class UserController extends AppController {

    public function signupAction(){
        if(!empty($_POST)){
            $user = new User();
            $data = $_POST;
            $user->load($data);
            if(!$user->validate($data)){
                $user->getErrors();
                redirect();
            }
            if($user->save('user')){
                $_SESSION['success'] = 'Вы успешно зарегистрированы';
            }else{
                $_SESSION['error'] = 'Ошибка! Попробуйте позже';
            }
            redirect();            
        }
        View::setMeta('Регистрация');
    }

    public function loginAction(){
        
    }

    public function logoutAction(){
        
    }

}



?>