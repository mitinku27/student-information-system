package student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class user_login
 */
public class user_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
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
				out.println("valid");
			}
			else
			{
				System.out.println("invalid login");
			}
		}
		catch(Exception e)
		{
			System.out.println("error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
