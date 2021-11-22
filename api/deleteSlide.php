<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['partTitle']) AND isset($_POST['partAuthor']) AND isset($_POST['slideTitle'])) {
        require 'db_handling/Database.php';
        $partTitle = $_POST['partTitle'];
        $partAuthor = $_POST['partAuthor'];
        $slideTitle = $_POST['slideTitle'];
        $database = new Database();
        $partID = $database->getPartIDByTitleAndAuthor($partTitle, $partAuthor);
        $database->deleteSlide($partID, $slideTitle);
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}
?>