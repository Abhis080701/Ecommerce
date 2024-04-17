
<%@page contentType="text/html; charset=ISO-8859-1" language="java"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ecom.*"%>
<%@page errorPage="error.jsp"%>
<%
String email = session.getAttribute("email").toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ecommerce | Category</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
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
				<li class="nav-item"><a href="logout.jsp">
						<button class="btn btn-block btn-outline-info">Logout</button>
				</a></li>
				<li class="nav-item"></li>
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
				<!-- Sidebar user (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">Alexander Pierce</a>
					</div>
				</div>

				<!-- SideBar menu -->

				<jsp:include page="sidebar-menu.jsp"></jsp:include>

				<!-- ./End SideBar Menu -->

				
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Add Category</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active"><a href="Category.jsp"
									class="btn  btn-success">ViewCategory</a></li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- left column -->
						<div class="col-sm-12">
							<!-- general form elements -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Category</h3>

								</div>
								<!-- /.card-header -->
								<!-- form start -->



                   <% 
                   String message =(String)session.getAttribute("Category");
                    String alert =(String)session.getAttribute("alertaddcategory");
                    %>
								<div style="display:<% if(alert!=null){out.print(alert);}else{out.print("none");} session.removeAttribute("alertaddcategory");%>" class="alert alert-success alert-dismissable mt-3">
                        <button  type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong> <% if(message!=null){out.print(message);} session.removeAttribute("Category"); %>  </strong>
                           </div>
								<form action="addcategory" method="POST"
									enctype="multipart/form-data">

									<div class="card-body">
										<div class="form-group">
											<label for="exampleInputEmail1">Name</label> <input
												type="text" class="form-control" name="Cname"
												placeholder="Enter Name">

											<%
											String mesg = request.getParameter("mesg");
											if ("NameR".equals(mesg)) {
											%>
											<p>Name Required !</p>
											<%
											}
											%>

										</div>
										<!--  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                  </div> -->
										<div class="form-group">
											<label for="exampleInputFile">Upload Image</label>
											<div class="input-group">
												<div class="custom-file">
													<input type="file" class="custom-file-input" name="cimage"
														required> <label class="custom-file-label"
														for="exampleInputFile">Choose file</label>
												</div>
												<div class="input-group-append">
													<!--   <span class="input-group-text">Upload</span>-->
												</div>
											</div>
										</div>
										<div class="form-check">
											<!--  <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label> -->
										</div>
									</div>


									<div class="card-footer">
										<button type="submit" class="btn btn-primary" name="category">Submit</button>
									</div>
								</form>




								<!-- /.End Form -->



							</div>
							<!-- /.card -->
						</div>
						<!--/.col (left) -->
						<!-- right column -->

						<!--/.col (right) -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.2.0-rc
			</div>
			<strong>Copyright &copy; 2014-2021 <a
				href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
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
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- Page specific script -->
	<script>
$(function () {
  bsCustomFileInput.init();
});
</script>
</body>
</html>
