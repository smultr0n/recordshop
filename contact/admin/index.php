<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Admin</title>
</head>

<body>
    <div class="container">  
<?php
require_once("../database.php");

$stmt = $conn->prepare("SELECT * FROM messages");
$stmt->execute();
$result = $stmt->fetchAll();

$table = "<table class='table'>";
$table .= "<thead class='thead-dark'><tr><th>Namn</th><th>E-Post</th><th>Meddelande</th><th></th></tr>";
foreach ($result as $key => $value) {
    $table .= "<tr><td>$value[name]</td>
                        <td>$value[email]</td>
                        <td>$value[message]</td>
                        <td><a href='delete.php?id=$value[id]'><button class='btn btn-danger'>Delete</button></a></td></tr>";
}
$table .= "</table>";
echo $table;

if (sizeof($result) > 0) {
    echo '<a href="delete.php"><button class="btn btn-danger">Nuke everything</button></a>';
} else {
    echo '<a href="delete.php"><button class="btn btn-danger" disabled>Nuke everything</button></a>';
}
?>
</div>
</body>
</html>
