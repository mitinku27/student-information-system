<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="view_user.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#one {
	font-family: "Courier New", Courier, monospace;
	font-size: 18px;
	font-style: normal;
	font-weight: bold;
	color: #2A0000;
	text-decoration: none;
	background-color: #AAFFAA;
	text-align: justify;
	display: block;
	border-top-color: #000000;
	border-right-color: #000000;
	border-bottom-color: #000000;
	border-left-color: #000000;
}
</style>
<title>Insert title here</title>
</head>
<body bgcolor="#AAFFAA">
<%
PrintWriter outt=response.getWriter();
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			java.sql.Connection con= DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:orcl","system", "tinku");
			System.out.println("success");
			response.setContentType("text/html");
			Statement st=con.createStatement();
			PreparedStatement stmt=con.prepareStatement("select username,status from userinfo");
			System.out.println("ok");
			String arr []=new String[25];
			String ar []=new String[25];
			int i=0;
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
			
				arr[i]=rs.getString(1);
				ar[i]=rs.getString(2);
				i++;
			}
			
 %>
<a href="admin_home.html">  </a>
<center>
  <p><img src="logo.jpg" width="56" height="73" /></p>
  <h1>UNIVERSITY OF CHITTAGONG </h1>
  <h2 class="style1 style1">Student Information System</h2>
  <hr />
  <p>&nbsp;</p>
  <h2><strong>View Users </strong></h2>
  <p>&nbsp;</p>
  <form>
  <p>&nbsp;</p>
  <table width="575" height="450" cellpadding="5" ID="main">
    <tr>
      <td  bgcolor="#FFFBF0"><div align="left">
        <h3 class="style2">User Name </h3>
      </div></td>
      <td bgcolor="#D4BFAA"><div align="left">
        <h3 class="style2">Name Status </h3>
      </div></td>
    </tr>
    
    <%
    int j=0;
    for(j=0;j<i;j++)
    {
    outt.println("<tr><td height='39' bgcolor='#FFFBF0'><div align='left'>"+arr[j]+"</div></td><td bgcolor='#D4BFAA'><div align='left'>"+ar[j]+"</div></td></tr> ");
    }
     %>
  </table>
  <p>&nbsp;</p>
  </form>
  <form>
  <p>&nbsp;</p>
  
    <table>
    <tr>
    <td width="250" height="77">&nbsp; <p align="right">
	    <input ID="one" type="button" onClick="parent.location='admin_home.html'" value="Back" /> </p> </td>
    <td width="250">&nbsp;
		<p align="left">
		  <input ID="one" type="button" onClick="parent.location='update_user.html'" value="Update User" />	
		  </p>		</td>
  </tr>
  </table>
  
  </form>
</center>
<%
}
		catch(Exception e)
		{
			System.out.println("error");
			
		} %>
</body>
</html>