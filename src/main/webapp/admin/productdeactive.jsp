<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.ecom.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
int pid  = Integer.parseInt(request.getParameter("pid"));

try
{
	Connection conn = ConnectionProvider.getCon();
	PreparedStatement stmp;
	stmp = conn.prepareStatement("UPDATE product SET status=0 WHERE pid="+pid+"");
	stmp.executeUpdate();
	response.sendRedirect("Product.jsp");
	conn.close();
}catch(Exception ex)
{
ex.printStackTrace();
out.print(ex);
}
%>
</body>
</html>