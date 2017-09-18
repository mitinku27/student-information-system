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
		String dept=request.getParameter("department");
		String year=request.getParameter("year");
		System.out.println(dept+"  "+year);
		//String pass2=request.getParameter("name3");
			
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			java.sql.Connection con= DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:orcl","system", "tinku");
			System.out.println("success in connection");
			response.setContentType("text/html");
			Statement st=con.createStatement();
		//	String sql="select department,year from courseview where department='"+dept+"'";
			PreparedStatement stmt=con.prepareStatement("select department,year from courseview where department=? and year=? ");
			stmt.setString(1,dept);
			stmt.setString(2,year);
			ResultSet rs=stmt.executeQuery();
			
			if(rs.next())
			{
				outt.println("success"+rs.getString("year")+rs.getString("department"));
			}
			else
			{
				outt.println("error");
			}

}		
		catch(Exception e)
		{
			System.out.println(e);
			
		}
 %>
</body>
</html>