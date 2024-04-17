package com.ecom;
import java.sql.*;

public class ConnectionProvider {
public static Connection getCon()
{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecom","root","");
		//System.out.print("Connected SuccessFully!");
		return conn;
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
		
		return null;
	}
	
	}
}
