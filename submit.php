<?php
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_SESSION['errors'])){
        $_SESSION['errors'] = array();
    }
    $name = filter_var($_POST["name"], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST["email"], FILTER_SANITIZE_EMAIL);
    $phone = filter_var($_POST["phone"], FILTER_SANITIZE_STRING);
    $street = filter_var($_POST["street"], FILTER_SANITIZE_STRING);
    $postcode = filter_var($_POST["postcode"], FILTER_SANITIZE_STRING);
    $city = filter_var($_POST["city"], FILTER_SANITIZE_STRING);
    $productId = $_POST["productId"];
    $errors = []; //array som håller errors
    if (strlen($name) > 30) {
        array_push($errors, "<div class='alert alert-danger'>Namn får ej överstiga 30 tecken</div>");
    }
    if (strlen($email) > 50) {
        array_push($errors, "<div class='alert alert-danger'>E-Post får ej överstiga 50 tecken</div>");
    }
    if (strlen($phone) > 15) {
        array_push($errors, "<div class='alert alert-danger'>Telefonnummer får ej överstiga 15 tecken</div>");
    }
    if (strlen($street) > 50) {
        array_push($errors, "<div class='alert alert-danger'>Gatuadress får ej överstiga 50 tecken</div>");
    }
    if (strlen($postcode) > 10) {
        array_push($errors, "<div class='alert alert-danger'>Postkod får ej överstiga 10 tecken</div>");
    }
    if (strlen($city) > 20) {
        array_push($errors, "<div class='alert alert-danger'>Postort får ej överstiga 20 tecken</div>");
    }
    if (!is_numeric($phone)) {
        array_push($errors, "<div class='alert alert-danger'>Vänligen ange ett giltigt telefonnummer</div>");
    }
    if (!is_numeric($postcode) || strlen($postcode) != 5) {
        array_push($errors, "<div class='alert alert-danger'>Vänligen ange en giltigt postkod</div>");
    }
    if (is_numeric($city)) {
        array_push($errors, "<div class='alert alert-danger'>Vänligen ange ett giltig postort</div>");
    }
    if (is_numeric($name)) {
        array_push($errors, "<div class='alert alert-danger'>Vänligen ange ett giltig namn</div>");
    }
    if (count($errors) > 0) {
        $_SESSION['errors'] = $errors;
        header("Location: product.php?id=$productId");
        exit;
    } else {
        require_once('confirm.php');
    }
}
