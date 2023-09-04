<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ecommerce";
$result=$conn->query($sql);
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
//<?php 
//$conn=mysqli_connect("localhost","root","","ecommerce")or die("Can't Connect...");


?>