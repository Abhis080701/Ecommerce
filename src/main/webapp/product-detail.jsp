<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ecom.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <a href="product-list.html" class="nav-item nav-link">Products</a>
                         
                            <a href="cart.jsp" class="nav-item nav-link">Cart</a>
                           
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
                            <a href="wishlist.html" class="btn wishlist">
                                <i class="fa fa-heart"></i>
                                <span>(0)</span>
                            </a>
                            <a href="cart.html" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>(0)</span>
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
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">Product Detail</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Product Detail Start -->
        <div class="product-detail">
            <div class="container-fluid">
                <div class="row">
                
                <%
                String pname = request.getParameter("pname");
                try{
                	Connection conn = ConnectionProvider.getCon();
                	Statement st = conn.createStatement();
                	ResultSet rs = st.executeQuery("SELECT * FROM product WHERE pname='"+pname+"'");
                	while(rs.next())
                	{
                
                %>
                
                    <div class="col-lg-8">
                        <div class="product-detail-top">
                        
                            <div class="row align-items-center">
                            
                                <div class="col-md-5">
                                    <div class="product-slider-single normal-slider">
                                        <img src="admin/productimg/product1/<%= rs.getString("pimage1") %>" alt="Product Image" width="100" height="90">
                                        <img src="admin/productimg/product2/<%= rs.getString("pimage2") %>" alt="Product Image" width="100" height="90">
                                        <img src="admin/productimg/product3/<%= rs.getString("pimage3") %>" alt="Product Image" width="100" height="90">
                                        <img src="admin/productimg/product4/<%= rs.getString("pimage4") %>" alt="Product Image" width="100" height="90">
                                        <img src="admin/productimg/product5/<%= rs.getString("pimage5") %>" alt="Product Image" width="100" height="90">
                                        <img src="admin/productimg/product1/<%= rs.getString("pimage1") %>" alt="Product Image"width="100" height="90">
                                    </div>
                                    <div class="product-slider-single-nav normal-slider">
                                        <div class="slider-nav-img"><img src="admin/productimg/product1/<%= rs.getString("pimage1") %>" alt="Product Image" width="50" height="90"></div>
                                        <div class="slider-nav-img"><img src="admin/productimg/product2/<%= rs.getString("pimage2") %>" alt="Product Image" width="50" height="90"></div>
                                        <div class="slider-nav-img"><img src="admin/productimg/product3/<%= rs.getString("pimage3") %>" alt="Product Image" width="50" height="90"></div>
                                        <div class="slider-nav-img"><img src="admin/productimg/product4/<%= rs.getString("pimage4") %>" alt="Product Image" width="50" height="90"></div>
                                        <div class="slider-nav-img"><img src="admin/productimg/product5/<%= rs.getString("pimage5") %>" alt="Product Image" width="50" height="90"></div>
                                        <div class="slider-nav-img"><img src="admin/productimg/product1/<%= rs.getString("pimage1") %>" alt="Product Image" width="50" height="90"></div>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="product-content">
                                        <div class="title"><h2><%= rs.getString("pname") %></h2></div>
                                        <div class="ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="price">
                                            <h4>Price:</h4>
                                            <p><%= rs.getString("psellprice") %> <span><%= rs.getString("pprice") %></span></p>
                                        </div>
                                        <div class="quantity">
                                        
                                                                                    </div>
                                        <div class="p-size">
                                        <%if(rs.getString("psize").equals("none")) { %>
                                            
                                            <% }else { %>
                                            <h4>Size:</h4>
                                            <div class="btn-group btn-group-sm">
                                                <button type="button" class="btn"><% rs.getString("psize");%></button>
                                               
                                            </div> 
                                            <%} %>
                                        </div>
                                        <div class="p-color">
                                            <h4>Color:</h4>
                                            <div class="btn-group btn-group-sm">
                                                <button type="button" class="btn"><%= rs.getString("pcolor") %></button>
                                              
                                            </div> 
                                        </div>
                                        <div class="action">
                                           
                               <form action="addtocart.jsp" method="post">
								<input type="hidden" name="pid" value="<%= rs.getInt("pid") %>">
								<input type="hidden" name="pname" value="<%= rs.getString("pname")  %>">
								<input type="hidden" name="pprice" value="<%= rs.getString("pprice") %>">
								<input type="hidden" name="pimage" value="<%= rs.getString("pimage2") %>">
								<input type="hidden" name="totalprice" value="<%= rs.getString("pprice") %>">
								<input type="hidden" name="productcode" value="<%= rs.getString("pserialnum") %>">	
								<button class="btn" type="submit" name="addItem"><i class="fa fa-cart-plus"></i>Add To Cart</button>						
								</form>
                                	&nbsp;
                                		&nbsp;
                                			&nbsp;							
								<form action="addtowish.jsp" method="post">
								<input type="hidden" name="pid" value="<%= rs.getInt("pid") %>">
								<input type="hidden" name="pname" value="<%= rs.getString("pname")  %>">
								<input type="hidden" name="pprice" value="<%= rs.getString("pprice") %>">
								<input type="hidden" name="pimage" value="<%= rs.getString("pimage2") %>">
							
								<input type="hidden" name="productcode" value="<%= rs.getString("pserialnum") %>">	
								<button class="btn" type="submit" name="addWish"><i class="fa fa-heart"></i>Add To Wish</button>						
								</form>
                               	&nbsp;	&nbsp;	&nbsp;
								<form action="product-detail-buynow.jsp" method="post">
								<input type="hidden" name="pid" value="<%= rs.getInt("pid") %>">
								<input type="hidden" name="pname" value="<%= rs.getString("pname")  %>">
								<input type="hidden" name="psellprice" value="<%= rs.getString("psellprice") %>">
								<input type="hidden" name="pimage" value="<%= rs.getString("pimage2") %>">
			                    <input type="hidden" name="pcolor" value="<%= rs.getString("pcolor") %>">
								<input type="hidden" name="productcode" value="<%= rs.getString("pserialnum") %>">
								<button class="btn" type="submit" name="BuyNow"><i class="fa fa-shopping-bag"></i>BuyNow</button>
								</form>	
                                          
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        
                        <div class="row product-detail-bottom">
                            <div class="col-lg-12">
                                <ul class="nav nav-pills nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" href="#description">Description</a>
                                    </li>
                                   
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="pill" href="#reviews">Reviews (1)</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div id="description" class="container tab-pane active">
                                        <h4>Product description</h4>
                                        <p>
                                        <%= rs.getString("pfeature") %>
                                          </p>
                                    </div>
                                  
                                    <div id="reviews" class="container tab-pane fade">
                                        <div class="reviews-submitted">
                                            <div class="reviewer">Phasellus Gravida - <span>01 Jan 2020</span></div>
                                            <div class="ratting">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p>
                                                Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.
                                            </p>
                                        </div>
                                        <div class="reviews-submit">
                                            <h4>Give your Review:</h4>
                                            <div class="ratting">
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                            <div class="row form">
                                                <div class="col-sm-6">
                                                    <input type="text" placeholder="Name">
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="email" placeholder="Email">
                                                </div>
                                                <div class="col-sm-12">
                                                    <textarea placeholder="Review"></textarea>
                                                </div>
                                                <div class="col-sm-12">
                                                    <button>Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                       
                    </div>
                    <% } conn.close();  }
                    catch(Exception e)
                    {
                    	out.print(e);
                    }
                    %>
                    <!-- Side Bar Start -->
                    <div class="col-lg-4 sidebar">
                        <div class="sidebar-widget category">
                            <h2 class="title">Category</h2>
                            <nav class="navbar bg-light">
                                <ul class="navbar-nav">
                                <%
                                Connection conn = ConnectionProvider.getCon();
                                Statement st1 = conn.createStatement();
                                ResultSet rs1 =st1.executeQuery("SELECT * FROM category");
                                while(rs1.next())
                                {
                                	Statement sub  = conn.createStatement();
                                	ResultSet rsub = sub.executeQuery("SELECT COUNT(*) FROM subcategory WHERE cid='"+rs1.getInt("cid")+"'");
                                	while(rsub.next())
                                	{
                                %>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fa fa-female"></i><%= rs1.getString("cname") %><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<%= rsub.getString(1) %>)</span></a>
                                    </li>
                                <%
                                	}
                                }
                                %>    
                                </ul>
                            </nav>
                        </div>
                        
                     
                        <div class="sidebar-widget brands">
                            <h2 class="title">Our Brands</h2>
                            <ul>
                            <%
                           Statement st2 = conn.createStatement();
                            ResultSet rs2 = st2.executeQuery("SELECT * FROM subcategory");
                            while(rs2.next())
                            {
                            	Statement st3 = conn.createStatement();
                            	ResultSet rs3 =st3.executeQuery("SELECT COUNT(*) FROM product WHERE sid='"+rs2.getInt("sid")+"'");
                            	while(rs3.next())
                            	{
                            %>
                                <li><a href="#"><%= rs2.getString("sname")  %> </a><span>(<%= rs3.getString(1) %>)</span></li>
                            <%
                            	}
                            }
                            conn.close();
                            %>   
                            </ul>
                        </div>
                        
                        <div class="sidebar-widget tag">
                            <h2 class="title">Tags Cloud</h2>
                            <a href="#">Lorem ipsum</a>
                            <a href="#">Vivamus</a>
                            <a href="#">Phasellus</a>
                            <a href="#">pulvinar</a>
                            <a href="#">Curabitur</a>
                            <a href="#">Fusce</a>
                            <a href="#">Sem quis</a>
                            <a href="#">Mollis metus</a>
                            <a href="#">Sit amet</a>
                            <a href="#">Vel posuere</a>
                            <a href="#">orci luctus</a>
                            <a href="#">Nam lorem</a>
                        </div>
                    </div>
                    <!-- Side Bar End -->
                </div>
            </div>
        </div>
        <!-- Product Detail End -->
        
        <!-- Brand Start -->
        <div class="brand">
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
        </div>
        <!-- Brand End -->
        
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
    </body>
</html>
