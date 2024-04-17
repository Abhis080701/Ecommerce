package com.ecom;

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
 * Servlet implementation class addproduct
 */
@MultipartConfig
@WebServlet(urlPatterns = "/admin/addproduct")
public class addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addproduct() {
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

		String pserialnum = request.getParameter("pserialnum");
		String pname = request.getParameter("pname");
		int sid = Integer.parseInt(request.getParameter("sid"));
		// Image1
		Part pimage1 = request.getPart("pimage1");
		String pimage1Name = pimage1.getSubmittedFileName();
		String pimage1Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product1/"
				+ pimage1Name;

		// Image2
		Part pimage2 = request.getPart("pimage2");
		String pimage2Name = pimage2.getSubmittedFileName();
		String pimage2Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product2/"
				+ pimage2Name;

		// Image3
		Part pimage3 = request.getPart("pimage3");
		String pimage3Name = pimage3.getSubmittedFileName();
		String pimage3Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product3/"
				+ pimage3Name;

		// Image4
		Part pimage4 = request.getPart("pimage4");
		String pimage4Name = pimage4.getSubmittedFileName();
		String pimage4Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product4/"
				+ pimage4Name;

		// Image5
		Part pimage5 = request.getPart("pimage5");
		String pimage5Name = pimage5.getSubmittedFileName();
		String pimage5Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product5/"
				+ pimage5Name;
       String pfeature = request.getParameter("pfeature");
		String pprice = request.getParameter("pprice");
		String psellprice = request.getParameter("psellprice");
		String pcolor = request.getParameter("pcolor");
		String psize = request.getParameter("psize");
		int status = Integer.parseInt(request.getParameter("status"));

		// uploading All five Images to folder

		try {
			// Uploading Image1
			FileOutputStream fos1 = new FileOutputStream(pimage1Path);
			InputStream file1 = pimage1.getInputStream();
			byte[] data1 = new byte[file1.available()];
			file1.read(data1);
			fos1.write(data1);
			fos1.close();

			// Uploading Image2
			FileOutputStream fos2 = new FileOutputStream(pimage2Path);
			InputStream file2 = pimage2.getInputStream();
			byte[] data2 = new byte[file2.available()];
			file2.read(data2);
			fos2.write(data2);
			fos2.close();

			// Uploading Image3
			FileOutputStream fos3 = new FileOutputStream(pimage3Path);
			InputStream file3 = pimage3.getInputStream();
			byte[] data3 = new byte[file3.available()];
			file3.read(data3);
			fos3.write(data3);
			fos3.close();

			// Uploading Image4
			FileOutputStream fos4 = new FileOutputStream(pimage4Path);
			InputStream file4 = pimage4.getInputStream();
			byte[] data4 = new byte[file4.available()];
			file4.read(data4);
			fos4.write(data4);
			fos4.close();

			// Uploading Image5
			FileOutputStream fos5 = new FileOutputStream(pimage5Path);
			InputStream file5 = pimage5.getInputStream();
			byte[] data5 = new byte[file5.available()];
			file5.read(data5);
			fos5.write(data5);
			fos5.close();

			
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
			out.print(ex.getMessage());
		}
		
	try
	{
		Connection conn = ConnectionProvider.getCon();
		PreparedStatement stmp;
		
		stmp = conn.prepareStatement("INSERT INTO product(sid,pserialnum,pname,pfeature,pimage1,pimage2,pimage3,pimage4,pimage5,pprice,psellprice,pcolor,psize,status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	stmp.setInt(1, sid);
	stmp.setString(2,pserialnum);
	stmp.setString(3,pname);
	stmp.setString(4,pfeature);
	stmp.setString(5,pimage1Name);
	stmp.setString(6,pimage2Name);
	stmp.setString(7,pimage3Name);
	stmp.setString(8,pimage4Name);
	stmp.setString(9,pimage5Name);
	stmp.setString(10,pprice);
	stmp.setString(11,psellprice);
	stmp.setString(12,pcolor);
	stmp.setString(13,psize);
	stmp.setInt(14,status);
	stmp.executeUpdate();
	response.sendRedirect("addproduct.jsp");
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.print(e);
	}
	finally
	{
		try {
			ConnectionProvider.getCon().close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
		
		//out.print("Product..1 serialNum: " + pserialnum + "   Name: " + pname + "  sid: " + sid + " Pimage1Path: "		+ pimage1Path + "   " + pimage1Path + " Pimage2Path: " + pimage2Path + " Pimage3Path: " + pimage3Path	+ "  Pimage4Path: " + pimage4Path + "  Pimage5Path: " + pimage5Path + " price: " + pprice+ "  psellprice " + psellprice + "  color: " + pcolor + " status:  " + status+" feature: "+pfeature);
	}

}
