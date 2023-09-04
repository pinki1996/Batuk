<?php 
session_start();
require_once 'dbcontroller.php'; 
$conn = new DBController();
if(isset($_POST) & !empty($_POST)){

	//$email = mysqli_real_escape_string($connection, $_POST['email']);
	$email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
	$password = password_hash($_POST['password'], PASSWORD_DEFAULT);
	//$sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
	 $sql = "INSERT INTO users (email, password) VALUES ('$email', '$password')";
	$result_id = $conn->numRows($sql);
	if($result_id){
		//echo "User exits, create session";
		$_SESSION['customer'] = $email;
		$_SESSION['customerid'] = $result_id;
		header("location: checkout_item.php");
	}else{
		//$fmsg = "Invalid Login Credentials";
		header("location: login.php?message=2");
	}
}

?>