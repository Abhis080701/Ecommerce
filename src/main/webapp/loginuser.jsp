<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.ecom.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String email = request.getParameter("uemail");
	String password=request.getParameter("upass");
	
	try
	{
	Connection conn = ConnectionProvider.getCon();
	
	Statement st = conn.createStatement();
	ResultSet rs=  st.executeQuery("SELECT COUNT(uid) FROM user WHERE uemail='"+email+"' AND upassword='"+password+"' ");
	rs.next();
	if(rs.getInt(1)==1)
	{
		session.setAttribute("Email", email);
		response.sendRedirect("index.jsp");
	}
	else
	{
		response.sendRedirect("Login.jsp?mesg=loginfailed");
	}
	
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	



%>
</body>
</html>