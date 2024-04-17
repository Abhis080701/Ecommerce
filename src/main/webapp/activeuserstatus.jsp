<%@page import="com.ecom.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="com.ecom.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<center><h1>Activated!</h1></center>
<%
String uid = request.getParameter("uid");

try
{
	Connection conn = ConnectionProvider.getCon();
	Statement st = conn.createStatement();
	int i = st.executeUpdate("UPDATE user SET status=1 WHERE uid="+uid+"");
	conn.close();
}catch(Exception e)
{
	e.printStackTrace();
}

%>
</body>
</html>