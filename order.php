<?php
if(!empty($_SESSION['errors'])){
    foreach ($_SESSION['errors'] as $key => $value) {
        echo $value;
    }
}
?>
<form class="mt-4" method="post" action="submit.php">
    <div class="form-group">
        <label>Namn</label>
        <input type="text" class="form-control" maxlength="30" required="required" name="name">
    </div>
    <div class="form-group">
        <label>E-post</label>
        <input type="email" class="form-control" maxlength="50" required="required" name="email">
    </div>
    <div class="form-group">
        <label>Telefon</label>
        <input type="text" class="form-control" maxlength="15" required="required" name="phone">
    </div>
    <div class="form-group">
        <label>Gatuadress</label>
        <input type="text" class="form-control" maxlength="50" required="required" name="street">
    </div>
    <div class="form-group">
        <label>Postkod</label>
        <input type="text" class="form-control" maxlength="10" required="required" name="postcode">
    </div>
    <div class="form-group">
        <label>Postort</label>
        <input type="text" class="form-control" maxlength="20" required="required" name="city">
    </div>

    <input type='hidden' name='productId' value="<?php echo $productId;?>">

    <button type="submit" class="btn btn-primary mt-4">Beställ</button>
</form>