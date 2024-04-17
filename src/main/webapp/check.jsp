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
int p1 = Integer.parseInt(request.getParameter("p1"));
int p2  = Integer.parseInt(request.getParameter("p2"));
try
{
	conn = ConnectionProvider.getCon();
	st = conn.createStatement();
	rs = st.executeQuery("SELECT * FROM product WHERE pprice>="+p1+" AND pprice<="+p2+"");
	while(rs.next())
	{
%>
<tr>
<td><%= rs.getString("pname")%></td>
<td><%= rs.getString("pprice") %></td>
<td><%= rs.getString("pimage1") %></td>
</tr>
<%
	}
}catch(Exception ex){out.print(ex);}finally{conn.close();}
%>
</body>
</html>


                            