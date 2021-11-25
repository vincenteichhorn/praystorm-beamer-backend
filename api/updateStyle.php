<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['styleName']) && isset($_POST['styleData'])) {
        require 'db_handling/Database.php';
        $database = new Database();
        $name = $_POST['styleName'];
        $data = json_decode($_POST['styleData'], true);
        print_r($data);
        $database->updateStyle($name, array(
            array('name', $data['name']),
            array('backgroundImage', $data['backgroundImage']),
            array('backgroundColor', $data['backgroundColor']),
            array('verseFontSize', $data['verseFontSize']),
            array('verseSpacing', $data['verseSpacing']),
            array('copyrightFontSize', $data['copyrightFontSize']),
            array('copyrightColor', $data['copyrightColor']),
            array('verseColor', $data['verseColor']),
        ));
        
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}   
?>
