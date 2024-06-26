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
                                <a href="product-list.jsp" class="nav-item nav-link active">Products</a>
                               
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
                            <!--    <a href="wishlist.html" class="btn wishlist">
                                    <i class="fa fa-heart"></i>
                                    <span>(0)</span>
                                </a>
                                <a href="cart.html" class="btn cart">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>(0)</span>
                                </a>
                                 --> 
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
                        <li class="breadcrumb-item active">Product List</li>
                    </ul>
                </div>
            </div>
            <!-- Breadcrumb End -->
            
            <!-- Product List Start -->
            <div class="product-view">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                            
                                <div class="col-md-12">
                                    <div class="product-view-top">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="product-search">
                                                
                                                    <input type="email" placeholder="search....." autocomplete="off">
                                                    
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="product-short">
                                                    <div class="dropdown">
                                                        <div class="dropdown-toggle" data-toggle="dropdown">Product short by Category</div>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                          <%
                                                          try
                                                          {
                                                          Connection connection  = ConnectionProvider.getCon();
                                                          Statement statement = connection.createStatement();
                                                          ResultSet rsResultSet = statement.executeQuery("SELECT * FROM category ORDER BY cid");
                                                        while(rsResultSet.next())
                                                        {
                                                          %>
                                                            <a href="product-listByCategory.jsp?cname=<%= rsResultSet.getString("cname") %>" class="dropdown-item"><%= rsResultSet.getString("cname") %></a>
                                                           <%
                                                        }connection.close(); }
                                                          catch(Exception ex)
                                                          {
                                                        	  out.print(ex);
                                                          }
                                                           %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="product-price-range">
                                                    <div class="dropdown">
                                                        <div class="dropdown-toggle" data-toggle="dropdown">Product price range</div>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                         <a href="product-listByPrice.jsp?price=50&p2=100" class="dropdown-item">$50 to $100</a>
                                                         <a href="product-listByPrice.jsp?price=100&p2=500" class="dropdown-item">$100 to $500</a>
                                                         <a href="product-listByPrice.jsp?price=1000&p2=2000" class="dropdown-item">$1000 to $2000</a>
                                                        <a href="product-listByPrice.jsp?price=3000&p2=4000" class="dropdown-item">$3000 to $4000</a>
                                                         <a href="product-listByPrice.jsp?price=5000&p2=10000" class="dropdown-item">$5000 to $10000</a>                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                               
                               
                               <%
                               
                               
                               int price = Integer.parseInt(request.getParameter("price"));
                               int p2 = Integer.parseInt(request.getParameter("p2"));
                             //  out.print(price);
                           
                               Connection conn=null;
                               try
                               {
                              conn  = ConnectionProvider.getCon();
                              
                              
                               Statement st = conn.createStatement();
                               ResultSet rs = st.executeQuery("SELECT * FROM product WHERE pprice>="+price+" AND pprice<="+p2+"");
                               while(rs.next())
                               {
                            	   int status = rs.getInt("status");
                            	   if(status==1)
                            	   {
                               %>
                               
                                <div class="col-lg-2">
                              
                              
                                    <div class="product-item">
                                        <div class="product-title">
                                            <a href="#"><%= rs.getString("pname") %></a>
                                            <div class="ratting">
                                            </div>
                                        </div>
                                        <div class="product-image">
                                            <a href="#">
                                                <img src="admin/productimg/product3/<%= rs.getString("pimage3") %>" alt="Product Image" width="50" height="270">
                                            </a>
                                            <div class="product-action">
                                              <!--   <a href="#"><i class="fa fa-cart-plus"></i></a>
                                                <a href="#"><i class="fa fa-heart"></i></a> -->
                                                <a href="product-detail.jsp?pid=<%= rs.getInt("pid") %>"><i class="fa fa-eye"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-price">
                                            <h3><span>$</span><%= rs.getString("pprice") %></h3>
                                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                        </div>
                                    </div>
                                   
                                </div>
                                
                            <%
                            	   }
                            	   }
                               
                               conn.close();
                               }
                               catch(Exception ex)
                               {
                            	   out.print(ex);
                               }
                               finally{
                            	   
                            	   conn.close();
                               }
                            %>
                            </div>
                            
                            
                            
                            
                            
                            
                            <!-- Pagination Start -->
                          
                            
                            <div class="col-md-12">
                           </div>
                            
                            
                            
                            <!-- Pagination Start -->
                        </div>           
                        
                        <!-- Side Bar Start -->
                      
                        <!-- Side Bar End -->
                    </div>
                </div>
            </div>
            <!-- Product List End -->  
            
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
