package login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class DeleteEntry
 */
@WebServlet("/DeleteEntry")
public class DeleteEntry extends HttpServlet {



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("bookno");
		String bn=request.getParameter("bookname");
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/anshu", "root", "1234");
		 st=conn.createStatement();
		int i=st.executeUpdate("DELETE FROM booksdb WHERE bNo='"+id+"' and bname='"+bn+"';");
		System.out.println("Data Deleted Successfully!\n\n\n\n\n\n\n\n\n");
		response.sendRedirect("Welcome.jsp");
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}

	}

}








