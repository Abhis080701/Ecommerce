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
 * Servlet implementation class editproduct
 */
@MultipartConfig
@WebServlet(urlPatterns = "/admin/editproduct")
public class editproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public editproduct() {
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

		int editpid = Integer.parseInt(request.getParameter("editpid"));

		try {
			Connection conn = ConnectionProvider.getCon();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM product WHERE pid=" + editpid + "");
			rs.next();

			File f1 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product1/"
					+ rs.getString("pimage1"));
			f1.delete();

			File f2 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product2/"
					+ rs.getString("pimage2"));
			f2.delete();

			File f3 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product3/"
					+ rs.getString("pimage3"));
			f3.delete();

			File f4 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product4/"
					+ rs.getString("pimage4"));
			f4.delete();

			File f5 = new File("/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product5/"
					+ rs.getString("pimage5"));
			f5.delete();

			String editserialnum = request.getParameter("editpserialnum");
			String editpname = request.getParameter("editpname");
			int editsid = Integer.parseInt(request.getParameter("editsid"));

			Part pimage1 = request.getPart("editpimage1");
			String pimage1Name = pimage1.getSubmittedFileName();
			String pimage1Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product1/"
					+ pimage1Name;
			FileOutputStream fos1 = new FileOutputStream(pimage1Path);
			InputStream is1 = pimage1.getInputStream();
			byte[] data1 = new byte[is1.available()];
			is1.read(data1);
			fos1.write(data1);
			fos1.close();

			Part pimage2 = request.getPart("editpimage2");
			String pimage2Name = pimage2.getSubmittedFileName();
			String pimage2Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product2/"
					+ pimage2Name;
			FileOutputStream fos2 = new FileOutputStream(pimage2Path);
			InputStream is2 = pimage2.getInputStream();
			byte[] data2 = new byte[is2.available()];
			is2.read(data2);
			fos2.write(data2);
			fos2.close();

			Part pimage3 = request.getPart("editpimage3");
			String pimage3Name = pimage3.getSubmittedFileName();
			String pimage3Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product3/"
					+ pimage3Name;
			FileOutputStream fos3 = new FileOutputStream(pimage3Path);
			InputStream is3 = pimage3.getInputStream();
			byte[] data3 = new byte[is3.available()];
			is3.read(data3);
			fos3.write(data3);
			fos3.close();

			Part pimage4 = request.getPart("editpimage4");
			String pimage4Name = pimage4.getSubmittedFileName();
			String pimage4Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product4/"
					+ pimage4Name;
			FileOutputStream fos4 = new FileOutputStream(pimage4Path);
			InputStream is4 = pimage4.getInputStream();
			byte[] data4 = new byte[is4.available()];
			is4.read(data4);
			fos4.write(data4);
			fos4.close();

			Part pimage5 = request.getPart("editpimage5");
			String pimage5Name = pimage5.getSubmittedFileName();
			String pimage5Path = "/media/abhishek/DRIVE A/Ecommerce/src/main/webapp/admin/productimg/product5/"
					+ pimage5Name;
			FileOutputStream fos5 = new FileOutputStream(pimage5Path);
			InputStream is5 = pimage5.getInputStream();
			byte[] data5 = new byte[is5.available()];
			is5.read(data5);
			fos5.write(data5);
			fos5.close();
			
			String editpfeature = request.getParameter("editpfeature");
			String editprice = request.getParameter("editpprice");
			String editsellprice = request.getParameter("editpsellprice");
			String editpcolor = request.getParameter("editpcolor");
			String editpsize = request.getParameter("editpsize");
			int status = Integer.parseInt(request.getParameter("editstatus"));

			PreparedStatement stmp;
			stmp = conn.prepareStatement("UPDATE product SET sid=?,pserialnum=?,pname=?,pfeature=?,pimage1=?,pimage2=?,pimage3=?,pimage4=?,pimage5=?,pprice=?,psellprice=?,pcolor=?,psize=?,status=? WHERE pid='" + editpid + "'");
			stmp.setInt(1, editsid);
			stmp.setString(2, editserialnum);
			stmp.setString(3, editpname);
			stmp.setString(4, editpfeature);
			stmp.setString(5, pimage1Name);
			stmp.setString(6, pimage2Name);
			stmp.setString(7, pimage3Name);
			stmp.setString(8, pimage4Name);
			stmp.setString(9, pimage5Name);
			stmp.setString(10, editprice);
			stmp.setString(11, editsellprice);
			stmp.setString(12, editpcolor);
			stmp.setString(13, editpsize);
			stmp.setInt(14, status);
			stmp.executeUpdate();
           response.sendRedirect("Product.jsp");
			//out.print("EditProduct  pid  " + editpid + " serianum : " + editserialnum + " pname: " + editpname+ " sid: " + editsid + " pprice: " + editprice + "  sellprice: " + editsellprice + "  color:  "+ editpcolor + " size:  " + editpsize + "  status: " + status+ "Pimage2: "+ pimage2Path);
	
		} catch (Exception ex) {
			ex.printStackTrace();
			out.print(ex);
		}

	}

}
