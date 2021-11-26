<?php
define("DB_CONFIG_FILE","config.php");
require "DBHandling.php";

class Database{

    use DBHandling;

    public function getEvents(){
        $erg = $this->selectFromDB("events","name, date, description", array(), "ORDER BY date DESC");
        return $erg;
    }

    public function getPartsFromEvent($name, $date){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlstatement = "SELECT parts.*, parts_to_event.position FROM parts_to_event 
                            LEFT JOIN events ON parts_to_event.eventID = events.id 
                            LEFT JOIN parts ON parts_to_event.partID = parts.id
                            WHERE events.name = ? AND events.date = ? ORDER BY parts_to_event.position";
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute(array($name, $date));
        $erg=array();
        while($row = $statement->fetch()) {
            $erg[]=$row;
        }
        return $erg;
    }

    public function getParts(){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlstatement = "SELECT parts.title, parts.type, parts.author, parts.album, parts.copyright, parts_to_event.position FROM parts, parts_to_event
                            GROUP BY parts.title, parts.author
                            ORDER BY parts.type, parts.title";
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute();
        $erg=array();
        while($row = $statement->fetch()) {
            $erg[]=$row;
        }
        return $erg;
    }

    public function getPartIDByTitleAndAuthor($title,$author){
        $erg = $this->selectFromDB("parts","id",array(array("title",$title),array("author",$author)));
        if(sizeof($erg)!=0) {
            return $erg[0]['id'];
        }
        return false;
    }

    public function getEventIDByNameAndDate($name,$date){
        $erg = $this->selectFromDB("events","id",array(array("name",$name),array("date",$date)));
        return $erg[0]['id'];
    }

    public function getSlides($partname){
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlstatement = "SELECT slides.* FROM slides 
                            LEFT JOIN parts ON slides.partID = parts.id 
                            WHERE parts.title = ? ORDER BY slides.position";
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute(array($partname));
        $erg=array();
        while($row = $statement->fetch()) {
            $data = (array) json_decode($row['data']);
            $data['style'] = $this->getSlideStyle($row['styleID']);
            $row['data'] = $data;
            $row['data'] = json_encode($row['data']);
            $erg[]=$row;
        }
        return $erg;
    }

    public function getSlide($title) {
        $data = $this->selectFromDB("slides", "*", array(array('title', $title)));
        return $data[0];
    }

    public function getStyle($name) {
        $data = $this->selectFromDB("slidestyle", "*", array(array('name', $name)));
        return $data[0];
    }

    public function deleteStyle($id) {
        $condition = array(
            array("id",$id),
        );
        $this->deleteFromDB("slidestyle",$condition); 
    }

    public function getSlideByStyle($id) {
        require DB_CONFIG_FILE;
        $pdo = new PDO($dns,$user,$psw);
        $sqlstatement = "SELECT * FROM slides WHERE slides.styleID =".$id.";";
        $statement = $pdo->prepare($sqlstatement);
        $statement->execute();
        $erg=array();
        while($row = $statement->fetch()) {
            $erg[]=$row;
        }
        return $erg;
    }

    protected function getSlideStyle(int $id = 1){
        $data = $this->selectFromDB("slideStyle","*",array(array("id",$id)));
        if(count($data)==0)$data = $this->selectFromDB("slideStyle","*",array(array("id",1)));
        $erg = array(
            "name" => $data[0]['name'],
            "verseFontSize" => (int) $data[0]['verseFontSize'],
            "verseSpacing" => (int) $data[0]['verseSpacing'],
            "copyrightFontSize" => (int) $data[0]['copyrightFontSize'],
            "copyrightColor" => $data[0]['copyrightColor'],
            "verseColor" => $data[0]['verseColor'],
            "backgroundColor" => $data[0]['backgroundColor'],
            "backgroundImage" => $data[0]['backgroundImage'],
        );
        return $erg;
    }

