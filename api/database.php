<?php
define("DB_CONFIG_FILE","config/config.php");
require "dbhandling.php";

class Database{

    use DBHandling;

    public function getEvents(){
        $erg = $this->selectFromDB("events","name, date, description");
        return $erg;
    }

    public function getParts($name,$date){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlstatement = "SELECT parts.* FROM parts LEFT JOIN events ON parts.eventID = events.id WHERE events.name = 'praystorm' AND events.date = '2020-04-04' ";
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute(array($name,$date));
        $erg=array();
        while($row = $statement->fetch()) {
            $erg[]=$row;
        }
        return $erg;
    }
}
?>