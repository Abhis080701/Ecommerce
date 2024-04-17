
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.ecom.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	String name = request.getParameter("uname");
	String email = request.getParameter("uemail");
	String pass = request.getParameter("upass");
	int status = 0;
	try {
		Connection conn = ConnectionProvider.getCon();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM user WHERE uemail='" + email + "'");
		rs.next();
		String EmailCount = rs.getString(1);
		out.println(EmailCount);
		if (EmailCount.equals("0")) {
			PreparedStatement stmp;
			stmp = conn.prepareStatement("INSERT INTO user(uname,uemail,upassword,status) VALUES(?,?,?,?)");
			stmp.setString(1, name);
			stmp.setString(2, email);
			stmp.setString(3, pass);
			stmp.setInt(4, status);
			stmp.executeUpdate();
			
			ResultSet rs1 = st.executeQuery("SELECT * FROM user WHERE uemail='"+email+"'");
			rs1.next();
			//ReciePient's Email id
			final String to = email;
			// Subject
			final String Subject = "Account Activation!";
			// purpose
			final String message = "Click Here To<a href='http://localhost:8080/Ecommerce/activeuserstatus.jsp?uid="+rs1.getInt("uid")+"'>Active Account</a>";
			//Sender Email Id and Pass.
			final String from = "abhis080701@gmail.com";
			final String password = "abhis@1774";

			//Creating the Properties Objects
			Properties props = new Properties();

			//Defining the host Gmail
			String host = "smtp.gmail.com";

			//Defining the Properties

			props.put("mail.smtp.host", host);
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.user", from);
			props.put("mail.password", password);
			props.put("mail.port", "465");
			
			
			
			Session S = Session.getInstance(props,new Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication()
				{
					return new PasswordAuthentication(from,password);
				}
				
			});
			S.setDebug(true);
			
			MimeMessage m = new MimeMessage(S);
			m.setFrom(new InternetAddress(from));
			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			m.setSubject(Subject);
			m.setContent(message,"text/html");
			
			Transport.send(m);
			
			System.out.println("Email SuccesFully Send to:  "+to);
			
			response.sendRedirect("Register.jsp?mesg=VerifyE");
			
		} else {
			response.sendRedirect("Register.jsp?mesg=EmailAlE");
		}

		
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.print(e);
		
	}


	
	%>
</body>
</html>