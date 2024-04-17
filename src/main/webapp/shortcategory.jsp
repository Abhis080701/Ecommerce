<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ecom.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

                               <%
                            
                               int cid = Integer.parseInt(request.getParameter("cid"));
                               
                               
                               Connection conn=null;
                               Statement st1,st2,st3,st=null; 
                               ResultSet rs3,rs2,rs1,rs=null;
                               
                               try
                               {
                              conn  = ConnectionProvider.getCon();
                               st1 = conn.createStatement();
                               rs1 = st1.executeQuery("SELECT * FROM category WHERE cid='"+cid+"'");
                              while(rs1.next())
                              {
                              
                            	   st2 = conn.createStatement();
                            	   rs2 = st2.executeQuery("SELECT * FROM subcategory WHERE cid='"+rs1.getInt("cid")+"'");
                            	  while(rs2.next())
                            	  {
                                st = conn.createStatement(); 
                                rs = st.executeQuery("SELECT COUNT(pid) FROM product  WHERE sid='"+rs2.getInt("sid")+"'  ");
                              rs.next();
                            	   if(rs.getInt(1)==0){
                            		   out.print("<div class='col-md-3'><span style='color:red;'>No Such Category Product is Found </span></div>");
                            		   }else
                            			   {
                            			   
                            			   st3 = conn.createStatement();
                            			   rs3 = st3.executeQuery("SELECT * FROM product WHERE sid='"+rs2.getInt("sid")+"'");
                            			   while(rs3.next())
                            			   {
                            			   %>
                               
                                <div class="col-md-3">
                              
                              
                                    <div class="product-item">
                                        <div class="product-title">
                                            <a href="#"><%= rs3.getString("pname") %></a>
                                            <div class="ratting">
                                            </div>
                                        </div>
                                        <div class="product-image">
                                            <a href="#">
                                                <img src="admin/productimg/product3/<%= rs3.getString("pimage3") %>" alt="Product Image" width="50" height="270">
                                            </a>
                                            <div class="product-action">
                                              <!--   <a href="#"><i class="fa fa-cart-plus"></i></a>
                                                <a href="#"><i class="fa fa-heart"></i></a> -->
                                                <a href="product-detail.jsp?pid=<%= rs3.getInt("pid") %>"><i class="fa fa-eye"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-price">
                                            <h3><span>$</span><%= rs3.getString("psellprice") %></h3>
                                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                        </div>
                                    </div>
                                   
                                </div>
                                
                            <%
                            			   }   
                            			   }
                            	   
                               }
                               }
                               conn.close();
                               }
                               catch(Exception ex)
                               {
                            	   out.print(ex);
                            	   ex.printStackTrace();
                            	  
                            	   
                               }
                               finally{
                            	   
                            	   conn.close();
                               }
                               
                            %>
