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
<title></title>
</head>
<body>
<%
String email=(String)session.getAttribute("Email");

if(request.getParameter("addItem")!=null)
{
	
	
	
int pid = Integer.parseInt(request.getParameter("pid"));
String pname = request.getParameter("pname");
String pprice = request.getParameter("pprice");
String pimage =request.getParameter("pimage");
String totalprice=request.getParameter("totalprice");
int quantity =1;
String productcode = request.getParameter("productcode");


if(email!=null)
{
	email =	session.getAttribute("Email").toString();
	
}
else
{
	
	 email="GUEST@gmail.com";
}


//Start of if Loop 1
if(email!="GUEST@gmail.com")
{
	
try{
		
	String useremail = "CART_"+email;
	StringBuilder sb = new StringBuilder(useremail);
	sb.replace(sb.length()-10, sb.length(), " ");// It replace @gmail.com to " " from String 
	
	Connection conn1 = ConnectionProvider.getCon();
	Statement st1 = conn1.createStatement();

	
		st1.executeUpdate("CREATE TABLE	IF NOT EXISTS "+sb+"(id int NOT NULL AUTO_INCREMENT,pid int(200),user_email varchar(200),product_name varchar(200),product_price varchar(300),product_image varchar(300),quantity int(11),total_price varchar(200),product_code varchar(200),created_at timestamp,PRIMARY KEY(id),FOREIGN KEY (pid) REFERENCES product(pid))");
		
		ResultSet rs2 = st1.executeQuery("SELECT COUNT(product_code) FROM "+sb+" WHERE product_code='"+productcode+"'");
		rs2.next();
		int pcode = Integer.parseInt(rs2.getString(1)); 
		//out.println(pcode);
		if(pcode==0)
		{
			st1.executeUpdate("INSERT INTO "+sb+"(pid,user_email,product_name,product_price,product_image,quantity,total_price,product_code) VALUES('"+pid+"','"+email+"','"+pname+"','"+pprice+"','"+pimage+"','"+quantity+"','"+totalprice+"','"+productcode+"')");
			out.println("<script> alert('Item Added ! '); window.location.href='index.jsp' </script>");
			
		}
		else
		{
			out.println("<script> alert('Item Already  Added ! '); window.location.href='index.jsp' </script>");
		}
		
	
	conn1.close();
	}catch(Exception ex)
	{
		
		out.print(ex);
		ex.printStackTrace();
	}
	
}
else
{
	
	
	try
	{
		
Connection conn = ConnectionProvider.getCon();
Statement st = conn.createStatement();
st.executeUpdate("CREATE TABLE IF NOT EXISTS CART_GUEST(id int NOT NULL AUTO_INCREMENT,pid int(200),user_email varchar(200),product_name varchar(200),product_price varchar(300),product_image varchar(300),quantity int(11),total_price varchar(200),product_code varchar(200),created_at timestamp,PRIMARY KEY(id),FOREIGN KEY (pid) REFERENCES product(pid))");
ResultSet rs = st.executeQuery("SELECT COUNT(product_code) FROM CART_GUEST WHERE product_code='"+productcode+"'");	
rs.next();
int pcode = Integer.parseInt(rs.getString(1)); 
//out.println(pcode);
if(pcode==0)
{
	st.executeUpdate("INSERT INTO CART_GUEST(pid,user_email,product_name,product_price,product_image,quantity,total_price,product_code) VALUES('"+pid+"','"+email+"','"+pname+"','"+pprice+"','"+pimage+"','"+quantity+"','"+totalprice+"','"+productcode+"')");
	out.println("<script> alert('Item Added ! G'); window.location.href='index.jsp' </script>");
	
}
else
{
	out.println("<script> alert('Item Already  Added ! G'); window.location.href='index.jsp' </script>");
}
conn.close();
	}catch(Exception ex)
	{
		out.print(ex);
	}
	
// End if Loop 1	
}

//out.println("id: "+pid+"  name: "+pname+"  price: "+pprice+"  pimage:  "+pimage+"  totalprice:  "+totalprice+"  productcode:  "+productcode);
//End of addItem.
}


%>






<%
if(request.getParameter("quantity")!=null)
{
	if(email!=null)
	{
		email =	"CART_"+session.getAttribute("Email").toString();
		
	}
	else
	{
		
		 email="CART_GUEST@gmail.com";
	}
	
	StringBuilder sb3 = new StringBuilder(email);
	sb3.replace(sb3.length()-10, sb3.length(), " ");
	double  totalprice=0D;
	String  quantity = request.getParameter("quantity");
	int id = Integer.parseInt(request.getParameter("id"));
	String price = request.getParameter("pprice");
	
	try
	{
	totalprice  = Double.parseDouble(quantity) * Double.parseDouble(price);
	Connection conn = ConnectionProvider.getCon();
	Statement st = conn.createStatement();
	st.executeUpdate("UPDATE "+sb3+" SET  quantity='"+quantity+"',total_price='"+totalprice+"' WHERE id='"+id+"'");
	conn.close();
	}
	catch(Exception e)
	{
		out.print(e);
	}
	
	
}


