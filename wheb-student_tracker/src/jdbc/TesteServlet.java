package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TesteServlet
 */
@WebServlet("/TesteServlet")
public class TesteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		response.setContentType("text/plain");

		Connection myConn = null;
		Statement myStm = null;
		ResultSet resultSet = null;

		try {
			myConn = dataSource.getConnection();
			String sql = "select * from student";

			myStm = myConn.prepareStatement(sql);

			resultSet = myStm.executeQuery(sql);

	
			
			while (resultSet.next()) {
				String email = resultSet.getString("email");
				out.println(email);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}

	}

}
