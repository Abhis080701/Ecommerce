<%@page contentType="text/html; charset=ISO-8859-1" language="java"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.Connection,java.sql.ResultSet,java.sql.Statement" %>
	<%@page import="com.ecom.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E Store - eCommerce HTML Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="lib/slick/slick.css" rel="stylesheet">
<link href="lib/slick/slick-theme.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="Search-bar.css">
</head>

<body>
	<!-- Top bar Start -->
	<div class="top-bar">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<i class="fa fa-envelope"></i>support@email.com
				</div>
				<div class="col-sm-6">
					<i class="fa fa-phone-alt"></i> +012-345-6789
				</div>
			</div>
		</div>
	</div>
	<!-- Top bar End -->

	<!-- Nav Bar Start -->
	<div class="nav">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-md bg-dark navbar-dark">
				<a href="#" class="navbar-brand">MENU</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse">
					<div class="navbar-nav mr-auto">
						<a href="index.jsp" class="nav-item nav-link active">Home</a> 
						<a href="product-list1.jsp" class="nav-item nav-link">Products</a> 
						<a href="wishlist.jsp" class="nav-item nav-link">WishList</a>
							 <a href="cart.jsp" class="nav-item nav-link">Cart</a> 
							<a href="my-account.html" class="nav-item nav-link">My Account</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">More Pages</a>
							<div class="dropdown-menu">
								<a href="wishlist.html" class="dropdown-item">Wishlist</a> <a
									href="Login.jsp" class="dropdown-item">Login & Register</a>
									 <a
									href="contact.html" class="dropdown-item">Contact Us</a>
							</div>
						</div>
					</div>
					<div class="navbar-nav ml-auto">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">User Account</a>
							<div class="dropdown-menu">
								<a href="Login.jsp"class="dropdown-item">Login</a> 
								<a href="Register.jsp"	class="dropdown-item">Register</a>
								<a href="logout.jsp"	class="dropdown-item">Logout</a>
							</div>
						</div>
					</div>
					<div class="navbar-nav">
						<a href="admin" class="nav-link" >ADMIN</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Nav Bar End -->

	<!-- Bottom Bar Start -->
	<div class="bottom-bar">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-md-3">
					<div class="logo">
						<a href="index.jsp"> <img src="img/logo.png" alt="Logo">
						</a>
					</div>
				</div>
				<div class="col-md-6">
				
					<div class="search" id="search-bar">
					<!-- <input type="search" placeholder="Search" id="search" autocomplete="off"> -->	
						
  
  
					</div>
					
				</div>
				<div class="col-md-3">
					<div class="user">
					<!-- Start Wishlist Count -->
						<a href="wishlist.jsp" class="btn wishlist"> <i
							class="fa fa-heart"></i> (<span id="wish-item"></span>)
						</a> 
					<!-- End Wishlist Count -->
					
						<!-- Start CART Count -->
						<a href="cart.jsp" class="btn cart"> <i
							class="fa fa-shopping-cart"></i> (<span id="cart-item"></span>)
						</a>
					   <!-- End Wishlist Count -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bottom Bar End -->
	
		<!-- Start Diplaying the Search product list -->
             <!--    <div style="position: relative; margin-top: -30px; margin-left: 800px;">
			
				
				<ul id="searchlist">
					<li id="search-data"></li>
				</ul>
			</div> -->
		<!-- End Diplaying the Search product list -->	
	<!-- Main Slider Start -->
	<div class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">
					<nav class="navbar bg-light">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="#"><i
									         class="fa fa-home"></i>Home</a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fa fa-shopping-bag"></i>Best Selling</a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fa fa-plus-square"></i>New Arrivals</a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fa fa-female"></i>Fashion & Beauty</a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fa fa-child"></i>Kids & Babies Clothes</a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fa fa-tshirt"></i>Men & Women Clothes</a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fa fa-mobile-alt"></i>Gadgets & Accessories</a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fa fa-microchip"></i>Electronics & Accessories</a></li>
						</ul>
					</nav>
				</div>
				
				<div class="col-md-6">
					<div class="header-slider normal-slider">
					
						<div class="header-slider-item">
							<img src="img/slider-1.jpg" alt="Slider Image" />
							<div class="header-slider-caption">
								<p>Some text goes here that describes the image</p>
								<a class="btn" href="product-list.jsp"><i class="fa fa-shopping-cart"></i>Shop
									Now</a>
							</div>
						</div>
						
						<div class="header-slider-item">
							<img src="img/slider-3.jpg" alt="Slider Image" />
							<div class="header-slider-caption">
								<p>Some text goes here that describes the image</p>
								<a class="btn" href="product-list.jsp"><i class="fa fa-shopping-cart"></i>Shop
									Now</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="header-img">
						<div class="img-item">
							<img src="img/category-1.jpg" /> <a class="img-text" href="product-list.jsp">
								<p>Some text goes here that describes the image</p>
							</a>
						</div>
						<div class="img-item">
							<img src="img/category-2.jpg" /> <a class="img-text" href="product-list.jsp">
								<p>Some text goes here that describes the image</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main Slider End -->

	<!-- Brand Start -->
	<!--   <div class="brand">
            <div class="container-fluid">
                <div class="brand-slider">
                    <div class="brand-item"><img src="img/brand-1.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-2.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-3.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-4.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-5.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-6.png" alt=""></div>
                </div>
            </div>
        </div>  -->
	<!-- Brand End -->

	<!-- Feature Start-->
	<div class="feature">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fab fa-cc-mastercard"></i>
						<h2>Secure Payment</h2>
						<p>Lorem ipsum dolor sit amet consectetur elit</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-truck"></i>
						<h2>Worldwide Delivery</h2>
						<p>Lorem ipsum dolor sit amet consectetur elit</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-sync-alt"></i>
						<h2>90 Days Return</h2>
						<p>Lorem ipsum dolor sit amet consectetur elit</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-comments"></i>
						<h2>24/7 Support</h2>
						<p>Lorem ipsum dolor sit amet consectetur elit</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Feature End-->

	<!-- Category Start-->
	<div class="category">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">
					<div class="category-item ch-400">
						<img src="img/category-3.jpg" /> <a class="category-name" href="">
							<p>Some text goes here that describes the image</p>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="category-item ch-250">
						<img src="img/category-4.jpg" /> <a class="category-name" href="">
							<p>Some text goes here that describes the image</p>
						</a>
					</div>
					<div class="category-item ch-150">
						<img src="img/category-5.jpg" /> <a class="category-name" href="">
							<p>Some text goes here that describes the image</p>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="category-item ch-150">
						<img src="img/category-6.jpg" /> <a class="category-name" href="">
							<p>Some text goes here that describes the image</p>
						</a>
					</div>
					<div class="category-item ch-250">
						<img src="img/category-7.jpg" /> <a class="category-name" href="">
							<p>Some text goes here that describes the image</p>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="category-item ch-400">
						<img src="img/category-8.jpg" /> <a class="category-name" href="">
							<p> Some text goes here that describes the image</p>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Category End-->

	<!-- Call to Action Start -->
	<div class="call-to-action">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-md-6">
					<h1>call us for any queries</h1>
				</div>
				<div class="col-md-6">
					<a href="tel:0123456789">+012-345-6789</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Call to Action End -->
	
	
	

	<!-- Product Start -->


