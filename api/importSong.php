<?php
$uploadfile = "tmpdata/tmpsongfile.txt";

echo '<pre>';
if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
    echo "Datei ist valide und wurde erfolgreich hochgeladen.\n";
} else {
    echo "Möglicherweise eine Dateiupload-Attacke!\n";
}
$handle = fopen ( "../data/wunsch.txt", "r" );
$inhalt = fgets($handle);
echo "<ul>";
echo "<li> $inhalt </li>";
while($inhalt=fgets($handle,4096)){
    echo "<li> $inhalt </li>";
}
echo "</ul>";
fclose($handle);

print "</pre>";
?>