%>





<%
if(request.getParameter("cart_count")!=null && request.getParameter("cart_count").equals("cart_item"))
{
	String Email=" ";
	
	if(email!=null)
	{
		 Email = "CART_"+email;
	}
	else
	{
		Email = "CART_GUEST@gmail.com";
	}
	
	try
	{
		
	}catch(Exception ex)
	{
		
	}
	
	
	StringBuilder sb = new StringBuilder(Email);
	sb.replace(sb.length()-10, sb.length(), "");
	try
	{
	
	Connection conn1 = ConnectionProvider.getCon();

    Statement st3 = conn1.createStatement();
    st3.executeUpdate("CREATE TABLE IF NOT EXISTS "+sb+"(id int NOT NULL AUTO_INCREMENT,pid int(200),user_email varchar(200),product_name varchar(200),product_price varchar(300),product_image varchar(300),quantity int(11),total_price varchar(200),product_code varchar(200),created_at timestamp,PRIMARY KEY(id),FOREIGN KEY (pid) REFERENCES product(pid))");
	ResultSet rs  =st3.executeQuery("SELECT COUNT(id) FROM "+sb+"");
	rs.next();
	String count  = rs.getString(1);
	out.print(count);
	}catch(Exception ex)
	{
		out.print(ex);
		
	}

}

%>








<%


try
{
	if(request.getParameter("remove")!=null)
	{
	
		if(email!=null)
		{
			email =	"CART_"+session.getAttribute("Email").toString();
			
		}
		else
		{
			
			 email="CART_GUEST@gmail.com";
		}
		int id =Integer.parseInt(request.getParameter("remove"));
		StringBuilder sb4 = new StringBuilder(email);
		sb4.replace(sb4.length()-10, sb4.length(), " ");
		Connection conn = ConnectionProvider.getCon();
		Statement st1 = conn.createStatement();
		st1.executeUpdate("DELETE FROM "+sb4+" WHERE id='"+id+"'");
		session.setAttribute("alert", "block");
		session.setAttribute("CartMesg", "Item Remove From Cart!");
		out.print(" <script>window.location.href='cart.jsp'</script>");
		conn.close();
		
	}
	
}catch(Exception ex)
    {
	out.print(ex);
	
	}



%>


<%


try
{
	if(request.getParameter("clear")!=null)
	{
	
		if(email!=null)
		{
			email =	"CART_"+session.getAttribute("Email").toString();
			
		}
		else
		{
			
			 email="CART_GUEST@gmail.com";
		}
		
		StringBuilder sb5 = new StringBuilder(email);
		sb5.replace(sb5.length()-10, sb5.length(), " ");
		Connection conn = ConnectionProvider.getCon();
		Statement st1 = conn.createStatement();
		st1.executeUpdate("DELETE FROM "+sb5+"");
		session.setAttribute("alert", "block");
		session.setAttribute("CartMesg", " All Item's Remove From Cart!");
		out.print(" <script>window.location.href='cart.jsp'</script>");
		conn.close();
		
	}
	
}catch(Exception ex)
    {
	out.print(ex);
	
	}



%>

<%
if(request.getParameter("action")!=null && request.getParameter("action").equals("order"))
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
	try
	{
		Connection conn = ConnectionProvider.getCon();
		Statement st = conn.createStatement();
		st.executeUpdate("INSERT INTO user_cart_order(name,email,phone,address,paymentmode,productsQuantity,TotalAmount,deliverycharges,status) VALUES('"+name+"','"+email+"','"+phone+"','"+address+"','"+paymentmode+"','"+productquantity+"','"+totalamount+"','"+deliverycharge+"','"+status+"')");
		
		
		show += " <div class='text-center'><h1 class='display-4 mt-2 text-danger'>Thank You!</h1>  <h2 class='text-success'>Your Order Placed SuccessFully!</h2>   <h4 class='bg-danger text-light rounded p-2'>Item Purchased:  "+productquantity+"  </h4>    <h4>Name:  "+name+"  </h4> <h4>Email:  "+useremail+"  </h4>  <h4>Phone :  "+phone+"  </h4>  <h4>Total Amount Purchased:  ₹ "+totalamount+"  </h4>    <h4>Payment Mode:  "+paymentmode+"  </h4></div>" ;
       out.print(show);
       conn.close();
	}
	catch(Exception e)
	{
		out.print(e);
		
		
	}
}

%>

</body>
</html>