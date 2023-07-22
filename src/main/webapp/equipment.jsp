<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.admin.Admin" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Add Equipments</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--//skycons-icons-->
</head>
<body>	
<div class="page-container">	
   <div class="left-content">
	   <div class="mother-grid-inner">
            <!--header start here-->
				<div class="header-main">
					<div class="header-left">
							<div class="logo-name">
									 <a href="home.jsp"> <h1>EquipFarm</h1> 
									<!--<img id="logo" src="" alt="Logo"/>--> 
								  </a> 								
							</div>
							<!--search-box-->
								
								</div><!--//end-search-box-->
							<div class="clearfix"> </div>
						 </div>
						 <div class="header-right">
							
							<div class="profile_details">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/p1.png" alt=""> </span> 
												<div class="user-name">
													<p><%=Admin.getName() %></p>
													<span>Admin</span>
												</div>
												<i class="fa fa-angle-down lnr"></i>
												<i class="fa fa-angle-up lnr"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="index.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="clearfix"> </div>				
						</div>
							<div class="clearfix"> </div>				
						</div>
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">
	<div class="form-w3layouts">
		<!-- page start-->
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading">
						<h1>Add Your Equipments</h1>
					
					</header>
					<div class="panel-body">
						<div class="form">
							<form action="AddEquipment" method="post"  enctype="multipart/form-data" class="cmxform form-horizontal"  id="signupForm"   novalidate="novalidate">
								<div class="form-group ">
									<label for="firstname" class="control-label col-lg-3">Equipment Name</label>
									<div class="col-lg-6">
										<input class=" form-control" id="firstname" name="name" type="text">
									</div>
								</div>
								<div class="form-group ">
									<label for="ccomment" class="control-label col-lg-3">Detail About Equipment</label>
									<div class="col-lg-6">
										<textarea class="form-control " id="ccomment" name="about" required=""></textarea>
									</div>
								</div>
								 
								<div class="form-group ">
									<label for="lastname" class="control-label col-lg-3">Catagory</label>
									<div class="col-lg-6">
										<input class=" form-control" id="lastname" name="category" type="text">
									</div>
								</div>
								<div class="form-group ">
									<label for="username" class="control-label col-lg-3">Hour Price</label>
									<div class="col-lg-6">
										<input class="form-control"  id="username" name="hprice" type="number">
									</div>
								</div>
									<div class="form-group ">
									<label for="username" class="control-label col-lg-3">Day Price</label>
									<div class="col-lg-6">
										<input class="form-control" id="username" name="dprice" type="number">
									</div>
								</div>
								<div class="form-group ">
									<label for="username" class="control-label col-lg-3">Deposite</label>
									<div class="col-lg-6">
										<input class="form-control" id="username" name="deposite" type="number">
									</div>
								</div>
								<div class="form-group ">
									<label for="username" class="control-label col-lg-3">Date & Time</label>
									<div class="col-lg-6">
										<input class="form-control" type="datetime-local" id="username" name="date" >
									</div>
								</div>
							 	<div class="form-group ">
									<label for="username" class="control-label col-lg-3">Choose Equipment Photo</label>
									<div class="col-lg-6">
										 <input type="file" id="image" name="image">
									</div>
								</div>
							

								<div class="form-group">
									<div class="col-lg-offset-3 col-lg-6">
										<button class="btn btn-primary" type="submit">Save</button>
									<!-- 	<button class="btn btn-default" type="button">Cancel</button> -->
									</div>
								</div>
							</form>
							
						
						</div>
					</div>
				</section>
			</div>
		</div>
		<!-- page end-->
	</div>
</div>
<!--inner block end here-->

</div>
</div>
<!--slider menu-->
<div class="sidebar-menu">
	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
		<!--<img id="logo" src="" alt="Logo"/>--> 
	</a> </div>		  
 <div class="menu">
		      <ul id="menu" >
		        <li id="menu-home" ><a href="home.jsp"><i class="fa fa-tachometer"></i><span>Home</span></a></li>
		        
				<li><a href="equipment.jsp"><i class="fa fa-cogs"></i><span>Add Equipments</span></a></li>
		    <li id="menu-home" ><a href="adminorder.jsp"><i class="fa fa-shopping-cart"></i><span>Order</span></a></li>
		         
		       
		        
		      </ul>
		    </div>
</div>
	<div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->
<script>
var toggle = true;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    $("#menu span").css({"position":"absolute"});
  }
  else
  {
    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    setTimeout(function() {
      $("#menu span").css({"position":"relative"});
    }, 400);
  }               
                toggle = !toggle;
            });
</script>
<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>


                      
						


