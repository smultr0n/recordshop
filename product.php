<?php
session_start();
require_once('database.php');
require_once('header.php');
if (isset($_GET['id'])) {
    $stmt = $conn->prepare("SELECT * FROM products WHERE id");
    $stmt->execute();
    $arr = $stmt->fetchAll();
    $productIds = [];
    foreach ($arr as $key => $value) {
        array_push($productIds, $value['id']);
    }

    if (in_array($_GET['id'], $productIds)) {
        $productId = $_GET['id'];
        $stmt = $conn->prepare("SELECT * FROM products 
                                INNER JOIN artists on products.artist=artists.artist_id 
                                INNER JOIN prices on products.price=prices.price_id 
                                INNER JOIN labels on products.label=labels.label_id
                                WHERE products.id=$productId");
        $stmt->execute();
        $result = $stmt->fetchAll();

        $artist = $result['0']['artist'];
        $title = $result['0']['title'];
        $label = $result['0']['label'];
        $year = $result['0']['year'];
        $image = $result['0']['img'];
        $stock = $result['0']['stock'];
        $tracklist = trackList($result['0']['tracklist']);

        $productInfo = "<div class='row'><div class='col'><img class='album-cover-big img-fluid' src='img/$image' alt='$artist - $title'></div>
                    <div class='col'><p class='artist-title'>$artist - $title</p>
                    <div class='tracklist'>$tracklist</div><p class='copyright'>$year &copy; $label</p>";
                    if($stock == 0){
                        $productInfo .= "<p class='no-stock'>Finns ej i lager</p></div></div>";
                    } else{
                        $productInfo .= "<p class='stock'>Antal i lager: $stock st</p></div></div>";
                    }
        echo $productInfo;
        include_once('order.php');
    } else {
        echo "<div class='alert alert-warning' role='alert'>Produkt finns ej tillgängling</div>";
    }
} else {
    echo "<div class='alert alert-warning' role='alert'>Produkt finns ej tillgängling</div>";
}
require_once('footer.php');
function trackList($json)
{
    $tracklist = json_decode($json);
    $output = "<ol class='tracklist'>";
    foreach ($tracklist as $key => $value) {
        $output .= "<li class='track'>" . $value->title . " - <span class='track-length'>" . $value->length . "</span></li>";
    }
    $output .= "</ol>";
    return $output;
}
