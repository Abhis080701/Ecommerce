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
            <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
          
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="lib/slick/slick.css" rel="stylesheet">
            <link href="lib/slick/slick-theme.css" rel="stylesheet">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
       
            <!-- Template Stylesheet -->
            <link href="css/style.css" rel="stylesheet">
            <link rel="stylesheet" href="productsearchlist.css">
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
            <style>
/* The container */
.container1 {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 18px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container1 input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container1:hover input ~ .checkmark {
  background-color: #dec8ab;
}

/* When the radio button is checked, add a blue background */
.container1 input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container1 input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container1 .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}

/*  For Button's  */
#Loading
{
margin-left:590px;
margin-top:200px;
}

</style>
            <div class="product-view">
                <div class="container-fluid">
               
                    <div class="row">
                  
                    <div class="col-lg-3" style="background-color:#ffb6c1;">
                    <p style="text-align:center;background-color:#fc6c85;margin-top:30px;border-top:3px solid red;">Search Product</p>
                     <div class="row">
                   <p style="margin-left:80px;"> <input type="text" size="28" autocomplete="off" id="searchproduct"></p>
                    </div>

                      <p style="text-align:center;background-color:#fc6c85;margin-top:60px;font-family:Verdana,Arial;border-top:3px solid red"><b>Sort-Category</b></p>
                   <div class="row" style="margin-top:40px;">
                  <%
                  Connection conn_ = null;
                  Statement st_ = null;
                  ResultSet rs_ = null;
                  try
                  {
                	conn_ = ConnectionProvider.getCon();
                	st_ = conn_.createStatement();
                	rs_ = st_.executeQuery("SELECT * FROM category");
                	while(rs_.next())
                	{
                  
                  %> 
                 
                   <label class="container1" style="margin-left:39px;"><p style="font-family:Times;background-color:lightgrey;border-left:4px solid green;"><%= rs_.getString("cname") %></p>
                      <input type="radio"  value="<%= rs_.getInt("cid") %>" name="radio"  id="cid" onChange="getcategory(this.value);" >
                   <span class="checkmark"></span>
                   </label>
                  
                  
                  <%
                	}
                  }catch(Exception ex){out.print(ex);ex.printStackTrace();}
                  finally{conn_.close();}
                  %>
                  
                  
                   
                   <!-- 
                   <label class="container1">Pencil
                      <input type="radio" checked="checked" name="radio">
                   <span class="checkmark"></span>
                   </label>
                    &nbsp;
                   <label class="container1">Watch
                      <input type="radio" checked="checked" name="radio">
                   <span class="checkmark"></span>
                   </label>
                    -->
                    
                     <button type="reset" style="margin-top:30px;margin-left:185px;background-color:#80daeb;" id="reset_radio">clear</button>
                     <script>
                     $("#reset_radio").on("click",function(e){
                     e.preventDefault();
                     $('input[name="radio"]').prop("checked",false);
                       window.location.href = "product-list1.jsp";
                     });
                     </script>
      
                   </div>
                   
                   
                    <p style="text-align:center;background-color:#fc6c85;margin-top:30px;border-top:3px solid red;">short By Price</p>
                     <div class="row">
                    <input type="hidden" id="price_min_value" value="10">
                    <input type="hidden" id="price_max_value" value="6000">
                 <div id="my_slider" style="width:350px;margin-left:47px;margin-top:40px;"></div>
                    <div id="price_show" style="margin-left:196px;margin-top:25px;background-color:#F0F8FF;"></div>
                    </div>
                   
                    </div>
                        <div class="col-md-7">
                            <div class="row filterprice"  id="cname">
                         
                               
                               
                               
 
                               <%
                               int Total_Record =0;
                               int Total_page = 0;
                               int limit  = 12;
                               int page2=0;
                               if(request.getParameter("page2")!=null)
                               {
                            	   
                            	   page2 = Integer.parseInt(request.getParameter("page2"));
                               }
                               else
                               {
                            	   page2 =1;
                               }
                               int start_from = (page2-1)*limit;
                               Connection conn=null;
                               try
                               {
                              conn  = ConnectionProvider.getCon();
                               Statement st = conn.createStatement();
                               ResultSet rs2 = st.executeQuery("SELECT * FROM product ORDER BY pid DESC LIMIT " + start_from + "," + limit + " ");
                               while(rs2.next())
                               {
                               %>
                               
                                <div class="col-md-3" id="refresher" >
                              
                              
                                    <div class="product-item">
                                        <div class="product-title">
                                            <a href="#"><%= rs2.getString("pname") %></a>
                                            <div class="ratting">
                                            </div>
                                        </div>
                                        <div class="product-image">
                                            <a href="#">
                                                <img src="admin/productimg/product3/<%= rs2.getString("pimage3") %>" alt="Product Image" width="50" height="270">
                                            </a>
                                            <div class="product-action">
                                              <!--   <a href="#"><i class="fa fa-cart-plus"></i></a>
                                                <a href="#"><i class="fa fa-heart"></i></a> -->
                                                <a href="product-detail.jsp?pname=<%= rs2.getString("pname") %>"><i class="fa fa-eye"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-price">
                                            <h3><span>$</span><%= rs2.getString("pprice") %></h3>
                                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                        </div>
                                    </div>
                                   
                                </div>
                                
                            <%
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
                            <%
                            Connection conn1=null;
                            try{
                            	 conn1 = ConnectionProvider.getCon();
                            Statement st1 = conn1.createStatement();
                            ResultSet rs1 = st1.executeQuery("SELECT COUNT(pid) FROM product WHERE status=1");
                            rs1.next();
                            Total_Record = rs1.getInt(1);
                            //out.print(Total_Record);
                            out.print(" Showing <b>" + limit + "</b> Record Out Of <b>" + Total_Record + "</b>");
                           // Calculating the Total Pages
                           Total_page = (int)Math.floor(Total_Record/limit);
                              out.print("<nav aria-label='Page navigation example'>");
                                
                                   out.print("<ul class='pagination justify-content-center'>"); 
                                      out.print("<li class='page-item '>");  
                                       out.print("  <a class='page-link' href='product-list.jsp?page2="+(page2 - 1 == 0 ? page2 = 1 : (page2 - 1)) +"' >Previous</a>");   
                               
                                       out.print("</li>");
                                        for(int i=1;i<=Total_page;i++ )
                                        {
                                      out.print("  <li class='page-item active'><a class='page-link' href='product-list.jsp?page2="+i+"'>"+i+"</a></li>");
                                        }
                                       out.print(" <li class='page-item'>");
                                          out.print(" <a class='page-link' href='product-list.jsp?page2="+((page2 + 1) > Total_page ? (page2 = Total_page + 1) : page2 + 1) +"'>Next</a>"); 
                                       out.print(" </li>");
                                  out.print("  </ul>");
                              out.print(" </nav>"); 
                             
                            }
                            catch(Exception ex)
                            {
                            	out.print(ex);
                            	
                            }
                            finally
                            {
                            	conn.close();
                            }
                                
                                %>
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
            
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js">
        </script>
            <!-- Template Javascript -->
            <script src="js/main.js"></script>
                         
        <script>
            $(document).ready(function() {
         
             function filter_price()
             {
                 $(".filterprice").html("<img src='loading.gif' id='Loading' />");
                 var min_price = $('#price_min_value').val();
                 var max_price = $('#price_max_value').val();
                     var cid = $('#cid:checked').val();
                     
                 $.ajax({
                 url:"fetch_price.jsp",
                 type:"POST",
                 data:{Min_price:min_price,Max_price:max_price,Cid:cid},
                 success:function(data)
                 {
                  $('#cname').html(data);

                 }
                 });
             }
                    $("#my_slider").slider({
                    range:true,
                    min:50,
                    max:5000,
                    values:[50,5000],
                    step:50,
                        stop: function(event, ui) {
                          $('#price_show').html(ui.values[0]+" - "+ui.values[1]);
                          $('#price_min_value').val(ui.values[0]);
                          $('#price_max_value').val(ui.values[1]);
                                                   filter_price();
                        }
                    });
             
                
          
            });
           
           
        </script>
            <script type="text/javascript">
           

             
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
            //product by their category
            
           function getcategory(val)
     {
 $.ajax({
 url:"shortcategory.jsp",
 type:"POST",
 data:'cid='+val,
 success:function(data)
 {
 $("#cname").html(data);
 }
 })
 }
  
     
     $('#searchproduct').on("keyup",function(){
     var search = $(this).val();
    // alert("Hello "+search);
     if(search!='')
                {
                $.ajax({
                    url: "searchproductlist.jsp",
                    type: "POST",
                    data: { searchp: search },
                    success: function (data) {
                        if(data)
                        {
                        $("#cname").html(data);
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
                $("#cname").html('No Such Product');
                }
     });   
            </script>
        </body>
    </html>
