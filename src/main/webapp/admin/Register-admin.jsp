<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
 <%@page import="com.ecom.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String pass = request.getParameter("password");
%>
	<%
	try {

		Connection conn = ConnectionProvider.getCon();
		Statement st = conn.createStatement();
		//Checking the Duplicate record ie.. email
		String checkDublicateEntry = "SELECT COUNT(*) FROM admin WHERE email='" + email + "'";
		ResultSet rs = st.executeQuery(checkDublicateEntry);
		rs.next();
		String CountEntry = rs.getString(1);
		out.print(CountEntry);
		if(CountEntry.equals("0")) {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO admin(fullname,email,password) VALUES (?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.executeUpdate();
			response.sendRedirect("register.jsp?msg=valid");
		} else {
			response.sendRedirect("register.jsp?msg=DuplicateEntry");
		}
		
	} catch (Exception e) {
		out.print(e.getMessage());
		e.printStackTrace();
		response.sendRedirect("register.jsp?msg=invalid");
	}
	%>
</body>
</html>