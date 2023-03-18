package jdbc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private StudentDBUtil studentDBUtil;
	private List<Student> students;

	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();

		try {
			this.studentDBUtil = new StudentDBUtil(dataSource);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String commander = request.getParameter("command");

			if (commander == null) {
				commander = "LIST";
			}
			switch (commander) {
			case "ADD":
				addStudent(request, response);
				break;

			case "LOAD":
				loadStudent(request, response);
				break;

			case "UPDATE":
				updateStudent(request, response);
				break;

			case "DELETE":
				deleteStudent(request, response);
				break;

			case "SEARCH":
				searchStudent(request, response);
				break;

			default:
				listStudents(request, response);
			}
		} catch (Exception e) {
			System.err.print(e.getMessage());
			throw new ServletException(e);
		}

	}

	private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Student> studentsSearched = new ArrayList<>();

		if (!request.getParameter("searchName").trim().isEmpty()) {
			students.forEach(student -> {
				if (student.getFirstName().toLowerCase().contains(request.getParameter("searchName").toLowerCase())) {
					studentsSearched.add(student);
				}
			});

			request.setAttribute("students_database", studentsSearched);
		} else {
			request.setAttribute("students_database", students);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("list-students.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {

		studentDBUtil.deleteStudent(Integer.parseInt(request.getParameter("studentId")));
		response.sendRedirect("StudentControllerServlet?command=List");
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("studentId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");

		studentDBUtil.updateStudent(new Student(id, firstName, lastName, email));

		// show the list updated
		response.sendRedirect("StudentControllerServlet?command=List");
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		students = this.studentDBUtil.getStudents();
		request.setAttribute("students_database", this.studentDBUtil.getStudents());

		RequestDispatcher dispatcher = request.getRequestDispatcher("list-students.jsp");
		dispatcher.forward(request, response);
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		studentDBUtil.addStudentBB(request.getParameter("firstName"), request.getParameter("lastName"),
				request.getParameter("email"));

		// show the list updated
		response.sendRedirect("StudentControllerServlet?command=List");
	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer id = Integer.valueOf(request.getParameter("studentId"));

		Student temp = studentDBUtil.loadStudent(id);

		request.setAttribute("studentToUpdate", temp);

		RequestDispatcher dispacher = request.getRequestDispatcher("/update-student-form.jsp");
		dispacher.forward(request, response);
	}
}
