<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.ecom.*,java.sql.Connection,java.sql.ResultSet,java.sql.Statement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	String search1 = request.getParameter("search1");
	if (search1 != null) {
		try {
			Connection conn1 = ConnectionProvider.getCon();
			Statement st1 = conn1.createStatement();
			ResultSet rs1 = st1.executeQuery("SELECT * FROM product WHERE pname LIKE '%" + search1 + "%' AND status=1 ");
			while (rs1.next()) {
		%>
		<a href="product-detail.jsp?pname=<%= rs1.getString("pname") %>" class="active"><span style="color: black;"><%=rs1.getString("pname")%> </span></a>
		<%
		}
			conn1.close();
		} catch (Exception ex) {
		ex.printStackTrace();
		out.print(ex);
		}
	}
	%>
</body>
</html>