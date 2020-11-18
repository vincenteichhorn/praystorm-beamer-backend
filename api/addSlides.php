<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['data']) AND isset($_POST['partTitle']) AND isset($_POST['partAuthor'])) {
        require 'db_handling/Database.php';
        $database = new Database();
        foreach($data as $row){
            $condition = array(
                array("partID",$database->getPartIDByTitleAndAutor($_POST['partTitle'],$_POST['partAuthor'])),
                array("title",$row['title'])
            );
            if($database->countElements("parts",$condition)==0){
                $database->addSlide($row);
            } else {
                header(RequestStatus::badRequest);
            }
        }
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}
?>