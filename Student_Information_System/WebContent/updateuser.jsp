<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
PrintWriter outt=response.getWriter();
		String pass=request.getParameter("name");
		String pass1=request.getParameter("name1");
		System.out.println(pass+pass1);	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			java.sql.Connection con= DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:orcl","system", "tinku");
			System.out.println("success");
			response.setContentType("text/html");
			Statement st=con.createStatement();
			PreparedStatement stmt=con.prepareStatement("insert into userinfo(username,status)"+" values(?,?)");
			stmt.setString(1,pass);
			stmt.setString(2, pass1);
			stmt.executeQuery();
			//outt.println("success");
			}
		catch(Exception e)
		{
			System.out.println("error");
			
		}
 %>
</body>
</html>