<?php
	ob_start();
	session_start();
	
	// error_reporting(0);
	//require_once 'dbcontroller.php';
	//$conn = new DBController();

$conn = mysqli_connect('localhost', 'root', '', 'ecommerce');

	if(!isset($_SESSION['customer']) & empty($_SESSION['customer'])){
		header('location: login.php');
	}
	
include 'main_header.php'; 

$uid = $_SESSION['customerid'];
$cart = $_SESSION['ec_cart_item'];
//die();
if(isset($_POST) & !empty($_POST))
//if(isset($_POST['paynowBtn']) & !empty($_POST['paynowBtn']))
{
	if($_POST['agree'] == true){
		$country = filter_var($_POST['country'], FILTER_SANITIZE_STRING);
		$fname = filter_var($_POST['fname'], FILTER_SANITIZE_STRING);
		$lname = filter_var($_POST['lname'], FILTER_SANITIZE_STRING);
		$company = filter_var($_POST['company'], FILTER_SANITIZE_STRING);
		$address1 = filter_var($_POST['address1'], FILTER_SANITIZE_STRING);
		$address2 = filter_var($_POST['address2'], FILTER_SANITIZE_STRING);
		$city = filter_var($_POST['city'], FILTER_SANITIZE_STRING);
		$state = filter_var($_POST['state'], FILTER_SANITIZE_STRING);
		$phone = filter_var($_POST['phone'], FILTER_SANITIZE_NUMBER_INT);
		$payment = filter_var($_POST['payment'], FILTER_SANITIZE_STRING);
		$zip = filter_var($_POST['zipcode'], FILTER_SANITIZE_NUMBER_INT);


		// $sql = "SELECT * FROM usersmeta WHERE uid=$uid";
		// $res = mysqli_query($conn, $sql);
		$sql1 = "SELECT * FROM usersmeta WHERE uid='$uid'";
		$res = mysqli_query($conn, $sql1);
		$r = mysqli_fetch_assoc($res);
		$count = mysqli_num_rows($res);
		if($count == 1){
			//update data in usersmeta table
			$usql = "UPDATE usersmeta SET country='$country', firstname='$fname', lastname='$lname', address1='$\
			\address1', address2='$address2', city='$city', state='$state',  zip='$zip', mobile='$phone' WHERE uid=$uid";
			$ures = mysqli_query($conn, $usql) or die(mysqli_error($conn));
			
			if($ures){

				$total = 0;
				foreach ($cart as $k => $value) {
					//echo $k . " : " . $value['quantity'] ."<br>";
					$ordsql = "SELECT * FROM product WHERE id=$k";
					$ordres = mysqli_query($conn, $ordsql);
					$ordr = mysqli_fetch_assoc($ordres);

					$total = $total + ($ordr['price']*$value['quantity']);
				}
			$iosql = "INSERT INTO oders (totalprice, orderstatus, paymentmode) VALUES ( '$total', 'Order Placed', '$payment')";
				$iores = mysqli_query($conn, $iosql) or die(mysqli_error($conn));
				if($iores){
					//echo "Order inserted, insert order items <br>";
					$orderid = mysqli_insert_id($conn);
					foreach ($cart as $k => $value) {
						//echo $k . " : " . $value['quantity'] ."<br>";
						$ordsql = "SELECT * FROM product WHERE id=$k";
						$ordres = mysqli_query($conn, $ordsql);
						$ordr = mysqli_fetch_assoc($ordres);

						$pid = $ordr['id'];
						$productprice = $ordr['price'];
						$quantity = $value['quantity'];


						$orditmsql = "INSERT INTO orderitems (pid, orderid, productprice, pquantity) VALUES ('$pid', '$orderid', '$productprice', '$quantity')";
						$orditmres = mysqli_query($conn, $orditmsql) or die(mysqli_error($conn));
						//if($orditmres){
							//echo "Order Item inserted redirect to my account page <br>";
						//}
					}
		
				}
				unset($_SESSION['cart']);
				header("location: my-account.php");
			}
		}else{
			//insert data in usersmeta table
			$isql = "INSERT INTO usersmeta (country, firstname, lastname, address1, address2, city, state, zip,  mobile, uid) VALUES ('$country', '$fname', '$lname', '$address1', '$address2', '$city', '$state', '$zip', '$phone', '$uid')";
			$ires = mysqli_query($conn, $isql) or die(mysqli_error($conn));
			if($ires){

				$total = 0;
				foreach ($cart as $k => $value) {
					//echo $k . " : " . $value['quantity'] ."<br>";
					$ordsql = "SELECT * FROM product WHERE id=$k";
					$ordres = mysqli_query($conn, $ordsql);
					$ordr = mysqli_fetch_assoc($ordres);

					$total = $total + ($ordr['price']*$value['quantity']);
				}

				 $iosql = "INSERT INTO oders (uid, totalprice, orderstatus, paymentmode) VALUES ('$uid', '$total', 'Order Placed', '$payment')";
				$iores = mysqli_query($conn, $iosql) or die(mysqli_error($conn));
				if($iores){
					//echo "Order inserted, insert order items <br>";
					$orderid = mysqli_insert_id($conn);
					foreach ($cart as $k => $value) {
						//echo $k . " : " . $value['quantity'] ."<br>";
						$ordsql = "SELECT * FROM product WHERE id=$k";
						$ordres = mysqli_query($conn, $ordsql);
						$ordr = mysqli_fetch_assoc($ordres);

						$pid = $ordr['id'];
						$productprice = $ordr['price'];
						$quantity = $value['quantity'];


						$orditmsql = "INSERT INTO orderitems (pid, orderid, productprice, pquantity) VALUES ('$pid', '$orderid', '$productprice', '$quantity')";
						$orditmres = mysqli_query($conn, $orditmsql) or die(mysqli_error($conn));
						//if($orditmres){
							//echo "Order Item inserted redirect to my account page <br>";
						//}
					}
				}
				unset($_SESSION['cart']);
				header("location: my-account.php");
			}

		}
	}

}

