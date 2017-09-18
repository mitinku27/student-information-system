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
		String id=request.getParameter("id");
		String degree=request.getParameter("degree");
		System.out.println(dept+"  "+year+id+degree);
		//String pass2=request.getParameter("name3");
			
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			java.sql.Connection con= DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:orcl","system", "tinku");
			System.out.println("success in connection");
			response.setContentType("text/html");
			Statement st=con.createStatement();
			PreparedStatement stmt=con.prepareStatement("select id,department,year,degree from viewresult where id=? and department=? and degree=?");
			stmt.setString(1,id);
			stmt.setString(2,dept);
			//stmt.setString(3,year);
			stmt.setString(3,degree);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				outt.println("success");
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