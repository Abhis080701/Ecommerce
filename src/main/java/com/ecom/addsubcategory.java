package com.ecom;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class addsubcategory
 */
@MultipartConfig
@WebServlet(urlPatterns = "/admin/addsubcategory")
public class addsubcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addsubcategory() {
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
		String sname = request.getParameter("sname");
		Part simage = request.getPart("simage");
		int cid = Integer.parseInt(request.getParameter("cid"));
		String simageName = simage.getSubmittedFileName();

		String simagePath = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/subcategoryimg/" + simageName;
		try {
			FileOutputStream fos = new FileOutputStream(simagePath);
			InputStream file = simage.getInputStream();
			byte[] data = new byte[file.available()];
			file.read(data);
			fos.write(data);
			fos.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		try {

			Connection conn = ConnectionProvider.getCon();
			PreparedStatement stmp;
			stmp = conn.prepareStatement("INSERT INTO subcategory(cid,sname,simage) VALUES(?,?,?)");
			stmp.setInt(1, cid);
			stmp.setString(2, sname);
			stmp.setString(3, simageName);
			stmp.executeUpdate();

			response.sendRedirect("addsubcategory.jsp");
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

			//out.println("SubCategory ...  Name: " + sname + "  SimageName" + simageName + "  cid: " + cid);
		}

	}
}
