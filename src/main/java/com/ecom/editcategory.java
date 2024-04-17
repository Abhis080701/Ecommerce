package com.ecom;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class editcategory
 */
@MultipartConfig
@WebServlet(urlPatterns="/admin/editcategory")
public class editcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editcategory() {
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
		//doGet(request, response);
	PrintWriter out =  response.getWriter();
	int Editcid = Integer.parseInt(request.getParameter("editcid"));
	try
	{
		Connection conn = ConnectionProvider.getCon();
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM category WHERE cid='" + Editcid + "'");
		rs.next();
		// out.println(" Image: "+rs.getString("cimage"));
		File f = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/categoryimg/"+ rs.getString("cimage") + "");
		f.delete();
		//out.print("Deleted");
		
		/**
		 * uploading UPDATING Image... And Data.
		 *
		 */
		String cname = request.getParameter("editcname"); 
		Part cimage  = request.getPart("editcimage");
		String cimageName = cimage.getSubmittedFileName(); 
		String cimagePath = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/categoryimg/"+cimageName;
		FileOutputStream fos = new FileOutputStream(cimagePath);
		InputStream is=cimage.getInputStream();
		byte[] data = new  byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		PreparedStatement stmp;
		stmp = conn.prepareStatement("UPDATE category SET cname=?,cimage=? WHERE cid='"+Editcid+"'");
		stmp.setString(1, cname);
		stmp.setString(2, cimageName);
     	int i =	stmp.executeUpdate();
		if(i>0)
		{
			//out.print("Updated SuccessFully!");
			response.sendRedirect("Category.jsp");			}
		
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	out.print("Edit Category: "+Editcid);
	
	}

}
