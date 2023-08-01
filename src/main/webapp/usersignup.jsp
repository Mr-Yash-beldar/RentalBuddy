<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>

<head>
	<title>Admin SignUp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script
		type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<!-- Custom Theme files -->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!--js-->
	<script src="js/jquery-2.1.1.min.js"></script>
	<!--icons-css-->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!--Google Fonts-->
	<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
	<!--//charts-->
</head>

<body style="background-image: url('images/singupbag.jpeg');">
	<!--inner block start here-->
	<div class="signup-page-main">
		<div class="signup-main">
			<div class="signup-head">
				<h1>Sign Up</h1>
			
			</div>
			<div class="signup-block text-center">
				<h3 style="margin-bottom: 20px;">User</h3>
				<form action="UserSignup" method="post">
					<input type="text" name="name" placeholder="Name" required="">
					<input type="text" name="email" placeholder="Email" required="">
					<input type="text" name="mobileno" placeholder="Mobile No" required="">
					<input type="text" name="location" placeholder="Loaction" required="">
					<input type="text" name="city" placeholder="City" required="">
					<input type="text" name="taluka" placeholder="Taluka" required="">

					<input type="password" name="password" class="lock" placeholder="Password">
					<div class="forgot-top-grids">
						

						<div class="clearfix"> </div>
					</div>
					<input type="submit" name="Sign In" value="Sign up">
				</form>
				<div class="sign-down">
					<h4>Already have an account? <a href="userlogin.jsp">Login here.</a></h4>

				</div>
			</div>
		</div>
	</div>
	<!--inner block end here-->

	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	<script src="js/bootstrap.js"> </script>
	<!-- mother grid end here-->
</body>

</html>