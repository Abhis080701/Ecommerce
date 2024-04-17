<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ecom.ConnectionProvider"%>
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
ResultSet rs= null;
int cid = Integer.parseInt(request.getParameter("cid"));

try
{
	conn = ConnectionProvider.getCon();
	st = conn.createStatement();
	rs = st.executeQuery("SELECT * FROM category WHERE cid='"+cid+"' ");
	while(rs.next())
	{
%>
<tr>
<td><%= rs.getString("cid")%></td>
<td><%= rs.getString("cname") %></td>
<td>Done</td>
</tr>
<%
	}
}catch(Exception ex){out.print(ex);}finally{conn.close();}
%>
</body>
</html>