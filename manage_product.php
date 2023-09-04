<?php
include("config.php");
include('header.php');
include('sidebar.php');
//error_reporting(0);
$query="SELECT*FROM product";
$data=mysqli_query($mysqli,$query);
$total=mysqli_num_rows($data);
if($total!=0){

?>

 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

<section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><a href="product.php" class="button button-primary">Add product</a></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
          
              <div class="box-body">
   <div class="box">
            <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                      <th>id</th>
                      <th>product name</th>
                      <th>product Description</th>
                      <th>product quantity</th>
                      <th>product price.....</th>
                      <th>created time</th>
                      <th>updated time</th>
                      <th colspan="2">....Action.......</th>
                      <th>......image.......</th>
                      

                    </tr>
                </thead>
   <table id="example2" class="table table-bordered table-hover">
      
                    
                    <?php
                    while($result=mysqli_fetch_assoc($data))
                    {
                    	echo"<tr>
                    	<td>".$result['id']."</td>
                    	<td>".$result['name']."</td>
                    	<td>".$result['description']."</td>
                      <td>".$result['quantity']."</td>
                      <td>".$result['price']."</td>
                    	<td>".$result['created_at']."</td>
                    	<td>".$result['updated_at']."</td>
                    <td><a href='editp.php?id=$result[id]&name=$result[name]&description=$result[description]&price=$result[price]&quantity=$result[quantity]' >edit</a></td>
                        <td><a href='del.php?id=$result[id]' onclick='checkdelete()' >delete</a></td>
                    <td><a href='images.php?id=$result[picsource]'><img src='".$result['picsource']."'height='100' width='100'/></a></td>";

                        
                    }
                }
                else
                {
                	echo"no record found";
                }
                ?>
                  </table>
                  <script>
                  	function checkdelete()
                  	{
                  		return confirm('are you sure you want to delete this data??');
                  	}
                  </script>
                 