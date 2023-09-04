<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shop Management</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<?php
include("dbconnect.php");
$email=$_GET['email'];
$cid=$_GET['cid'];
$sub=$_GET['sub'];

?>
<div class="wrapper">
<?php include("sidebar.php");?>
<div class="content1">
<form name="frm" method="post" action="#">
Answer:<textarea name="reply" rows=20 cols=20></textarea>
<input type="submit" name="submit" value="Reply" >

</form>

</div>
<?php
if(isset($_POST['submit'])){
	$reply=$_POST['reply'];
	mail('meetmedixya@ymail.com',$sub,$reply);
	header("location:manageinquiry.php");
}
?>