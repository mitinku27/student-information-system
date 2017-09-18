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
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		String status=request.getParameter("status");
		String dept=request.getParameter("dept");
		String pass=request.getParameter("pass");
		String pass1=request.getParameter("pass1");
		System.out.println(pass+dept+name+status+id+email);	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			java.sql.Connection con= DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:orcl","system", "tinku");
			System.out.println("success");
			response.setContentType("text/html");
			Statement st=con.createStatement();
			PreparedStatement stmt=con.prepareStatement("insert into userinfo(username,password,status,userid,email,department)"+" values(?,?,?,?,?,?)");
			System.out.println("ok");
			if(pass.equals(pass1))
			{
			stmt.setString(1,name);
			stmt.setString(2,pass);
			stmt.setString(3,status);
			stmt.setString(4,id);
			stmt.setString(5,email);
			stmt.setString(6,dept);
			stmt.executeQuery();
			outt.println("successfully added");
			}
			else{
				outt.println("password error");
			}
			}
		catch(Exception e)
		{
			System.out.println("error");
			
		}
 %>
</body>
</html>