<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ecom.*,java.sql.Connection,java.sql.ResultSet,java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%
	String search1 = request.getParameter("searchp");
	if (search1 != null) {
		try {
			Connection conn1 = ConnectionProvider.getCon();
			Statement st1 = conn1.createStatement();
			ResultSet rs1 = st1.executeQuery("SELECT * FROM product WHERE pname LIKE '%" + search1 + "%' AND status=1 ");
			while (rs1.next()) {
		%>
		  <div class="col-md-3">
                              
                              
                                    <div class="product-item">
                                        <div class="product-title">
                                            <a href="#"><%= rs1.getString("pname") %></a>
                                            <div class="ratting">
                                            </div>
                                        </div>
                                        <div class="product-image">
                                            <a href="#">
                                                <img src="admin/productimg/product3/<%= rs1.getString("pimage3") %>" alt="Product Image" width="50" height="270">
                                            </a>
                                            <div class="product-action">
                                              <!--   <a href="#"><i class="fa fa-cart-plus"></i></a>
                                                <a href="#"><i class="fa fa-heart"></i></a> -->
                                                <a href="product-detail.jsp?pid=<%= rs1.getInt("pid") %>"><i class="fa fa-eye"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-price">
                                            <h3><span>$</span><%= rs1.getString("psellprice") %></h3>
                                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                        </div>
                                    </div>
                                   
                                </div>
                                
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