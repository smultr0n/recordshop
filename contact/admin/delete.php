<?php
require_once("../database.php");
if(isset($_GET["id"])){
    $id = $_GET["id"];
    $stmt= $conn->prepare("DELETE FROM messages WHERE id = :id");
    $stmt->bindParam(":id", $id);
    $stmt->execute();
    echo "<div class='alert alert-danger'>Meddelande #" . $stmt->rowCount() . " har tagits bort</div>";    
} else{
    $stmt= $conn->prepare("DELETE FROM messages");  
    $stmt->execute();
    echo "<div class='alert alert-danger'>Alla meddelanden har tagits bort</div>";  
}
require_once("index.php");
require_once("../../footer.php");
