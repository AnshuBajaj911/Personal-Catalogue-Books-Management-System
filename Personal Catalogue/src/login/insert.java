

package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

/**
 * Servlet implementation class insert
 */
@WebServlet("/insert")
public class insert extends HttpServlet {
	public static int i =0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bname =request.getParameter("bookName");
		String aname=request.getParameter("authorName");
		String code=request.getParameter("code");
		String bN=request.getParameter("bNo");
		
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/anshu", "root", "1234");
		Statement st=conn.createStatement();


		st.executeUpdate("insert into booksdb values('"+bN+"','"+code+"','"+bname+"','"+aname+"')"); 
			st.close();
			conn.close();
			i=0;
	   response.sendRedirect("DataEntry.jsp");
	}
		
		
		catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			
			i=1;
		response.sendRedirect("DataEntry.jsp");
			out.println("Duplicate entry/Number Error"); 
		System.out.print("**********************ERROR***********************************"+e);
		e.printStackTrace();
		
		}
		
	}

}
