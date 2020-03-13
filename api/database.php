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
        $sqlstatement = "SELECT parts.* FROM parts LEFT JOIN events ON parts.eventID = events.id WHERE events.name = ? AND events.date = ? ORDER BY parts.position";
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute(array($name,$date));
        $erg=array();
        while($row = $statement->fetch()) {
            $erg[]=$row;
        }
        return $erg;
    }

    public function getSlides($partname){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlstatement = "SELECT * FROM slides LEFT JOIN parts ON slides.part_id = parts.id WHERE parts.title = ? ORDER BY slides.position";
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute(array($partname));
        $erg=array();
        while($row = $statement->fetch()) {
            $erg[]=$row;
        }
        return $erg;
    }

    public function addEvent($data){
        $input = array(
            array("name",$data['name']),
            array("description",$data['description']),
            array("date",$data['date'])
        );
        $this->writeInDB("events",$input);
    }

    public function addPart($data){
        $input = array(
            array("eventID",$data['eventID']),
            array("title",$data['title']),
            array("position",$data['position']),
            array("type",$data['type']),
            array("author",$data['author']),
            array("album",$data['album']),
            array("copyright",$data['copyright']),
        );
        $this->writeInDB("parts",$input);
    }

    public function addSlide($data){
        $input = array(
            array("part_id",$data['part_id']),
            array("title",$data['title']),
            array("shorthand",$data['shorthand']),
            array("position",$data['position']),
            array("type",$data['type']),
            array("data",$data['data'])
        );
        $this->writeInDB("slides",$input);
    }

    public function updateEvent($name,$date,array $data){
        $condition = array(
            array("name",$name),
            array("date",$date)
        );
        $this->updateDB("events",$data,$condition);
    }

    public function updatePart($eventID,$title,array $data){
        $condition = array(
            array("eventID",$eventID),
            array("title",$title)
        );
        $this->updateDB("parts",$data,$condition);
    }

    public function updateSlide($part_id,$title,array $data){
        $condition = array(
            array("part_id",$part_id),
            array("title",$title)
        );
        $this->updateDB("slides",$data,$condition);
    }

    public function deleteEvent($name,$date){
        $condition = array(
            array("name",$name),
            array("date",$date)
        );
        $this->deleteFromDB("events",$condition);
    }

    public function deletePart($eventID,$title){
        $condition = array(
            array("eventID",$eventID),
            array("title",$title)
        );
        $this->deleteFromDB("parts",$condition);
    }

    public function deleteSlide($part_id,$title){
        $condition = array(
            array("part_id",$part_id),
            array("title",$title)
        );
        $this->deleteFromDB("slides",$condition);
    }
}
?>