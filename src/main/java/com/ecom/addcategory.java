package com.ecom;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;




/**
 * Servlet implementation class addcategory
 */
@MultipartConfig
@WebServlet(urlPatterns = "/admin/addcategory")

public class addcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addcategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		PrintWriter out = response.getWriter();

		String cname = request.getParameter("Cname");
		Part cimage = request.getPart("cimage");

		String cimageName = cimage.getSubmittedFileName();
		String cimagePath = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/categoryimg/" + cimageName;
	
	
		try {
			FileOutputStream fos = new FileOutputStream(cimagePath);
			InputStream file = cimage.getInputStream();
			byte[] data = new byte[file.available()];
			file.read(data);
			fos.write(data);
			fos.close();
		} catch (Exception ex) {
ex.printStackTrace();
		}
		
		try {
			
			 Connection conn = ConnectionProvider.getCon() ;
			PreparedStatement stmp;
			stmp = conn.prepareStatement("INSERT INTO category(cname,cimage) VALUES(?,?)");
			stmp.setString(1,cname);
			stmp.setString(2, cimageName);
			stmp.executeUpdate();
			HttpSession session  = request.getSession();
			session.setAttribute("alertaddcategory", "block");
			session.setAttribute("Category", "Category Add SuccesFully!");
             response.sendRedirect("addcategory.jsp?mesg=hello");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ConnectionProvider.getCon().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		

	}
		//out.println("name: " + cname + " Image: " + cimageName + " Path: " + cimagePath);
	}

	private boolean Empty(String cname) {
		// TODO Auto-generated method stub
		return false;
	}
}
