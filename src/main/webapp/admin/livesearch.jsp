<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.ecom.*"%>
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
	String search1 = request.getParameter("search1");
	String search2 = request.getParameter("search2");
	String search3 = request.getParameter("search3");
if(search1!=null )
{
	try {
		Connection conn1 = ConnectionProvider.getCon();
		Statement st1 = conn1.createStatement();
		ResultSet rs1 = st1.executeQuery("SELECT * FROM category WHERE cname LIKE '%" + search1 + "%'");
		while (rs1.next()) {
	%>
	<a href="#" class="active"><span
		style="color: black;"><%=rs1.getString("cname")%> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="categoryimg/<%= rs1.getString("cimage") %>" alt="Product Image1" width="40" height="40"></a>
	<%
	}
		conn1.close();
	} catch (Exception ex) {
	ex.printStackTrace();
	out.print(ex);
	}
}
if(search2!=null)
{
	try {
	Connection conn2 = ConnectionProvider.getCon();
	Statement st2 = conn2.createStatement();
	ResultSet rs2 = st2.executeQuery("SELECT * FROM subcategory WHERE sname LIKE '%" + search2 + "%'");
	while (rs2.next()) {
	%>
	<a href="#" class="active"><span
		style="color: black;"><%=rs2.getString("sname")%> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="subcategoryimg/<%= rs2.getString("simage") %>" alt="Product Image1" width="40" height="40"></a>
	<%
	}
	conn2.close();
	} catch (Exception ex) {
	ex.printStackTrace();
	out.print(ex);
	}
	
}
if(search3!=null)
{
	try {
	Connection conn3 = ConnectionProvider.getCon();
	Statement st3 = conn3.createStatement();
	ResultSet rs3 = st3.executeQuery("SELECT * FROM product WHERE pname LIKE '%" + search3 + "%'");
	while (rs3.next()) {
	%>
	<a href="#" class="active"><span
		style="color: black;"><%=rs3.getString("pname")%> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="productimg/product2/<%= rs3.getString("pimage2") %>" alt="Product Image1" width="40" height="40"></a>
	<%
	}
	conn3.close();
	} catch (Exception ex) {
	ex.printStackTrace();
	out.print(ex);
	
	}
	
}
	%>
</body>
</html>