<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ecom.*,java.sql.*" %>
<%@ page import="java.io.File" %>
<%@page errorPage="error.jsp"%>
<%
String email = session.getAttribute("email").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
int cid =Integer.parseInt(request.getParameter("cid"));
try
{
	Connection conn = ConnectionProvider.getCon();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM category WHERE cid='" + cid + "'");
	rs.next();
	File f = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/categoryimg/"
	+ rs.getString("cimage") + "");
	f.delete();
	//out.print("Deleted");

	int i = st.executeUpdate("DELETE FROM category WHERE cid='" + cid + "'");
	response.sendRedirect("Category.jsp");
	conn.close();
	
}
catch(Exception ex)
{
	ex.printStackTrace();
	ConnectionProvider.getCon().close();
}

%>
</body>
</html>