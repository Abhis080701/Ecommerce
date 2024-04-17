
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page errorPage="error.jsp" %>
<%@page import="com.ecom.ConnectionProvider" %>
<%@page import="java.sql.Connection,java.sql.ResultSet,java.sql.Statement" %>
<%
String email=session.getAttribute("email").toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ecommerce</title>
 
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>
      <!-- Messages Dropdown Menu -->
      
     
      
      
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Abhishek</a>
        </div>
      </div>

 
      <!-- Sidebar Menu -->
     
     <jsp:include page="sidebar-menu.jsp"></jsp:include>
     
          <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">ProductS</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Product Order's</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
     
        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
          <!-- Left col -->
          <section class="col-lg-12">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                 		<i class="fas fa-shopping-cart" style="font-size:20px"></i>
                  Product Order's.....
                </h3>
                <div class="card-tools">
                 
                </div>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content p-0">
 
              <div class="card-header border-transparent">               
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table m-0">
                    <thead>
                    
                    <tr>
                      <th>Order ID</th>
                      <th>Info</th>
                      <th>Products(Quantity)</th>
                      <th>Status</th>
                      <th>Ordered Date</th>
                    </tr>
                    
                    </thead>
                    
                    <tbody>
                  
                  <%
                  int Total_Records = 0;
					int Total_Pages = 0;
					int limit = 4;
					int page2 = 0;
					if (request.getParameter("page2") != null) {
						page2 = Integer.parseInt(request.getParameter("page2"));
					} else {
						page2 = 1;
					}
					int start_form = (page2 - 1) * limit;
					
					StringBuilder Email = new StringBuilder();
					Email.append(request.getParameter("uemail"));
					
                  Connection conn = null;
                  Statement st = null;
                  ResultSet rs = null;
                  try
                  {
                   conn = ConnectionProvider.getCon();
                   st = conn.createStatement();
                   rs = st.executeQuery("SELECT * FROM user_order WHERE email='"+Email+"'  ORDER BY orderid  LIMIT  " + start_form + "," + limit + " ");
                   while(rs.next())
                   {
                	  
                  %>
                    <tr>
                    
                      <td><a href=""><%= rs.getInt("orderid") %></a></td>
                      <td><b>Name:</b><span><%= rs.getString("name") %></span><br><b>Email:</b><span><%= rs.getString("email") %></span><br><b>Contact:</b><span><%= rs.getString("phone") %></span><br><b>Address:</b><span><%= rs.getString("address") %></span><br><b>Payment Type:</b><span><%= rs.getString("paymentmode") %></span><br><b>Delivery Charges:</b><span><%= rs.getString("deliverycharges") %></span><br><b>Total Amount:</b><b> &#8377; </b><span><%= rs.getString("TotalAmount") %></span></td>
                       <td><%= rs.getString("productsQuantity") %></td>
                      <td><span class="badge badge-<%= rs.getString("status").equals("Order Pending")?"warning":"success" %>"><%= rs.getString("status") %>
                     
                      
                      </span></td>
                      <td>
                        <div class="sparkbar" data-color="#f39c12" data-height="20"><%= rs.getString("created_at") %></div>
                      </td>
                    </tr>
                 <%
                	   }
                   
                   
                  }catch(Exception ex)
                  {
                 out.print(ex);
                  conn.close();
                  }
                  finally
                  {
                	  conn.close();
                	  st.close();
                	  
                  }
                 %>
                   
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer text-center">
               
                <%
                Connection conn1 = null;
                Statement st1  = null;
                ResultSet rs1 = null;
               
                try
                {
                	conn1=ConnectionProvider.getCon();
                	st1 = conn1.createStatement();
                	rs1  = st1.executeQuery("SELECT COUNT(orderid) FROM user_order WHERE email='"+Email+"'");
                	rs1.next();
                	Total_Records = rs1.getInt(1);
                
                	Total_Pages = (int) Math.floor(Total_Records / limit);
                 out.print("<a href='userorder.jsp?page2="+ (page2 - 1 == 0 ? page2 = 1 : (page2 - 1)) + "&uemail="+Email+"' class='btn btn-sm btn-secondary '>Prev</a>");
             	for (int i = 1; i <= Total_Pages; i++) {
                out.print("<a href='userorder.jsp?page2="+i+"&uemail="+Email+"' class='btn btn-sm btn-info '>"+i+"</a>"); 
             	}
               out.print("<a href='userorder.jsp?page2="+ ((page2 + 1) > Total_Pages ? (page2 = Total_Pages + 1) : page2 + 1) + "&uemail="+Email+"' class='btn btn-sm btn-secondary'>Next</a>");
                }catch(Exception ex)
                {
                	out.print(ex);
                }
                 %>
                 
              </div>
              <!-- /.card-footer -->
          
                </div>
              </div><!-- /.card-body -->
            </div>
            <!-- /.card --> 
            </div>
            <!-- /.card -->
          </section>
       
          <section class="col-lg-5 connectedSortable">

           

            <!-- /.card -->
          </section>
          <!-- right col -->
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">Abhishek</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.2.0-rc
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
</body>
</html>
