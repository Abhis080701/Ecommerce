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
int sid =Integer.parseInt(request.getParameter("sid"));
try
{
	Connection conn = ConnectionProvider.getCon();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM subcategory WHERE sid='" + sid + "'");
	rs.next();
	File f = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/subcategoryimg/"
	+ rs.getString("simage") + "");
	f.delete();
	//out.print("Deleted");

	int i = st.executeUpdate("DELETE FROM subcategory WHERE sid='" + sid + "'");
	response.sendRedirect("Subcategory.jsp");
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