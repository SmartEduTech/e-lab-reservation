<?php
namespace blocapp\modules\smarthome\Controllers;

use  Smartedutech\Littlemvc\mvc\Controller;
use  Smartedutech\Littlemvc\mvc\View;
use  Smartedutech\Littlemvc\dbadapter;
use  Smartedutech\Littlemvc\Utils; 

class Smarthome extends Controller
{
    public function door(){
        $Vue=new View();
        $Vue->setlayout("smarthome");  
        $Vue->pagetitle="smart";
        $Vue->generate();   
    }
}