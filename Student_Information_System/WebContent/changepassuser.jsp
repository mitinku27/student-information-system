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
		String pass1=request.getParameter("name2");
		String pass2=request.getParameter("name3");
			
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			java.sql.Connection con= DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:orcl","system", "tinku");
			System.out.println("success");
			response.setContentType("text/html");
			Statement st=con.createStatement();
			PreparedStatement stmt=con.prepareStatement("select password from userinfo where password=?");
			stmt.setString(1,pass);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
			if(pass1.equals(pass2))
			{
				 stmt=con.prepareStatement("update userinfo set password=? where password=?");
				stmt.setString(1, pass1);
				stmt.setString(2, pass);
				stmt.executeQuery();
				
				%><jsp:forward page = "chng_pass_us.html" /><%
				%><script type="text/javascript">alert("successfully changed the password");</script> <%
			}
			else
			{
				%><jsp:forward page = "chng_pass_us.html" /><%
				%><script type="text/javascript">alert("error occured");</script> <%
			}
  	}
  	else
			{
				%><jsp:forward page = "chng_pass_us.html" /><%
				%><script type="text/javascript">alert("error occured"); </script> <%
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}
 %>
</body>
</html>