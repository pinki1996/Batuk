<?php
include("config.php");
//error_reporting(0);
$id=$_GET['id'];
if (isset($_GET['id']) && is_numeric($_GET['id']))
{
// get the 'id' variable from the URL

$query = "DELETE FROM table_catagory WHERE id='$id'";
$data=mysqli_query($mysqli,$query);


header("Location: manage_category.php");
}
else
// if the 'id' variable isn't set, redirect the user
{
header("Location: manage_category.php");
}
?>
