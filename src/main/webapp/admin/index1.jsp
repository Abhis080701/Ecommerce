<!-- B2C(Businness to Customer Project.) -->

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
<title>Ecommerce</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

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
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>
				<!-- Messages Dropdown Menu -->


                 <a href="logout.jsp"><button class="btn btn-block btn-outline-info" >Logout</button></a>

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
							<h1 class="m-0">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">
						<div class="col-lg-12" style="margin-left:600px">
							 
						<canvas id="myChart" style="width:100%;max-width:500px" ></canvas>
							 
						</div>
						</br>
					 <div class="col-lg-12">
					 
					 </div>
						<div class="col-lg-12" style="margin-left:600px">
						
								<canvas id="myBarChart" style="width:100%;max-width:600px" ></canvas>
								
						</div>
					
					</div>
					<!-- /.row -->
					<!-- Main row -->
					<div class="row">
						<!-- Left col -->
						<section class="col-lg-12">
							<!-- Custom tabs (Charts with tabs)-->
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-user mr-1"></i> customer
									</h3>
									<div class="card-tools">
										<ul class="nav nav-pills ml-auto">
											<li class="nav-item"><a class="nav-link active"
												href="#revenue-chart" data-toggle="tab">Area</a></li>
											<li class="nav-item"><a class="nav-link"
												href="#sales-chart" data-toggle="tab">Donut</a></li>
										</ul>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!--  -->
									<div class="tab-content p-0">








										<div class="card-header border-transparent"></div>
										<!-- /.card-header -->
										<div class="card-body">
										<!-- 
											<div class="table-responsive">
												<table class="table m-0">
													<thead>
														<tr>
															<th>Order ID</th>
															<th>Item</th>
															<th>Status</th>
															<th>Popularity</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><a href="pages/examples/invoice.html">OR9842</a></td>
															<td>Call of Duty IV</td>
															<td><span class="badge badge-success">Shipped</span></td>
															<td>
																<div class="sparkbar" data-color="#00a65a"
																	data-height="20">90,80,90,-70,61,-83,63</div>
															</td>
														</tr>
														<tr>
															<td><a href="pages/examples/invoice.html">OR1848</a></td>
															<td>Samsung Smart TV</td>
															<td><span class="badge badge-warning">Pending</span></td>
															<td>
																<div class="sparkbar" data-color="#f39c12"
																	data-height="20">90,80,-90,70,61,-83,68</div>
															</td>
														</tr>
														<tr>
															<td><a href="pages/examples/invoice.html">OR7429</a></td>
															<td>iPhone 6 Plus</td>
															<td><span class="badge badge-danger">Delivered</span></td>
															<td>
																<div class="sparkbar" data-color="#f56954"
																	data-height="20">90,-80,90,70,-61,83,63</div>
															</td>
														</tr>
														<tr>
															<td><a href="pages/examples/invoice.html">OR7429</a></td>
															<td>Samsung Smart TV</td>
															<td><span class="badge badge-info">Processing</span></td>
															<td>
																<div class="sparkbar" data-color="#00c0ef"
																	data-height="20">90,80,-90,70,-61,83,63</div>
															</td>
														</tr>
														<tr>
															<td><a href="pages/examples/invoice.html">OR1848</a></td>
															<td>Samsung Smart TV</td>
															<td><span class="badge badge-warning">Pending</span></td>
															<td>
																<div class="sparkbar" data-color="#f39c12"
																	data-height="20">90,80,-90,70,61,-83,68</div>
															</td>
														</tr>
														<tr>
															<td><a href="pages/examples/invoice.html">OR7429</a></td>
															<td>iPhone 6 Plus</td>
															<td><span class="badge badge-danger">Delivered</span></td>
															<td>
																<div class="sparkbar" data-color="#f56954"
																	data-height="20">90,-80,90,70,-61,83,63</div>
															</td>
														</tr>
														<tr>
															<td><a href="pages/examples/invoice.html">OR9842</a></td>
															<td>Call of Duty IV</td>
															<td><span class="badge badge-success">Shipped</span></td>
															<td>
																<div class="sparkbar" data-color="#00a65a"
																	data-height="20">90,80,90,-70,61,-83,63</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											 -->
											<!-- /.table-responsive -->
										</div>
										<!-- /.card-body -->
										<div class="card-footer clearfix">
											<a href="javascript:void(0)"
												class="btn btn-sm btn-info float-left">Place New Order</a> <a
												href="javascript:void(0)"
												class="btn btn-sm btn-secondary float-right">View All
												Orders</a>
										</div>
										<!-- /.card-footer -->









									</div>
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
	<%
	int catg= 4,subg = 6,prog = 15,user = 500,user_s_order=1200,user_cart_order=2005;

	
	
	%>
<script>

//pie Chart For Categories

var xValues = ["Category", "SubCategory", "Products"];
var yValues = [<%= catg %>,<%= subg %>, <%= prog %>];
var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797"
];

new Chart("myChart", {
  type: "pie",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "Distribution Of An Categories"
    }
  }
});

// Bar Char For User

var Xbar = ["user","user single product order","user cart order"];
var Ybar = [<%= user %>, <%= user_s_order %>,<%= user_cart_order %>];
var Colors = ["red","blue","orange"];

new Chart("myBarChart",{
 width:130,
type:"bar",

data:{

labels:Xbar,

datasets:[{

backgroundColor:Colors,
data:Ybar
}]

},

options:{
legend:{display:false},
title:
{
display:true,
text:"User Distribution"
}
}

});

</script>
<!-- Graphs -->

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
</body>
</html>
