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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
 function getcategory(val)
 {
 
 $.ajax({
 url:"check1.jsp",
 type:"POST",
 data:'cid='+val,
 success:function(data)
 {
 $("#cname").html(data);
 }
 })
 }

 </script>
<script>
$(document).ready(function(){
$("#price").on("click",function(e){
e.preventDefault();
var p1 = $('#p1').val();
var p2 = $('#p2').val();

alert(p1+"----"+p2)
$.ajax({
url:"check.jsp",
type:"get",
data:{p1:p1,p2:p2},
success:function(data)
{

$("#Product").html(data);
}
})
});



});
</script>
</head>
<body>
<% 
Connection conn = null;
Statement st,st1 = null;
ResultSet rs,rs1= null;

try
{
	conn = ConnectionProvider.getCon();
	st = conn.createStatement();
	st1 = conn.createStatement();
	rs = st.executeQuery("SELECT * FROM product");
	rs1 = st1.executeQuery("SELECT * FROM category ");

%>

<center>



<b>Min-price: </b><input type="text" id="p1" size="4" ><br><br>
<b>Max-Price: </b><input type="text" id="p2" size="4" ><br>
<button type="submit" id="price">Go</button>
<br>
<br>
<br/>
<form method="post">
<%
while(rs1.next())
{
%>
<input type="radio" name="cid" id="cid" value="<%= rs1.getString("cid") %>" onChange="getcategory(this.value);" ><b><%= rs1.getString("cname") %>:</b> <br>

<%
}
%>

</form>

<br>
<br>
<br/>
<table border="1">
<thead>
<th>Product Name</th>
<th>Product Price</th>
<th>Product Image</th>
</thead>
<tbody id="cname">
</tbody>
<tbody id="Product">
<%
while(rs.next())
{


%>
<tr>
<td><%= rs.getString("pname") %></td>
<td><%= rs.getString("pprice") %></td>
<td>RedmiY2.png</td>
</tr>
<%
}
}catch(Exception ex){out.print(ex);}finally{conn.close();}
%>
</tbody>
</table>


</center>
</body>
</html>