//$sql = "SELECT * FROM usersmeta WHERE uid=$uid";
//$res = mysqli_query($conn, $sql);
//$r = mysqli_fetch_assoc($res);
?>

	
	<!-- SHOP CONTENT -->
	<html>
<head>
   <script src="jquery.min.js"></script>
   <script src="jquery.validate.min.js"></script>
   <style type="text/css">
   	.error {
      color: red;
      /*background-color: #acf;*/
   }
   </style>

</head>



	<section id="content">
		<div class="content-blog">
					<div class="page_header text-center">
						<h2>checkout </h2>
						
					</div>
<form  id="registration" method="post" >
	 

<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="billing-details">
						<h3 class="uppercase">Billing Details</h3>
						<div class="space30"></div>
							<label class="">Country </label>
							<select name="country" class="form-control">
								<option value="">Select Country</option>
								<option value="AX">Aland Islands</option>
								<option value="AF">Afghanistan</option>
								<option value="AL">india</option>
								<option value="DZ">pakistaan</option>
								<option value="AD">channai</option>
								<option value="AO">usa</option>
								<option value="AI">london</option>
								<option value="AQ">uk</option>
								<option value="AG">Antigua and Barbuda</option>
								<option value="AR">Argentina</option>
								<option value="AM">Armenia</option>
								<option value="AW">Aruba</option>
								<option value="AU">Australia</option>
								<option value="AT">Austria</option>
								<option value="AZ">Azerbaijan</option>
								<option value="BS">Bahamas</option>
								<option value="BH">Bahrain</option>
								<option value="BD">Bangladesh</option>
								<option value="BB">Barbados</option>
							</select>
							<div class="clearfix space20"></div>
							<div class="row">
								<div class="col-md-6">
									<label>First Name </label>
									<input name="fname" class="form-control" placeholder="" value="<?php if(!empty($r['firstname'])){ echo $r['firstname']; } elseif(isset($fname)){ echo $fname; } ?>" type="text">
								</div>
								<div class="col-md-6">
									<label>Last Name </label>
									<input name="lname" class="form-control" placeholder="" value="<?php if(!empty($r['lastname'])){ echo $r['lastname']; }elseif(isset($lname)){ echo $lname; } ?>" type="text">
								</div>
							</div>
							<div class="clearfix space20"></div>
							<label>Company Name</label>
							<input name="company" class="form-control" placeholder="" value="<?php if(!empty($r['company'])){ echo $r['company']; }elseif(isset($company)){ echo $company; } ?>" type="text">
							<div class="clearfix space20"></div>
							<label>Address </label>
							<input name="address1" class="form-control" placeholder="Street address" value="<?php if(!empty($r['address1'])){ echo $r['address1']; } elseif(isset($address1)){ echo $address1; } ?>" type="text">
							<div class="clearfix space20"></div>
							<input name="address2" class="form-control" placeholder="Apartment, suite, unit etc. (optional)" value="<?php if(!empty($r['address2'])){ echo $r['address2']; }elseif(isset($address2)){ echo $address2; } ?>" type="text"
