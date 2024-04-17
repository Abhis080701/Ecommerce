<%@page import="com.ecom.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
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
Statement st = null;
ResultSet rs = null;
try{
	conn = ConnectionProvider.getCon();
	st = conn.createStatement();
	rs = st.executeQuery("SELECT * FROM category WHERE cid='"+request.getParameter("cid")+"''");
	while(rs.next())
	{
		out.print(rs.getInt("cid"));
		
	}
	
}catch(Exception ex){out.print(ex);}
finally{conn.close();}

%>
</body>
</html>