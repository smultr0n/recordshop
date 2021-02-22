<?php
$dbname = "shopdb";
$host = "localhost";
$dbUser = "root";
$dbPass = "root";
$dsn = "mysql:dbname=$dbname;host=$host;charset=UTF8";

try {
    $conn = new PDO($dsn, $dbUser, $dbPass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "<p>Connection Failed: " . $e->getMessage() . "</p>";
    exit(1);
}