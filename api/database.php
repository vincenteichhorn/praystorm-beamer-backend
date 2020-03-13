<?php

require "dbhandling.php";

class Database{

    use DBHandling;

    public function getEvents(){
        $erg = $this->selectFromDB("events","name, date, description");
        return $erg;
    }

    public function getParts($name,$date){
        $erg = $this->selectFromDB("events","*");
        return $erg;
    }
}
?>