<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.ResultSet" %>
      <%@page import="com.ecom.*" %>  
        <%@page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
//String email=(String)session.getAttribute("Email");
if(request.getParameter("action")!=null && request.getParameter("action").equals("BuyNoworder"))
{
	try
	{
	String totalamount = request.getParameter("grand_total");
	String productquantity = request.getParameter("products");
	String deliverycharge = request.getParameter("deliverycharges");
	String name = request.getParameter("name");
	String useremail = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String paymentmode =request.getParameter("pmode");
	String show="";
	
	String status="Order Pending";
	
		Connection conn = ConnectionProvider.getCon();
		Statement st = conn.createStatement();
		st.executeUpdate("INSERT INTO user_order(name,email,phone,address,paymentmode,productsQuantity,TotalAmount,deliverycharges,status) VALUES('"+name+"','"+useremail+"','"+phone+"','"+address+"','"+paymentmode+"','"+productquantity+"','"+totalamount+"','"+deliverycharge+"','"+status+"')");
		
		
		show += " <div class='text-center'><h1 class='display-4 mt-2 text-danger'>Thank You!</h1>  <h2 class='text-success'>Your Order Placed SuccessFully!</h2>   <h4 class='bg-danger text-light rounded p-2'>Item Purchased:  "+productquantity+"  </h4>    <h4>Name:  "+name+"  </h4> <h4>Email:  "+useremail+"  </h4>  <h4>Phone :  "+phone+"  </h4>  <h4>Total Amount Purchased:  ₹ "+totalamount+"  </h4>    <h4>Payment Mode:  "+paymentmode+"  </h4></div>" ;
out.print(show);
	}
	catch(Exception e)
	{
		out.print(e);
		
	}
}

%>
</body>
</html>