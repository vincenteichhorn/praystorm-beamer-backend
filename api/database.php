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
        $sqlstatement = "SELECT parts.* FROM parts_to_event 
                            LEFT JOIN events ON parts_to_event.eventID = events.id 
                            LEFT JOIN parts ON parts_to_event.partID = parts.id
                            WHERE events.name = ? AND events.date = ? ORDER BY parts.position";
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute(array($name,$date));
        $erg=array();
        while($row = $statement->fetch()) {
            $erg[]=$row;
        }
        return $erg;
    }

    public function getPartIDByTitle($title){
        $erg = $this->selectFromDB("parts","id",array(array("title",$title)));
        return $erg[0]['id'];
    }

    public function getSlides($partname){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlstatement = "SELECT * FROM slides LEFT JOIN parts ON slides.partID = parts.id WHERE parts.title = ? ORDER BY slides.position";
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
            array("title",$data['title']),
            array("type",$data['type']),
            array("copyright",$data['copyright']),
        );
        if(isset($data['author']))$input[] =  array("author",$data['author']);          
        if(isset($data['album']))$input[] =  array("album",$data['album']); 
        $this->writeInDB("parts",$input);
    }

    public function addSlide($data){
        $input = array(
            array("partID",$data['partID']),
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

    public function updateSlide($partID,$title,array $data){
        $condition = array(
            array("partID",$partID),
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

    public function deletePart($title){
        $id = $this->getPartIDByTitle($title);
        $condition = array(
            array("id",$id),
        );
        $this->deleteFromDB("parts",$condition);
        $condition = array(
            array("partID",$id),
        );
        $this->deleteFromDB("parts_to_event",$condition);
        $this->deleteFromDB("slides",$condition);
    }

    public function deleteSlide($partID,$title){
        $condition = array(
            array("partID",$partID),
            array("title",$title)
        );
        $this->deleteFromDB("slides",$condition);
    }

    
}
?>