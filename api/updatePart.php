<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['oldPartTitle']) AND (isset($_POST['partTitle']) AND isset($_POST['oldPartAuthor']) AND isset($_POST['partAuthor']))) {
        require 'db_handling/Database.php';
        $database = new Database();
        echo $partID = $database->getPartIDByTitleAndAutor($_POST['oldPartTitle'],$_POST['oldPartAuthor']);
        if(!$partID) {
            header(RequestStatus::badRequest);
        } else {
            $condition = array(
                array("partID", $partID),
            );
            $data = array(
                array("title", $_POST['partTitle']),
                array("type", $_POST['partType']),
                array("author", $_POST['partAuthor']),
                array("album", $_POST['partAlbum']),
                array("copyright", $_POST['partCopyright']),
                array("indivSeq", $_POST['partPosition']),
            );
            $database->updatePart($partID, $data);
        }
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}
?>