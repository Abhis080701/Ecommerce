<%@page import="com.ecom.ConnectionProvider"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
Statement st2 = null;
try
{
conn = ConnectionProvider.getCon();
st2 = conn.createStatement();
if(request.getParameter("bid")!=null)
{
st2.executeUpdate("UPDATE user SET status=0 WHERE uid='"+request.getParameter("bid")+"'");
response.sendRedirect("viewuser.jsp?mesgu=block");
}
if(request.getParameter("buid")!=null)
{
st2.executeUpdate("UPDATE user SET status=1 WHERE uid='"+request.getParameter("buid")+"'");
response.sendRedirect("viewuser.jsp?mesgu=unblock");
}
}catch(Exception ex)
{
System.out.print(ex);	
}
%>
</body>
</html>