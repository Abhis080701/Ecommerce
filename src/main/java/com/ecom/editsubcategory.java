package com.ecom;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class editsubcategory
 */
@MultipartConfig
@WebServlet(urlPatterns="/admin/editsubcategory")
public class editsubcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editsubcategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
	PrintWriter out =response.getWriter();
	int editsid = Integer.parseInt(request.getParameter("editsid"));
	String editsname =request.getParameter("editsname");
	Part editsimage = request.getPart("editsimage");
	String editsimageName = editsimage.getSubmittedFileName();
	int editcid = Integer.parseInt(request.getParameter("editcid"));
	
	
	 try {
			
			Connection conn = ConnectionProvider.getCon();
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM subcategory WHERE sid='"+editsid+"'");
			rs.next();
			File F = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/subcategoryimg/"+rs.getString("simage"));
		     F.delete();
		 } catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
	
String	 editsimagePath = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/subcategoryimg/"+editsimageName;
	 
	 try {
		  FileOutputStream fos = new FileOutputStream(editsimagePath);
		  InputStream is = editsimage.getInputStream();
		  byte[] data = new byte[is.available()];	
	  	  is.read(data);
	  	  fos.write(data);
	  	  fos.close();
	} catch (Exception e) {
		// TODO: handle exception
		out.print(e.getMessage());
		e.printStackTrace();
	}

	  
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = ConnectionProvider.getCon();
		PreparedStatement stmp1;
		stmp1 = conn.prepareStatement("UPDATE subcategory SET cid=?,sname=?,simage=? WHERE sid='"+editsid+"'");
		stmp1.setInt(1, editcid);
		stmp1.setString(2, editsname);
		stmp1.setString(3, editsimageName);
		stmp1.executeUpdate();
		conn.close();
		response.sendRedirect("Subcategory.jsp");		//out.println("Success!");
	} catch (Exception e) {
		// TODO: handle exception
		//out.print(e.getMessage());
		e.printStackTrace();
	}
	finally
	{
		
	}
	
	
	
	out.print("SubCategory ..1  Name"+editsname+"  sid: "+editsid+" editcid: "+editcid+" editsimageName: "+editsimageName);
	}

}
