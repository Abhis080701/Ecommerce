 <%@page import="com.ecom.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	String lemail = request.getParameter("lemail");
	String lpass = request.getParameter("lpassword");
	%>
	<%
	Connection conn = ConnectionProvider.getCon();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT email,password FROM admin");
	try {
		rs.next();
		if (rs.getString("email").equals(lemail) && rs.getString("password").equals(lpass)) {
			session.setAttribute("email", lemail);
			response.sendRedirect("index1.jsp");
		} else {
			response.sendRedirect("index.jsp?msg=failed");

		}
	} catch (Exception e) {
		out.print(e.getMessage());
		e.printStackTrace();

	}
	%>
</body>
</html>