<%
Connection conn = null;
Statement st,st1,st2 = null;
ResultSet rs,rs1,rs2,rs3 = null;
try
{
	
 conn = ConnectionProvider.getCon();
 st = conn.createStatement();
 rs = st.executeQuery("SELECT * FROM category");
while(rs.next())
{
	int cid = Integer.parseInt(rs.getString("cid"));
	 st1 = conn.createStatement();
	rs1 = st1.executeQuery("SELECT * FROM subcategory WHERE cid="+cid+"");
%>
	<div class="featured-product product">
		<div class="container-fluid">
			<div class="section-header">
				<h1><%= rs.getString("cname") %></h1>
			</div>
			<div class="row align-items-center product-slider product-slider-4">
<%
while(rs1.next())
{
	int sid = Integer.parseInt(rs1.getString("sid"));
	 st2 = conn.createStatement();
	 rs2 = st2.executeQuery("SELECT * FROM product WHERE sid="+sid+" AND status="+1+"");
	while(rs2.next())
	{
	
		
	
%>


				<div class="col-lg-3">
					<div class="product-item">
						<div class="product-title">
							<a href="#"><%= rs2.getString("pname") %></a>
							<div class="ratting">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</div>
						<div class="product-image">
							<a href="product-detail.html"> <img src="admin/productimg/product2/<%= rs2.getString("pimage2") %>"
								alt="Product Image" width="70" height="400">
							</a>
							<div class="product-action">
							<!-- <a href="#"><i class="fa fa-cart-plus"></i></a>  -->	
								<form action="addtocart.jsp" method="post">
								<input type="hidden" name="pid" value="<%= rs2.getInt("pid") %>">
								<input type="hidden" name="pname" value="<%= rs2.getString("pname")  %>">
								<input type="hidden" name="pprice" value="<%= rs2.getString("pprice") %>">
								<input type="hidden" name="pimage" value="<%= rs2.getString("pimage2") %>">
								<input type="hidden" name="totalprice" value="<%= rs2.getString("pprice") %>">
								<input type="hidden" name="productcode" value="<%= rs2.getString("pserialnum") %>">	
								<button class="btn" type="submit" name="addItem"><i class="fa fa-cart-plus"></i></button>						
								</form>
								<form action="addtowish.jsp" method="post">
								<input type="hidden" name="pid" value="<%= rs2.getInt("pid") %>">
								<input type="hidden" name="pname" value="<%= rs2.getString("pname")  %>">
								<input type="hidden" name="pprice" value="<%= rs2.getString("pprice") %>">
								<input type="hidden" name="pimage" value="<%= rs2.getString("pimage2") %>">
							
								<input type="hidden" name="productcode" value="<%= rs2.getString("pserialnum") %>">	
								<button class="btn" type="submit" name="addWish"><i class="fa fa-heart"></i></button>						
								</form>
							
                                <a href="product-detail.jsp?pname=<%=  rs2.getString("pname") %>"><i class="fa fa-eye"></i></a>
							</div>
						</div>
						<div class="product-price">
							<h3>
								<span>$</span><%= rs2.getString("pprice") %>
							</h3>
							<!-- <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
								Now</a> -->
						</div>
					</div>
				</div>

<%
	}
}
%>


			</div>
		</div>
	</div>
<%
}
conn.close();
}
catch(Exception ex)
{
ex.printStackTrace();
out.print(ex);
conn.close();
}

