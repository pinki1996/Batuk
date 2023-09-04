
<?php
session_start();
require_once("dbcontroller.php");
$db_handle = new DBController();
if(!empty($_GET["action"])) {
switch($_GET["action"]) {
	case "add":
		if(!empty($_POST["quantity"])) {
			$productByid = $db_handle->runQuery("SELECT * FROM product WHERE id='" . $_GET["id"] . "'");
			$itemArray = array($productByid[0]["id"]=>array('name'=>$productByid[0]["name"], 'id'=>$productByid[0]["id"], 'quantity'=>$_POST["quantity"], 'price'=>$productByid[0]["price"], 'image'=>$productByid[0]["picsource"]));
			
			if(!empty($_SESSION["ec_cart_item"])) {
				if(in_array($productByid[0]["id"],array_keys($_SESSION["ec_cart_item"]))) {
					foreach($_SESSION["ec_cart_item"] as $k => $v) {
							if($productByid[0]["id"] == $k) {
								if(empty($_SESSION["ec_cart_item"][$k]["quantity"])) {
									$_SESSION["ec_cart_item"][$k]["quantity"] = 0;
								}
								$_SESSION["ec_cart_item"][$k]["quantity"] += $_POST["quantity"];
							}
					}
				} else {
					$_SESSION["ec_cart_item"] = array_merge($_SESSION["ec_cart_item"],$itemArray);
				}
			} else {
				
				$_SESSION["ec_cart_item"] = $itemArray;
				// echo "<pre>";
				// print_r($_SESSION["ec_cart_item"]);
				// echo "</pre>";
			}
		}
	break;
	case "remove":
		if(!empty($_SESSION["ec_cart_item"])) {
			foreach($_SESSION["ec_cart_item"] as $k => $v) {
					if($_GET["id"] == $k)
						unset($_SESSION["ec_cart_item"][$k]);				
					if(empty($_SESSION["ec_cart_item"]))
						unset($_SESSION["ec_cart_item"]);
			}
		}
	break;
	case "empty":
		unset($_SESSION["ec_cart_item"]);
	break;	
}
			
}


?>
<?php
include('main_header.php');
?>
<HTML>
<HEAD>
<TITLE>Simple PHP Shopping Cart</TITLE>
<link href="style.css" type="text/css" rel="stylesheet" />
</HEAD>
<BODY>
<div id="shopping-cart">
<div class="txt-heading">Shopping Cart</div>

<a id="btnEmpty" href="cart.php?action=empty">Empty Cart</a>
<?php
if(isset($_SESSION["ec_cart_item"])){
    $total_quantity = 0;
    $total_price = 0;
?>	
<!--<table class="tbl-cart" cellpadding="10" cellspacing="1">
<tbody>
<tr>
<th style="text-align:left;">Name</th>
<th style="text-align:left;">id</th>
<th style="text-align:right;" width="5%">Quantity</th>
<th style="text-align:right;" width="10%">Unit Price</th>
<th style="text-align:right;" width="10%">Price</th>
<th style="text-align:center;" width="5%">Remove</th>
</tr>-->
<table class="timetable_sub">
					<thead>
						<tbody>
					<tr>	
							<th>NAME</th>
							<th>ID</th>
							<th>QUANTITY</th>
							<th>UNIT PRICE</th>
							<th> PRICE</th>
							<th>REMOVE</th>
						</tr>	
<?php		
    foreach ($_SESSION["ec_cart_item"] as $item){
        $item_price = $item["quantity"]*$item["price"];
		?>
				<tr>
				<td><img src="<?php echo $item["image"]; ?>" class="cart-item-image" /><?php echo $item["name"]; ?></td>
				<td><?php echo $item["id"]; ?></td>
				<!--<td style="text-align:right;"><?php echo $item["quantity"]; ?>-->
<td class="invert"><?php echo $item["quantity"]; ?>
							
						</td>
				<td  style="text-align:right;"><?php echo "Rs ".$item["price"]; ?></td>
				<td  style="text-align:right;"><?php echo "Rs ". number_format($item_price,2); ?></td>
				<td style="text-align:center;"><a href="cart.php?action=remove&id=<?php echo $item["id"]; ?>" class="btnRemoveAction"><img src="icon-delete.png" alt="Remove Item" /></a></td>

				</tr>
				
				<?php
				$total_quantity += $item["quantity"];
				$total_price += ($item["price"]*$item["quantity"]);
		}
		?>

<tr>
<td colspan="2" align="right">Total:</td>
<td align="right">
	<?php echo $total_quantity; ?></td>
<td align="right" colspan="2"><strong><?php echo "Rs ".number_format($total_price, 2); ?></strong></td>
<td></td>
</tr>
</tbody>
</table>
<div class="cart_totals">
				<div class="col-md-6 push-md-6 no-padding">
					<h4 class="heading">Cart Totals</h4>
					<table class="table table-bordered col-md-6">
						<tbody>
							<tr>
								<th>Cart Subtotal</th>
								<td><span class="amount">IND <?php echo $total_price;?>.00/-</span></td>
							</tr>
							<tr>
								<th>Shipping and Handling</th>
								<td>
									Free Shipping				
								</td>
							</tr>


							<tr>
								<th>Order Total</th>
								<td><strong><span class="amount">IND <?php  echo $total_price; ?>.00/-</span></strong> </td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>			
							
					</div>
				</div>
			</div>
		</div>		
  <?php
} else {
?>

<div class="no-records">Your Cart is Empty</div>
<?php 
}
?>
</div>
<h2><div> <a  href="checkout_item.php">checkout</a></div></h2>
<script src="js/jquery-1.11.1.min.js"></script>
							 <!--quantity-->
									<script>
									$('.value-plus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
										divUpd.text(newVal);
									});

									$('.value-minus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
										if(newVal>=1) divUpd.text(newVal);
									});
									</script>
								<!--quantity-->
							<script>$(document).ready(function(c) {
								$('.close').on('click', function(c){
									$('.rem').fadeOut('slow', function(c){
										$('.rem').remove();
									});
									});	  
								});
						   </script>
							