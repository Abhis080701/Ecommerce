<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.ecom.*" %>
    <%@page import="java.io.File" %>
    <%@page errorPage="error.jsp"%>
<%
String email = session.getAttribute("email").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
int pid  = Integer.parseInt(request.getParameter("pid"));

try
{
Connection conn = ConnectionProvider.getCon();
Statement st = conn.createStatement();
ResultSet rs =st.executeQuery("SELECT * FROM product WHERE pid="+pid+"");
rs.next();
File f1 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product1/"+rs.getString("pimage1")+"");
f1.delete();
File f2 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product2/"+rs.getString("pimage2")+"");
f2.delete();
File f3 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product3/"+rs.getString("pimage3")+"");
f3.delete();
File f4 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product4/"+rs.getString("pimage4")+"");
f4.delete();
File f5 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product5/"+rs.getString("pimage5")+"");
f5.delete();

int i = st.executeUpdate("DELETE FROM product WHERE pid="+pid);
response.sendRedirect("Product.jsp");
conn.close();

}
catch(Exception ex)
{
	ex.printStackTrace();
}



%>
</body>
</html>