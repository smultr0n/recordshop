<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include_once('header.php');
    require_once("database.php");
    
    //CHECK IF CITY IS ALREADY IN DATABASE
    $stmt = $conn->query("SELECT city, city_id FROM cities WHERE city = '$city'");
    $cityCheck = $stmt->fetch();
    if(empty($cityCheck)){
        $stmt = $conn->prepare("INSERT INTO cities (city) VALUES (:city)");
        $stmt->bindParam(":city", $city);
        $stmt->execute();
        $cityId = $conn->lastInsertId();
    } else{
        $cityId = $cityCheck['city_id'];
    }

    //CHECK IF CUSTOMER IS ALREADY IN THE DATABASE
    $stmt = $conn->query("SELECT id FROM customers 
                        WHERE customers.name = '$name' AND customers.email = '$email'
                        AND customers.phone = '$phone' AND customers.street = '$street'
                        AND customers.postcode = '$postcode' AND customers.city = '$cityId'");
    $customerCheck = $stmt->fetch();
    if(!empty($customerCheck)){
        $customerId = $customerCheck['id'];    
    } else{
    $stmt = $conn->prepare("INSERT INTO customers (name, email, phone, street, postcode, city) 
                            VALUES (:name, :email, :phone, :street, :postcode, :city)");
    $stmt->bindParam(":name", $name);
    $stmt->bindParam(":email", $email);
    $stmt->bindParam(":phone", $phone);
    $stmt->bindParam(":street", $street);
    $stmt->bindParam(":postcode", $postcode);
    $stmt->bindParam(":city", $cityId);
    $stmt->execute();
    $customerId = $conn->lastInsertId();
    }

    //INSERT INTO ORDERS
    $stmt = $conn->query("INSERT INTO orders (cust_id, prod_id) VALUES ($customerId, $productId)"); 
    $orderId = $conn->lastInsertId();
    $conn->query("UPDATE products SET stock = stock - 1 WHERE products.id = $productId AND stock > 0");

    //SHOW CONFIRMATION
    echo "<div class='alert alert-success' role='alert'>
            <p>Tack för din beställning $name!</p>
            <p>Ditt ordernummer är #$orderId.</p>
            </div>";
    include_once('footer.php');        
}