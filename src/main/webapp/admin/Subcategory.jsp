
<!-- B2C(Businness to Customer Project.) -->
<%@page import="com.ecom.*" %>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page errorPage="error.jsp" %>
<%
String email =  session.getAttribute("email").toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ecommerce | SubCategory</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="Search-bar.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="dist/img/AdminLTELogo.png"
				alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="index3.html" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
					<li class="nav-item d-none d-sm-inline-block"> 
					 <div  class="search"  id="search-bar" >
                         <input type="text"  id="search" autocomplete="off">
                     </div>
                    </li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
					<li>
						<a href="logout.jsp"> <button class="btn btn-block btn-outline-info">Logout</button></a>
					
					</li>
				<!-- Messages Dropdown Menu -->

<!-- Search Displaying  -->




				 

				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-controlsidebar-slide="true"
					href="#" role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->


		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="index3.html" class="brand-link"> <img
				src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">AdminLTE 3</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
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
											</div>
						<!-- /.col -->
 <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
          
            </ol>
            
          </div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->
	<div style="position: relative; margin-top: -35px; margin-left: 20px">
				<!--	<div class="list-group" id="search-data">
				</div>  -->
				<ul id="searchlist">
					<li id="search-data"></li>
				</ul>
			</div>
			<!-- Main content -->
			<section class="content">

				<div class="container-fluid">

					<!-- /.row -->
					<!-- Main row -->
					<div class="row">
						<!-- Left col -->
						<section class="col-lg-12">
							<!-- Custom tabs (Charts with tabs)-->
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Subcategory</h3>
									<div class="card-tools">
										<ul class="nav nav-pills ml-auto">
											<li class="nav-item"> <a class="nav-link active" href="addsubcategory.jsp" >Add Subcategory</a></li>
											<!-- <li class="nav-item"><a class="nav-link"
												href="#sales-chart" data-toggle="tab">Donut</a>
												</li> -->
										</ul>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!--  
									<div class="tab-content p-0">-->

									<div class="card-header border-transparent"></div>
									<!-- /.card-header -->
									<div class="card-body">
										<div class="table-responsive">
                         <%
                         int Total_Records =0;
                         int Total_Pages  = 0;
                         int limit = 5;
                         int page1=0;
                         if(request.getParameter("page1")!=null)
                         {
                        	 page1 = Integer.parseInt(request.getParameter("page1"));
                         }
                         else
                         {
                        	 page1=1;
                         }
                         int start_form = (page1-1)*limit;
                         try
                         {
                         Connection conn = ConnectionProvider.getCon();
                         Statement st = conn.createStatement();
                         ResultSet rs = st.executeQuery("SELECT * FROM subcategory ORDER BY sid DESC LIMIT "+start_form+","+limit+"");
                         %>														
											<table class="table m-0">
												<thead>
													<tr>
														<th>ID</th>
														<th>Name</th>
														<th>Image</th>
														<th>Created At</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
												<% while(rs.next()){ %>
													<tr>
														<td><a href="#"><%= rs.getInt("sid") %></a></td>
														<td><%=  rs.getString("sname") %></td>
														<td>
													<img src="subcategoryimg/<%= rs.getString("simage") %>" alt="img" width="80" height="95">
														</td>
														<td><span class="badge badge-success"><%= rs.getString("created_at") %></span></td>
													<td>
													<a href="deletesubcategory.jsp?sid=<%= rs.getInt("sid") %>"><i class="fa fa-trash red-color"></i></a>
													&nbsp; &nbsp;
													<a href="editsubcategory.jsp?sid=<%= rs.getInt("sid") %>"><i class="fa fa-edit red-color"></i></a>
													</td>
													</tr>
												<% 
												}
												}catch(Exception ex)
                                                   {
													ex.printStackTrace();
                                                   }finally
                                                   {
                                                	 
                                                   }
                         
												
												%>
												</tbody>
											</table>
											
										</div>
										<!-- /.table-responsive -->
									</div>
									
									<!-- /.card-body -->
									<div class="card-footer clearfix">
									<%
									try
									{
									Connection conn1 = ConnectionProvider.getCon();
									Statement st1 = conn1.createStatement();
									ResultSet rs1 = st1.executeQuery("SELECT COUNT(sid) FROM subcategory");
								    rs1.next();
								    Total_Records =Integer.parseInt(rs1.getString(1));
								   out.print(" Showing <b>"+limit+"</b> Record Out Of <b>"+Total_Records+"</b>");
									// Calculating The Number of Pages.
									Total_Pages = (int)Math.floor(Total_Records/limit);
										    
								 out.print("<ul class='pagination pagination-sm m-0 float-right'>"); 
								 
								out.print("<li class='page-item'><a class='page-link' href='Subcategory.jsp?page1="+(page1-1==0?page1=1:(page1-1))+"'>&laquo;</a></li>");
								for(int i=1;i<=Total_Pages;i++)
								{
								out.print("<li class='page-item'><a class='page-link' href='Subcategory.jsp?page1="+i+"'>"+i+"</a></li>");
								}
								out.print("<li class='page-item'><a class='page-link' href='Subcategory.jsp?page1="+((page1 + 1)>Total_Pages?(page1=Total_Pages+1):page1+1)+"'>&raquo;</a></li>");
								 
								out.print("</ul>");
								
									}
									catch(Exception ex)
									{
										ex.printStackTrace();
									}
									%>
								
									</div>
       
					

									<!-- 	</div> -->
								</div>
								<!-- /.card-body -->
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
	</div>
	<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<footer class="main-footer">
		<strong>Copyright &copy; 2014-2021 <a
			href="https://adminlte.io">Abhishek</a>.
		</strong> All rights reserved.
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
	<script
		src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dist/js/pages/dashboard.js"></script>
	  <!-- Ajax and Jquery. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
     $("#search").on("keyup", function () {
                var search_term = $(this).val();
                if(search_term!='')
                {
                $.ajax({
                    url: "livesearch.jsp",
                    type: "POST",
                    data: { search2: search_term },
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
