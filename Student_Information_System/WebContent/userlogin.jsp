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
		String pass=request.getParameter("name1");	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			java.sql.Connection con= DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:orcl","system", "tinku");
			System.out.println("success");
			response.setContentType("text/html");
			Statement st=con.createStatement();
			String s="select * from USERINFO";
			//st.execute(s);
			//ResultSet rs= st.executeQuery(s);
			PreparedStatement stmt= con.prepareStatement("select username,password from userinfo where username=? and password=?");
			stmt.setString(1, name);
			stmt.setString(2, pass);
			
			ResultSet rs= stmt.executeQuery();
			
			if(rs.next())
			{
				%><jsp:forward page = "user_home.html" /><%
				//outt.println("valid");
				//RequestDispatcher rd = request.getRequestDispatcher("index.html");
			}
			else
			{
				%><jsp:forward page = "user_login.html" /><%
			}
		}
		catch(Exception e)
		{
			System.out.println("error");
			
		}
 %>
</body>
</html>