    public function getSlideStyles($withID = false) {
        $data = $this->selectFromDB("slideStyle", "*");
        $erg = array();
        foreach($data as $row) {
            if($withID) {
                array_push($erg, array(
                    "id" => (int) $row['id'],
                    "name" => $row['name'],
                    "verseFontSize" => (int) $row['verseFontSize'],
                    "verseSpacing" => (int) $row['verseSpacing'],
                    "copyrightFontSize" => (int) $row['copyrightFontSize'],
                    "copyrightColor" => $row['copyrightColor'],
                    "verseColor" => $row['verseColor'],
                    "backgroundColor" => $row['backgroundColor'],
                    
                    "backgroundImage" => $row['backgroundImage'],
                ));
            } else {
                array_push($erg, array(
                    "name" => $row['name'],
                    "verseFontSize" => (int) $row['verseFontSize'],
                    "verseSpacing" => (int) $row['verseSpacing'],
                    "copyrightFontSize" => (int) $row['copyrightFontSize'],
                    "copyrightColor" => $row['copyrightColor'],
                    "verseColor" => $row['verseColor'],
                    "backgroundColor" => $row['backgroundColor'],
                    
                    "backgroundImage" => $row['backgroundImage'],
                ));
            }

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

    public function addPart($data, $event = False){
        $input = array(
            array("title",$data['title']),
            array("type",$data['type']),
            array("copyright",$data['copyright'])
        );
        if(isset($data['author']))$input[] =  array("author",$data['author']);          
        if(isset($data['album']))$input[] =  array("album",$data['album']); 
        $this->writeInDB("parts",$input);
        if($event != False){
            $partID = $this->getPartIDByTitleAndAuthor($data['title'],$data['author']);
            $input = array(
                array("eventID",$event['eventID']),
                array("partID",$partID),
                array("position",$event['position']),
            );
            $this->writeInDB("parts_to_event",$input);
        }
    }

    public function addPartToEvent($partTitle, $partAuthor, $partPosition, $eventName, $eventDate){
        $partID = $this->getPartIDByTitleAndAuthor($partTitle,$partAuthor);
        $eventID = $this->getEventIDByNameAndDate($eventName,$eventDate);
        $input = array(
            array("eventID",$eventID),
            array("partID",$partID),
            array("position",$partPosition)
        );
        $this->writeInDB("parts_to_event",$input);
    }

    public function addSlide($data){
        $this->writeInDB("slides",$data);
    }

    public function addStyle($data) {
        $this->writeInDB('slidestyle', $data);
    }

    public function changePartPositionInEvent($eventID,$partID,$position){
        $input = array(
            array("position",$position)
        );
        $condition = array(
            array("eventID",$eventID),
            array("partID",$partID)
        );
        $this->updateDB("parts_to_event",$input,$condition);
    }

    public function updateEvent($name,$date,array $data){
        $condition = array(
            array("name",$name),
            array("date",$date)
        );
        $this->updateDB("events",$data,$condition);
    }

    public function updatePart($partID, array $data){ 
        $condition = array(
            array("id",$partID),
        );
        $this->updateDB("parts", $data, $condition);
    }

    public function updateSlide($partID, $oldTitle, $newTitle, $type, $data, $styleID){
        $condition = array(
            array("partID",$partID),
            array("title",$oldTitle)
        );
        $data = array(
            array("title", $newTitle),
            array("type", $type),
            array("data",$data),
            array("styleID", $styleID)
        );
        $this->updateDB("slides",$data,$condition);
    }

    public function updateStyle($name, $style) {
        $condition = array(
            array("name",$name),
        );
        $this->updateDB("slidestyle",$style,$condition);
    }

    public function deleteEvent($name,$date){
        $condition = array(
            array("name",$name),
            array("date",$date)
        );
        $this->deleteFromDB("events",$condition);
    }

    public function deletePart($title,$author){
        $id = $this->getPartIDByTitleAndAuthor($title,$author);
        $condition = array(
            array("id",$id)
        );
        $this->deleteFromDB("parts",$condition);
        $condition = array(
            array("partID",$id)
        );
        $this->deleteFromDB("parts_to_event",$condition);
        $this->deleteFromDB("slides",$condition);
    }

    public function deletePartFromEvent($eventID,$partID){
        $condition = array(
            array("eventID",$eventID),
            array("partID",$partID)
        );
        $this->deleteFromDB("parts_to_event",$condition);
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