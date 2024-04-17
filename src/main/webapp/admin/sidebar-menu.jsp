<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ecom.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp"%>
<%
String email = session.getAttribute("email").toString();
%>

<%
Connection connection=null;

Statement st= null;
ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rs9 = null;
int usercartcount = 0;
int Pcartcount = 0 ;
int Ccartcount = 0;
int categoryCount=0;
int subcategoryCount =0;
int productCount = 0;
int productordercount=0;
int Pproductcount = 0;
int Cproductcount=0;
int UserCount = 0;
try
{
	connection = ConnectionProvider.getCon();
	st = connection.createStatement();
	rs = st.executeQuery("SELECT COUNT(*) FROM user_cart_order");
	rs.next();
	usercartcount = rs.getInt(1) ;
	rs1 = st.executeQuery("SELECT COUNT(orderid) FROM user_cart_order WHERE status='Order Pending'");
     rs1.next();
     Pcartcount+=rs1.getInt(1);
     rs2 = st.executeQuery("SELECT COUNT(orderid) FROM user_cart_order WHERE status='Order Completed'");
      rs2.next();
      Ccartcount +=rs2.getInt(1);
      rs3 = st.executeQuery("SELECT COUNT(cid) FROM category");
    rs3.next();
    categoryCount += rs3.getInt(1);
    rs4 = st.executeQuery("SELECT COUNT(sid) FROM subcategory");
    rs4.next();
    subcategoryCount += rs4.getInt(1);
    rs5 = st.executeQuery("SELECT COUNT(pid) FROM product");
    rs5.next();
    productCount += rs5.getInt(1);
    
    rs6 = st.executeQuery("SELECT COUNT(*) FROM user_order");
    rs6.next();
    productordercount += rs6.getInt(1);
    
    rs7 = st.executeQuery("SELECT COUNT(*) FROM user_order WHERE status='Order Pending'");
    rs7.next();
    Pproductcount += rs7.getInt(1);
    rs8 = st.executeQuery("SELECT COUNT(*) FROM user_order WHERE status='Order Completed'");
    rs8.next();
    Cproductcount += rs8.getInt(1);
    
    rs9 = st.executeQuery("SELECT COUNT(*) FROM user");
    rs9.next();
    UserCount += rs9.getInt(1);
    connection.close();
      
}catch(Exception ex)
{
	 connection.close();
		out.print(ex);
		}

%>
   <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./index1.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard </p>
                </a>
              </li>
              <!-- 
              <li class="nav-item">
                <a href="./index3.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Order's</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Cart Order</p>
                </a>
              </li>
               -->
            </ul>
          </li>
         
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Managed Category
                <i class="fas fa-angle-left right"></i>
               <!--  --> <span class="badge badge-info right">3</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="Category.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Category<span class="badge badge-success right"><%= categoryCount %></span></p>
                </a>
              </li>
              <li class="nav-item">
                <a href="Subcategory.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Subcategory<span class="badge badge-success right"><%= subcategoryCount %></span></p>
                </a>
              </li>
              <li class="nav-item">
                <a href="Product.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products<span class="badge badge-success right"><%= productCount %></span></p>
                </a>
              </li>
              
    
            </ul>
          </li>
          
          
          <!-- Cart Order's -->
           <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
               Cart Order's
                <i class="fas fa-angle-left right"></i>
               <!--  --> <span class="badge badge-info right"><%= usercartcount %></span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pendingorders.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pending Order's<span class="badge badge-danger right"><%= Pcartcount %></span></p>
                </a>
              </li>
              <li class="nav-item">
                <a href="completedorders.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Completed Order's<span class="badge badge-success right"><%= Ccartcount %></span></p>
                </a>
              </li>
             
            <!--  <li class="nav-item">
                <a href="Product.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products</p>
                </a>
              </li>
               --> 
    
            </ul>
          </li>
          
             <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
               Product Order's
                <i class="fas fa-angle-left right"></i>
               <!--  --> <span class="badge badge-info right"><%= productordercount %></span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pendingproductorder.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pending Order's<span class="badge badge-danger right"><%= Pproductcount %></span></p>
                </a>
              </li>
              <li class="nav-item">
                <a href="completeproductorder.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Completed Order's<span class="badge badge-success right"><%= Cproductcount %></span></p>
                </a>
              </li>
             
            <!--  <li class="nav-item">
                <a href="Product.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products</p>
                </a>
              </li>
               --> 
    
            </ul>
          </li>
          
           <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
              Customer
                <i class="fas fa-angle-left right"></i>
               <span class="badge badge-success right"><%= UserCount %></span>
              </p>
            </a>
            <ul class="nav nav-treeview">
         
         
              <li class="nav-item">
                <a href="viewuser.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>View Customer's</p>
                </a>
              </li>
           
             
            <!--  <li class="nav-item">
                <a href="Product.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products</p>
                </a>
              </li>
               --> 
    
            </ul>
          </li>
         
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Forms
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>General Elements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="forms/advanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Advanced Elements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/editors.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Editors</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/forms/validation.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Validation</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Tables
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Simple Tables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/tables/data.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>DataTables</p>
                </a>
              </li>
             
            </ul>
          </li>
          <li class="nav-header">EXAMPLES</li>
         
        
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                Mailbox
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <!-- 
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inbox</p>
                </a>
              </li>
               -->
            </ul>
          </li>
       
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Extras
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
               
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="pages/examples/login.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Login v1</p>
                    </a>
                  </li>
                  
              
                  <li class="nav-item">
                    <a href="pages/examples/recover-password.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Recover Password v1</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
               
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="pages/examples/login-v2.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Login v2</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="pages/examples/register-v2.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Register v2</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="pages/examples/forgot-password-v2.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Forgot Password v2</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="pages/examples/recover-password-v2.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Recover Password v2</p>
                    </a>
                  </li>
                </ul>
              </li>
             
              
              <li class="nav-item">
                <a href="pages/examples/404.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 404</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/500.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 500</p>
                </a>
              </li> 
            </ul>
          </li>
        
          <li class="nav-header">MISCELLANEOUS</li>
          
        
        </ul>
      </nav>  