%>
            <!-- Product End -->
            
            
	<!-- Footer Start -->
	<div class="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Get in Touch</h2>
						<div class="contact-info">
							<p>
								<i class="fa fa-map-marker"></i>Baramati
							</p>
							<p>
								<i class="fa fa-envelope"></i>email@example.com
							</p>
							<p>
								<i class="fa fa-phone"></i>+123-456-7890
							</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Follow Us</h2>
						<div class="contact-info">
							<div class="social">
								<a href=""><i class="fab fa-twitter"></i></a> 
								 <a href=""><i
									class="fab fa-linkedin-in"></i></a> <a href=""><i
									class="fab fa-instagram"></i></a> <a href=""><i
									class="fab fa-youtube"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Company Info</h2>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms & Condition</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Purchase Info</h2>
						<ul>
							<li><a href="#">Pyament Policy</a></li>
							<li><a href="#">Shipping Policy</a></li>
							<li><a href="#">Return Policy</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row payment align-items-center">
				<div class="col-md-6">
					<div class="payment-method">
						<h2>We Accept:</h2>
						<img src="img/payment-method.png" alt="Payment Method" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="payment-security">
						<h2>Secured By:</h2>
						<img src="img/godaddy.svg" alt="Payment Security" /> <img
							src="img/norton.svg" alt="Payment Security" /> <img
							src="img/ssl.svg" alt="Payment Security" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->

	<!-- Footer Bottom Start -->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6 copyright">
					<p>
						Copyright &copy; <a href="#">Abhishek</a>.
						All Rights Reserved
					</p>
				</div>

				<div class="col-md-6 template-by">
					
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Bottom End -->

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	
	  <!-- Ajax and Jquery. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){


// Cart Count
load_cart_item_number();
 function load_cart_item_number()
 {
     $.ajax({
   url:"addtocart.jsp",
   type:"GET",
   data:{cart_count:"cart_item"},
   success:function(data)
   {
      $("#cart-item").html(data);
   }
     });
 }




//WishList Count
load_cart_wishitem_number();
 function load_cart_wishitem_number()
 {
     $.ajax({
   url:"addtowish.jsp",
   type:"GET",
   data:{wish_count:"wish_item"},
   success:function(data)
   {
      $("#wish-item").html(data);
   }
     });
 }




});
    
    
    //Search List
   $("#search").on("keyup", function () {
                var search_term = $(this).val();
                if(search_term!='')
                {
                $.ajax({
                    url: "userlivesearch.jsp",
                    type: "POST",
                    data: { search1: search_term },
                    success: function (data) {
                        if(data)
                        {
                        $("#search-data").html(data);
                        }
                        else
                        {
                            alert("No Such record is Found!");
                        }
                    }
                });
                }
                else
                {
                $("#search-data").html('');
                }
                
            });
    
    
    
   
    
    </script>
	
</body>
</html>
