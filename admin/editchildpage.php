<?php
session_start();
if(!isset($_SESSION['admin_username']) && !isset($_SESSION['password'])) {
	header("location:login.php");
}
$id = $_GET['pid'];
include("dbconnect.php");
$sql = "select * from childpages where cpage_id='$id'";
$res= executequery($sql);
$data = mysql_fetch_assoc($res);
//print_r($data);
?>
<html>
<head>
<title>Page edit</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body><div class="wrapper">
	<?php include("sidebar.php");?>
	<div class="content1">
	<form name="frmpage" method="post" enctype="multipart/form-data" action="#" >
    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 

		<table width="100%" cellpadding="4" cellspacing="4">
		<tr>
			<td>Page Title</td>
			<td><input type="text" name="pagetitle"  value="<?php echo $data['cpage_title'];?>"/></td>
		</tr>
		<tr>
			<td>Page Description</td>
			<td>
			<textarea name="pagedesc" rows="6" cols="30"><?php echo $data['cpage_desc'];?></textarea>
			
			
			</td>
		</tr>
		<tr>
			<td>Image</td>
			<td>
			<?php if(!empty($data['cpage_image'])) {?>
			<img src="../userfiles/<?php echo $data['cpage_image'];?>" width="100" height="75" />
			<a href="deleteimage.php?cpid=<?php echo $id;?>&p=2">delete</a>
			<?php }else { ?>
			<input type="file" name="pict" />
			<?php } ?>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="submit" value="UPDATE PAGE" /></td>
            <td><input type="reset" name="reset" value="clear"></td>
		</tr>
		</table>
	</form>
	</div>
	<div class="clear"></div>
</div>

<?php
if(isset($_POST['submit'])) {
	$pid = $_POST['id'];
	$pagetitle = $_POST['pagetitle'];
	$pagedesc = $_POST['pagedesc'];
	if(!empty($_FILES['pict']['name'])) {
	$imgname = $_FILES['pict']['name'];
	$rand = rand();
	$imgname = $rand."_".$imgname;
	$tmppath = $_FILES['pict']['tmp_name'];
	$perpath = "../userfiles/".$imgname;
	move_uploaded_file($tmppath,$perpath);
	$sql = "update childpages set cpage_title='$pagetitle', cpage_desc='$pagedesc',cpage_image='$imgname' where cpage_id='$pid'";
	}else {
	$sql = "update childpages set cpage_title='$pagetitle',cpage_desc='$pagedesc' where cpage_id='$pid'";	
	}//end of else
	$result = executequery($sql);
	header("location:managepages.php?msg=childpage updated");
}else {
	header("location:managepages.php?msg=update error");
}//end of main else
?>
</body>
</html>
