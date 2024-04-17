
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.ecom.*" %>

<%
String Email = (String)session.getAttribute("Email");
String Items="";
double grand_total = 0d;
if(Email!=null)
{
	

	try
	{
		ArrayList<String> ArrayItem = new ArrayList<String>();
	
	String email= "CART_"+session.getAttribute("Email").toString();
	StringBuilder sb = new StringBuilder(email);
	sb.replace(sb.length()-10, sb.length(), " ");
	
Connection conn = ConnectionProvider.getCon();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT  CONCAT(product_name,'(',quantity,')') AS ItemQty,total_price FROM "+sb+"");
while(rs.next())
{
	ArrayItem.add(rs.getString("ItemQty"));	
grand_total+=Double.parseDouble(rs.getString("total_price"));
}
 Items = ArrayItem.toString().replace("[", "").replace("]", "");

//out.print(grand_total+" ------------------------ "+Items);


	}
	catch(Exception e)
	{
		out.print(e);
	}
}

else
{
response.sendRedirect("Login.jsp?mesg=LoginR");
}


%>


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
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="lib/slick/slick.css" rel="stylesheet">
    <link href="lib/slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Top bar Start -->
    <div class="top-bar">
        <div class="container-fluid">
            <div class="row">
            
               
                
                    
                
            </div>
        </div>
    </div>
    <!-- Top bar End -->

    <!-- Nav Bar Start -->
    <div class="nav">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                <a href="#" class="navbar-brand">MENU</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto">
                        <a href="index.jsp" class="nav-item nav-link">Home</a>
                        <a href="product-list.jsp" class="nav-item nav-link">Products</a>

                        <a href="cart.jsp" class="nav-item nav-link actionive">Cart</a>

                        <!-- <a href="my-account.html" class="nav-item nav-link">My Account</a> -->
                        <!-- <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">More Pages</a>
                            <div class="dropdown-menu">
                                <a href="wish-list.php" class="dropdown-item">Wishlist</a>
                                <a href="login.html" class="dropdown-item">Login & Register</a>
                                <a href="contaction.html" class="dropdown-item">Contaction Us</a>
                            </div>
                        </div> -->
                    </div>
                    <div class="navbar-nav ml-auto">
                        <!-- <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                            <div class="dropdown-menu">
                                <a href="#" class="dropdown-item">Login</a>
                                <a href="#" class="dropdown-item">Register</a>
                            </div>
                        </div> -->
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
                        <a href="index.html">
                            <img src="img/logo.png" alt="Logo">
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- <div class="search">
                        <input type="text" placeholder="Search">
                        <button><i class="fa fa-search"></i></button>
                    </div> -->
                </div>
                <div class="col-md-3">
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Bottom Bar End -->

    <!-- Breadcrumb Start -->
    <div class="breadcrumb-wrap">
        <div class="container-fluid">
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="product-list.jsp">Products</a></li>
                <li class="breadcrumb-item actionive">Billing</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Cart Start -->
    <div class="cart-page">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 px-4 pb-4" id="order">
                    <div style="display:none" class="alert alert-success alert-dismissable mt-3">
                        <button  type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong></strong>
                    </div>

                  <h4 class="text-center text-info p-2">Complete Your Order!</h4>
                  <div class="jumbotron p-3 mb-2 text-center">
                           <h6 class="label"><b>Products(Quantity):</b><span style="color:green;"><%= Items %></span></h6>
                           <h6 class="label"><b>Delivery Charges:</b><%= "Free" %></h6>
                           <h6 class="lead"><b>Pay Amount:  <i class="fas fa-rupee-sign"></i><span style="color:red;"><%= grand_total %></span> </b></h6>

                  </div>
                  
                  <form action="" method="POST" id="PlaceOrder">
                  <input type="hidden" name="products" value="<%= Items %>">
                  <input type="hidden" name="grand_total" value="<%= grand_total %>">
                  <input type="hidden" name="deliverycharges" value="<%= "Free" %>">
                  <div class="form-group">
                      <label>Full Name:</label>
                      <input type="text" placeholder="Enter Name.. " class="form-control" name="name" required>
                  </div>
                  <div class="form-group">
                  <label>Email:</label>
                      <input type="text" value="<%= Email %>" class="form-control"  disabled>
                        <input type="hidden" value="<%= Email %>" class="form-control" name="email">
                  </div>
                  <div class="form-group">
                  <label>Phone:</label>
                      <input type="tel" placeholder="Enter Phone Number.. " class="form-control" name="phone" required>
                  </div>
                  <div class="form-group">
                  <label>Address:</label>
                     <textarea name="address"  cols="10" rows="3" placeholder="Enter The  Delivery Address Here.." class="form-control"></textarea>
                  </div>
                    <h6 class="text-center lead">Select Payment Mode</h6>
                    <div class="form-group">
                        <select name="pmode"  class="form-control">
                            <option value="" selected disabled>-Select Payment Method-</option>
                            <option value="Cash On Delivery">Cash On Delivery</option>
                            <option value="Net Banking">Net Banking</option>
                            <option value="Debit/Credit Card">Debit/Credit Card</option>
                        </select>
                    </div>
                    <input  type="submit" value="Place Order" name="submit" class="btn btn-danger btn-block">
                  </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->

    <!-- Footer Start -->
    <div class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                     <div class="footer-widget">
                        <h2>Get in Touch</h2>
                        <div class="contact-info">
                            <p><i class="fa fa-map-marker"></i>walchandhanagar,413114 </p>
                            <p><i class="fa fa-envelope"></i>suryawanshiabhishek177@gmail.com</p>
                            <p><i class="fa fa-phone"></i>+917774085516</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="footer-widget">
                        <h2>Follow Us</h2>
                        <div class="contaction-info">
                            <div class="social">

                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                                <a href=""><i class="fab fa-instagram"></i></a>

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

                            <li><a href="#">Return Policy</a></li>
                        </ul>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <!-- Footer End -->

    <!-- Footer Bottom Start -->
    <!-- <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-6 copyright">
                    <p>Copyright &copy; <a href="#">Abhishek</a>. All Rights Reserved</p>
                </div>


            </div>
        </div>
    </div> -->
    <!-- Footer Bottom End -->

    <!-- Back to Top -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/slick/slick.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
      <!-- Ajax and Jquery. -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){




  // Hiding the URL
history.replaceState({},null,"http://localhost:8010/Ecommerce/");

// PlaceOrder
$("#PlaceOrder").submit(function(e){
e.preventDefault();
$.ajax({
url:'addtocart.jsp',
method:'post',
data:$('form').serialize()+"&action=order",
success:function(data)
{
    $("#order").html(data);
}
});
});




});
</script>

</body>

</html>