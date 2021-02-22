<?php
session_start();
session_unset();
require_once('database.php');
//visa alla produkter
$stmt = $conn->prepare("SELECT * FROM products 
                        INNER JOIN artists on products.artist=artists.artist_id 
                        INNER JOIN prices on products.price=prices.price_id");
$stmt->execute();
$result = $stmt->fetchAll();
$i = 3;
foreach ($result as $key => $value) {
    if($i % 3 == 0){
        echo "<div class='row'>";
    }
    $image = $value['img'];
    $title = $value['title'];
    $artist = $value['artist'];
    $price = $value['price'];
    $stock = $value['stock'];
    $product = "<div class='col product'>
                <img class='album-cover img-fluid' src='img/$image' alt='$artist - $title'>
                <p class='title'>$title</p>
                <p class='artist'>$artist</p>
                <div class='price-button'>
                <p class='price'>$price SEK</p>";
                if($stock == 0){
                    $product .= "<button type='button' class='btn btn-danger' disabled>Ej i lager</button></div></div>";    
                } else{
                    $product .= "<a href='view.php?id=".$value['id']."'><button type='button' class='btn btn-success'>Köp</button></a></div></div>";
                }

    echo $product;
    if($i % 3 == 2){
        echo "<div/>";
    }
    $i++;
}
