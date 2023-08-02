<%@ page import="com.db.DBConnection" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.admin.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.Duration, java.time.LocalDateTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Products</title>
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
									 <a href="index.html"> <h1>EquipFarm</h1> 
									<!--<img id="logo" src="" alt="Logo"/>--> 
								  </a> 								
							</div>
							<!--sear
								</div><!--//end-search-box-->
							<div class="clearfix"> </div>
						 </div>
						 <div class="header-right">
												<!--notification menu end -->
							<div class="profile_details">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/p1.png" alt=""> </span> 
												<div class="user-name">
													<p><%=User.getName() %></p>
													<span>Farmer</span>
												</div>
												<i class="fa fa-angle-down lnr"></i>
												<i class="fa fa-angle-up lnr"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="userlogin.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
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
    <div class="product-block">
    	<div class="col-md-3"></div>
<div class="col-md-6 chit-chat-layer1-left">
	<div class="work-progres">

<%
int id = Integer.parseInt(request.getParameter("id"));
String equipment = request.getParameter("equipment");
String name = request.getParameter("name");
String amount = request.getParameter("amount");
String rdate=request.getParameter("rdate");
// Get today's date
LocalDate today = LocalDate.now();
// Convert to string using toString() method
String date = today.toString();
%>

				 <div class="chit-chat-heading">
					   BILL
				 </div>
				 <div class="table-responsive">
					 <table class="table table-hover">
					   <thead>
						 <tr>
						   <th>Equipment Name: </th>
						   <th><%=equipment %></th>
						   
					   </tr>
				   </thead>
				   <tbody>
					 <tr>
					   <td>Farmer Name: </td>
					   <td><%=User.getName() %></td>
					   
				   </tr>
				  
				   <tr>
					   <td>Release Date: </td>
					   <td><%=rdate %></td>
					   
				   </tr>
				     
				   <tr>
					   <td>Amount: </td>
					   <td><%=amount %></td>
					  
				   </tr>
				   <tr>
					   <td>Todays Date: </td>
					   <td><%=date %></td>
					  
				   </tr>
				   <tr>
				   <td><button id="confirmBookingBtn" type="button" onclick="downloadBill()" class="btn btn-primary">Download Bill</button></td>
    		  <td>Thank You</td>
    		  </tr>	    
				  
				   
				
			   </tbody>
		   </table>
	   </div>
	   <script>
        // Define bill data (You can retrieve these values from your server-side code)
        var billData = {
            ename: "<%= equipment %>",
            aname: "<%=User.getName() %>",
            rdate: "<%= rdate %>",
            bdate: "<%= date %>",
            amount: "<%= amount %>",
        };
        
        console.log(billData);

        // Function to generate bill text content
        function generateBillText() {
        	 var billText = "Equipment Name: " + billData.ename + "\n" +
             "Name: " + billData.aname + "\n" +
             "Today's Date: " + billData.bdate + "\n" +
             "Release Date: " + billData.rdate + "\n" +
             "Amount: " + billData.amount;

				return billText;
        }

        // Function to download bill as a text file
        function downloadBill() {
            var billText = generateBillText();
            console.log(billText);
            var blob = new Blob([billText], { type: 'text/plain' });
            var url = URL.createObjectURL(blob);

            var a = document.createElement('a');
            a.href = url;
            a.download = 'bill.txt';
            document.body.appendChild(a);
            a.click();

            document.body.removeChild(a);
        }

        // Generate bill text and download bill when the page loads
        window.onload = function() {
            downloadBill();
        };
    </script>
	  
  </div>
</div>
		
    </div>
</div>
<!--inner block end here-->
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
			<script type="text/javascript" src="js/nivo-lightbox.min.js"></script>
				<script type="text/javascript">
				$(document).ready(function(){
				    $('#nivo-lightbox-demo a').nivoLightbox({ effect: 'fade' });
				});
				</script>

<!--copy rights start here-->

<!--COPY rights end here-->
</div>
</div>
<!--slider menu-->
<div class="sidebar-menu">
	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
		<!--<img id="logo" src="" alt="Logo"/>--> 
	</a> </div>		  
  <div class="menu">
	<ul id="menu" >
	   
	   <li><a href="userhome.jsp"><i class="fa fa-tachometer"></i><span>Equipments</span><span class="fa fa-angle-right" style="float: right"></span></a>
		  
	   </li>
	    <li><a href="userorder.jsp"><i class="fa fa-shopping-cart"></i><span>View order</span><span class="fa fa-angle-right" style="float: right"></span></a>	</li>
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
