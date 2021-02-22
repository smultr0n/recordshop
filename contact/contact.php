<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link href="../style.css" rel="stylesheet">
</head>
<body>
<div class="container">
<div class="row">
    <a href="../index.php" class="col header-link">Produkter</a><a href="contact.php" class="col header-link">Kontakt</a>
</div>
<div class="row">
    <h1>Kontakuppgifter</h1>
    <div class="col">
    <ul>
        <li>Elias Gustafsson</li>
        <li>elias.gustafsson@yh.nackademin.se</li>
        <li>07-123-56-78</li>
    </ul>
    </div>
</div>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require_once ("database.php");
    $name = filter_var($_POST["name"], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST["email"], FILTER_SANITIZE_EMAIL);
    $message = filter_var($_POST["message"], FILTER_SANITIZE_STRING);
    $errors = []; //array som håller errors
    if(strlen($name) > 50) {
        array_push($errors, "<div class='alert alert-danger'>Namn får ej överstiga 50 tecken</div>");
    } if(strlen($email) > 50){
        array_push($errors, "<div class='alert alert-danger'>E-Post får ej överstiga 50 tecken</div>");
    } if(strlen($message) > 280){
        array_push($errors, "<div class='alert alert-danger'>Meddelandet får ej överstiga 280 tecken</div>");
    } if(count($errors) > 0){
        foreach ($errors as $error) {
            echo $error . "<br>";
        }
    } else{   
    $stmt = $conn->prepare("INSERT INTO messages (name, email, message) VALUES(:name, :email, :message)");
    $stmt->bindParam(":name", $name);
    $stmt->bindParam(":email", $email);
    $stmt->bindParam(":message", $message);

    $stmt->execute();
    $lastId = $conn->lastInsertId();
    echo"<div class='alert alert-success'>Tack för ditt meddelande $name!</div>";
    }
}
?>
    <h1>Kontaktformulär</h1>
    <form class="mt-4" method="post" action="#">
        <div class="form-group">
            <label>Namn</label>
            <input type="text" class="form-control" maxlength="50" required="required" name="name">
        </div>
        <div class="form-group">
            <label>E-post</label>
            <input type="email" class="form-control" maxlength="50" required="required" name="email">
        </div>
        <div class="form-group">
            <label>Meddelande</label>
            <textarea class="form-control" rows="4" maxlength="280" required="required" name="message"></textarea>
        </div>
        <button type="submit" class="btn btn-primary mt-4">Skicka</button>
    </form>
<?php include_once('../footer.php'); ?>