>
							<div class="clearfix space20"></div>
							<div class="row">
								<div class="col-md-4">
									<label>City </label>
									<input name="city" class="form-control" placeholder="City" value="<?php if(!empty($r['city'])){ echo $r['city']; }elseif(isset($city)){ echo $city; } ?>" type="text">
								</div>
								<div class="col-md-4">
									<label>State</label>
									<input name="state" class="form-control" value="<?php if(!empty($r['state'])){ echo $r['state']; }elseif(isset($state)){ echo $state; } ?>" placeholder="State" type="text">
								</div>
								<div class="col-md-4">
									<label>Postcode </label>
									<input name="zipcode" class="form-control" placeholder="Postcode / Zip" value="<?php if(!empty($r['zip'])){ echo $r['zip']; }elseif(isset($zip)){ echo $zip; } ?>" type="text">
								</div>
							</div>
							<div class="clearfix space20"></div>
							<label>Phone </label>
							<input name="phone" class="form-control" id="billing_phone" placeholder="" value="<?php if(!empty($r['mobile'])){ echo $r['mobile']; }elseif(isset($phone)){ echo $phone; } ?>" type="text">
						
					</div>
				</div>
				
			</div>
			<script type="text/javascript">
jQuery(document).ready(function() {
   jQuery("#registration").validate({
      rules: {
      	 errorClass: 'errors',
      	address: 'required',
         firstname: 'required',
         lastname: 'required',
         company: 'required',
         address1: 'required',
         phone: {
            required: true,
            phone: true,
            maxlength: 10,
         },
      }
   });
});
</script>
			
			<?php		
    foreach ($_SESSION["ec_cart_item"] as $item){
        $item_price = $item["quantity"]*$item["price"];
		?>
				<!--<tr>
				<td><img src="<?php echo $item["image"]; ?>" class="cart-item-image" /><?php echo $item["name"]; ?></td>
				<td><?php echo $item["id"]; ?></td>
				<td style="text-align:right;"><?php echo $item["quantity"]; ?>
<td class="invert"><?php echo $item["quantity"]; ?>
							 <div class="quantity"> 
								<div class="quantity-select">                           
									<div class="entry value-minus">&nbsp;</div>
									<div class="entry value"><span>1</span></div>
									<div class="entry value-plus active">&nbsp;</div>
								</div>
							</div>
						</td>
				<td  style="text-align:right;"><?php echo "$ ".$item["price"]; ?></td>
				<td  style="text-align:right;"><?php echo "$ ". number_format($item_price,2); ?></td>
				<td style="text-align:center;"><a href="cart.php?action=remove&id=<?php echo $item["id"]; ?>" class="btnRemoveAction"><img src="icon-delete.png" alt="Remove Item" /></a></td>
									
				</tr>
				<?php
				$total_quantity += $item["quantity"];
				$total_price += ($item["price"]*$item["quantity"]);
		}
		?>-->

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
		-						<th>Order Total</th>
								<td><strong><span class="amount">IND <?php echo $total_price; ?>.00/-</span></strong> </td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>			
					
			<div class="clearfix space30"></div>
			<h4 class="heading">Payment Method</h4>
			<div class="clearfix space20"></div>
			
			<div class="payment-method">
				<div class="row">
					
						<div class="col-md-4">
							<input name="payment" id="radio1" class="css-checkbox" type="radio" value="cod"><span>Cash On Delivery</span>
							<div class="space20"></div>
							<p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won't be shipped until the funds have cleared in our account.</p>
						</div>
						<div class="col-md-4">
							<input name="payment" id="radio2" class="css-checkbox" type="radio"><span value="cheque">Cheque Payment</span>
							<div class="space20"></div>
							<p>Please send your cheque to BLVCK Fashion House, Oatland Rood, UK, LS71JR</p>
						</div>
						<div class="col-md-4">
							<input name="payment" id="radio3" class="css-checkbox" type="radio"><span value="paypal">Paypal</span>
							<div class="space20"></div>
							<p>Pay via PayPal; you can pay with your credit card if you don't have a PayPal account</p>
						</div>
					
				</div>
				<div class="space30"></div>
				
					<input name="agree" id="checkboxG2" class="css-checkbox" type="checkbox" value="true"><span>I've read and accept the <a href="#">terms &amp; conditions</a></span>
				
				<div class="space30"> 

				</div>
				<input type="submit" name="paynowBtn" class="button btn-lg" value="Pay Now">
			</div>
		</div>		
</form>		
		</div>
	</section>
	

</html>