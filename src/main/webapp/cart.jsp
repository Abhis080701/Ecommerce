<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
                    <div class="col-sm-6">
                        <i class="fa fa-envelope"></i>
                        support@email.com
                    </div>
                    <div class="col-sm-6">
                        <i class="fa fa-phone-alt"></i>
                        +012-345-6789
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
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="index.jsp" class="nav-item nav-link">Home</a>
                            <a href="product-list1.jsp" class="nav-item nav-link">Products</a>
                         
                            <a href="cart.jsp" class="nav-item nav-link active">Cart</a>
                         
                            <a href="my-account.html" class="nav-item nav-link">My Account</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">More Pages</a>
                                <div class="dropdown-menu">
                                    <a href="wishlist.html" class="dropdown-item">Wishlist</a>
                                    <a href="Login.jsp" class="dropdown-item">Login & Register</a>
                                    <a href="contact.html" class="dropdown-item">Contact Us</a>
                                </div>
                            </div>
                        </div>
                        <div class="navbar-nav ml-auto">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                                <div class="dropdown-menu">
                                    <a href="Login.jsp" class="dropdown-item">Login</a>
                                    <a href="Register.jsp" class="dropdown-item">Register</a>
                                </div>
                            </div>
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
                            <a href="index.jsp">
                                <img src="img/logo.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        
                    </div>
                    <div class="col-md-3">
                        <div class="user">
                            <a href="wishlist.jsp" class="btn wishlist">
                                <i class="fa fa-heart"></i>
                               (<span id="wish-item"></span>)
                            </a>
                            <a href="cart.jsp" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                (<span id="cart-item"></span>)
                            </a>
                        </div>
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
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">Cart</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Cart Start -->
        <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    <% String message =(String)session.getAttribute("CartMesg");
                    String alert =(String)session.getAttribute("alert");
                    %>
                    <div style="display:<% if(alert!=null){out.print(alert);}else{out.print("none");} session.removeAttribute("alert");%>" class="alert alert-success alert-dismissable mt-3">
                        <button  type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong> <% if(message!=null){out.print(message);} session.removeAttribute("CartMesg"); %>  </strong>
                    </div>
                        <div class="cart-page-inner">
                       <div class="table-responsive mt-2">
                       <table class="table table-bordered table-striped text-center">
                       <thead>
                       <tr>
                       <td colspan="7">
                       <h2 class="text-center text-danger m-0"> Products in Your Cart!</h2>
                       </td>
                       </tr>
                       <tr>
                       <th>ID</th>
                       <th>Product Name</th>
                       <th>Image</th>
                       <th>Price</th>
                       <th>Quantity</th>
                       <th>Total Price</th>
                       <th>Action</th>
                       </tr>
                       </thead>
                       
                       <tbody>
                       <% 
                       String email = (String)session.getAttribute("Email");
                       double grand_total=0d;
                       try
                       {
                    	   
                    	   if(email!=null)
                    	   {
                    		   email = "CART_"+session.getAttribute("Email").toString();
                    		   
                    	   }
                    	   else
                    	   {
                    		   email = "CART_GUEST@gmail.com";
                    		   
                    	   }
                    	   StringBuilder sb2 = new StringBuilder(email);
                    	   sb2.replace(sb2.length()-10, sb2.length(), " ");
                    	   Connection conn  = ConnectionProvider.getCon();
                    	   Statement st = conn.createStatement();
                    	   st.executeUpdate("CREATE TABLE	IF NOT EXISTS "+sb2+"(id int NOT NULL AUTO_INCREMENT,pid int(200),user_email varchar(200),product_name varchar(200),product_price varchar(300),product_image varchar(300),quantity int(11),total_price varchar(200),product_code varchar(200),created_at timestamp,PRIMARY KEY(id),FOREIGN KEY (pid) REFERENCES product(pid))");
                    	   ResultSet rs = st.executeQuery("SELECT * FROM "+sb2+"");
                    	  while(rs.next())
                    	  {
                       %>
                       
                       <tr>
                       <td> <strong> <span style="color:green;"> <%= "#"+rs.getString("product_code") %></span></strong></td>
                       <input type="hidden" class="Cid" value="<%= rs.getInt("id") %>">
                       <td><%= rs.getString("product_name") %></td>
                       <td><img alt="img" src="admin/productimg/product2/<%= rs.getString("product_image") %>" width="50" height="50"></td>
                       <td><%= rs.getString("product_price") %></td>
                       <input type="hidden" class="pprice" value="<%= rs.getString("product_price")  %>">
                       <td><input type="number" class="form-control itemQuantity" min="0" value="<%= rs.getInt("quantity") %>" style="width:75px;" ></td>
                     
                       <td><%= (rs.getInt("quantity")<=0)?(0):rs.getInt("total_price") %></td>
                         <% double totalprice = (rs.getInt("quantity")<=0)?(0):rs.getInt("total_price");  %>
                       
                       <td><a href="addtocart.jsp?remove=<%= rs.getInt("id") %>" class="text-danger lead"><i class="fas fa-trash-alt"></i></a></td>
                       <% grand_total+= totalprice; %>
                       </tr>
                       
                       <%
                       }
                    	  conn.close();
                       }
                       catch(Exception ex)
                       {
                    	   out.print(ex);
                       }
                       %>
                       <tr>
                       <td colspan="3"></td>
                       <td colspan="2"> <strong>Grand Total:</strong> </td>
                       <td> <b> 
                        <i class="fas fa-rupee-sign"></i>
                       <%=  grand_total %> </b></td>
                       <td>
                       <a href="cartcheckout.jsp" class="btn btn-info <%= (grand_total>1.0)? " ":"disabled" %>"><i class="fas fa-credit-card"></i>&nbsp;&nbsp;Checkout</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <a href="addtocart.jsp?clear=all" onclick="return confirm('Are you sure to Clear?');" class="btn btn-danger <%= (grand_total > 1.0d) ? " " : "disabled" %>"> <i class="fas fa-trash"></i>&nbsp;&nbsp;Clear Cart</a>
                       </td>
                       </tr>
                       </tbody>
                       
                       </table>
                       </div>
                        </div>
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
                                <p><i class="fa fa-map-marker"></i>123 E Store, Los Angeles, USA</p>
                                <p><i class="fa fa-envelope"></i>email@example.com</p>
                                <p><i class="fa fa-phone"></i>+123-456-7890</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Follow Us</h2>
                            <div class="contact-info">
                                <div class="social">
                                    <a href=""><i class="fab fa-twitter"></i></a>
                                    <a href=""><i class="fab fa-facebook-f"></i></a>
                                    <a href=""><i class="fab fa-linkedin-in"></i></a>
                                    <a href=""><i class="fab fa-instagram"></i></a>
                                    <a href=""><i class="fab fa-youtube"></i></a>
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
                            <img src="img/godaddy.svg" alt="Payment Security" />
                            <img src="img/norton.svg" alt="Payment Security" />
                            <img src="img/ssl.svg" alt="Payment Security" />
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
                        <p>Copyright &copy; <a href="https://htmlcodex.com">HTML Codex</a>. All Rights Reserved</p>
                    </div>

                    <div class="col-md-6 template-by">
                        <p>Template By <a href="https://htmlcodex.com">HTML Codex</a></p>
                    </div>
                </div>
            </div>
        </div>
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
    
    
    //updating the Quantity and  price of an cart item
    
   $(".itemQuantity").on('change',function(){
    var $el = $(this).closest('tr');

    var id = $el.find(".Cid").val();
    var pprice = $el.find(".pprice").val();
    var quantity = $el.find(".itemQuantity").val();

     location.reload(true);
    $.ajax({
  url:"addtocart.jsp",
  method:"POST",
  cache:false,
  data:{quantity:quantity,id:id,pprice:pprice},
  success:function(data)
  {
      console.log(data);
  }
    });

});
    
   


    
    });
    
    </script>
        
    </body>
</html>
