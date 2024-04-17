
<%@page contentType="text/html; charset=ISO-8859-1" language="java"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ecom.*"%>
<%@page import="java.sql.*,java.util.Random"%>
<%@page errorPage="error.jsp"%>
<%
String email = session.getAttribute("email").toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ecommerce | Product</title>

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
				

				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown">
				
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						
						
						
						
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown">
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						
					</div></li>
				<li class="nav-item">
				<a href="logout.jsp">
						<button class="btn btn-block btn-outline-info">Logout</button>
				</a>
				</li>
				<li class="nav-item">
				
				</li>
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

				<!-- SidebarSearch Form -->

				<jsp:include page="sidebar-menu.jsp"></jsp:include>

				<!-- Sidebar Menu -->

				<!-- /.sidebar-menu -->
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
							<h1>Edit Product</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active"><a href="Product.jsp"
									class="btn  btn-success">ViewProduct</a></li>
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
									<h3 class="card-title">Product</h3>

								</div>
								<!-- /.card-header -->
								<!-- form start -->




								<form action="editproduct" method="POST"
									enctype="multipart/form-data">


									<%
									int pid = Integer.parseInt(request.getParameter("pid"));
									try {
										Connection conn = ConnectionProvider.getCon();
										Statement st = conn.createStatement();
										ResultSet rs = st.executeQuery("SELECT * FROM product WHERE pid=" + pid + "");

										while (rs.next()) {
									%>
									<div class="card-body">
										<div class="form-group">
											<label for="exampleInputEmail1">Product serial Number</label>

											<input type="hidden" name="editpid"
												value="<%=rs.getInt("pid")%>"> <input type="text"
												class="form-control" name="editpserialnum"
												value="<%=rs.getString("pserialnum")%>">


										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Name</label> <input
												type="text" class="form-control" name="editpname"
												value="<%=rs.getString("pname")%>"
												placeholder="Enter Name">

										</div>
										<!--  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                  </div> -->


										<div class="form-group">
											<label for="exampleInputEmail1">Select SubCategory</label> <select
												class="form-control" name="editsid">
												<option selected disabled>-----Select
													SubCategory-----</option>
												<%
												try {
													Connection conn1 = ConnectionProvider.getCon();
													Statement st1 = conn.createStatement();
													ResultSet rs1 = st1.executeQuery("SELECT * FROM subcategory");
													while (rs1.next()) {
														if (rs.getString("sid").equals(rs1.getString("sid"))) {
												%>
												<option value="<%=rs1.getInt("sid")%>" selected><%=rs1.getString("sname")%></option>
												<%
												} else {
												%>
												<option value="<%=rs1.getInt("sid")%>"><%=rs1.getString("sname")%></option>
												<%
												}
												}
												} catch (Exception ex) {
												ex.printStackTrace();
												}
												%>
											</select>

										</div>
                   
	                     <p>Old Image1 :</p>  <img src="productimg/product1/<%= rs.getString("pimage1") %>" alt="Image1" width="78" height="90">
										<br>
										<div class="form-group">
											<label for="exampleInputFile">Upload Image1</label>
											<div class="input-group">
												<div class="custom-file">
													<input type="file" class="custom-file-input" name="editpimage1">
												
													<label class="custom-file-label" for="exampleInputFile">Choose
														file Image1</label>
														
												</div>
												<div class="input-group-append">
												
													<!--   <span class="input-group-text">Upload</span>-->
												</div>
											</div>
										</div>
										 <p>Old Image2 :</p>          <img src="productimg/product2/<%= rs.getString("pimage2") %>" alt="Image2" width="78" height="90">
										<br>
										<div class="form-group">
											<label for="exampleInputFile">Upload Image2</label>
											<div class="input-group">
												<div class="custom-file">
													<input type="file" class="custom-file-input" name="editpimage2">
													<label class="custom-file-label" for="exampleInputFile">Choose
														file Image2</label>
												</div>
												<div class="input-group-append">
													<!--   <span class="input-group-text">Upload</span>-->
												</div>
											</div>
										</div>
 <p>Old Image3 :</p>          <img src="productimg/product3/<%= rs.getString("pimage3") %>" alt="Image3" width="78" height="90">
											<br>
										<div class="form-group">
											<label for="exampleInputFile">Upload Image3</label>
											<div class="input-group">
												<div class="custom-file">
													<input type="file" class="custom-file-input" name="editpimage3">
													<label class="custom-file-label" for="exampleInputFile">Choose
														file Image3</label>
												</div>
												<div class="input-group-append">
													<!--   <span class="input-group-text">Upload</span>-->
												</div>
											</div>
										</div>
                          <p>Old Image4 :</p><img src="productimg/product4/<%= rs.getString("pimage4") %>" alt="Image4" width="78" height="90">
										<div class="form-group">
											<label for="exampleInputFile">Upload Image4</label>
											<div class="input-group">
												<div class="custom-file">
													<input type="file" class="custom-file-input" name="editpimage4">
													<label class="custom-file-label" for="exampleInputFile">Choose
														file Image4</label>
												</div>
												<div class="input-group-append">
													<!--   <span class="input-group-text">Upload</span>-->
												</div>
											</div>
										</div>
							 <p>Old Image5 :</p> <img src="productimg/product5/<%= rs.getString("pimage5") %>" alt="Image5" width="78" height="90">
										<br>
										<div class="form-group">
											<label for="exampleInputFile">Upload Image5</label>
											<div class="input-group">
												<div class="custom-file">
													<input type="file" class="custom-file-input" name="editpimage5">
													<label class="custom-file-label" for="exampleInputFile">Choose
														file Image5</label>
												</div>
												<div class="input-group-append">
													<!--   <span class="input-group-text">Upload</span>-->
												</div>
											</div>
										</div>

										<div class="form-group">
											<label for="exampleInputEmail1">Features/Description</label>

											<textarea   style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"    name="editpfeature"><%= rs.getString("pfeature") %></textarea>

										</div>

										<div class="form-group">
											<label for="exampleInputEmail1">Price</label> <input
												type="text" class="form-control" name="editpprice"
												placeholder="Enter Price"  value="<%= rs.getString("pprice") %>">			</div>

										<div class="form-group">
											<label for="exampleInputEmail1">Selling Price</label> <input
												type="text" class="form-control" name="editpsellprice"
												placeholder="Enter Selling Price"  value="<%= rs.getString("psellprice") %>">

										</div>

										<div class="form-group">
											<label for="exampleInputEmail1">Size</label> <input
												type="text" class="form-control" name="editpsize"
												placeholder="Enter  size"  value="<%= rs.getString("psize") %>">

										</div>

										<div class="form-group">
											<label for="exampleInputEmail1">color</label> <input
												type="text" class="form-control" name="editpcolor"
												placeholder="Enter color"  value="<%= rs.getString("pcolor") %>">

										</div>

										<div class="form-group">
											<label for="exampleInputEmail1">Status</label> <input
												type="number" class="form-control" name="editstatus"
												placeholder="Enter Status"  value="<%= rs.getInt("status") %>">

										</div>

										<div class="form-check">
											<!--  <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label> -->
										</div>
									</div>


									<div class="card-footer">
										<button type="submit" class="btn btn-primary"
											name="editproduct">Submit</button>
									</div>

									<%
									}
									} catch (Exception ex) {
									ex.printStackTrace();
									out.print(ex);
									}
									%>

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
