package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.lang.model.element.Element;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.sql.DataSource;

import com.mysql.cj.protocol.Resultset;

public class StudentDBUtil {

	private DataSource dataSource;
	private final String SELECT_ALL = "select * from student";
	private final String INSERT_STUDENT = "insert into student (first_name,last_name,email) values (?,?,?)";
	private final String SELECT_ID = "select * from student where id = ?";
	private final String UPDATE_STUDENT = "update student a set a.first_name=?, a.last_name=?, a.email=? where a.id=?";
	private final String DELETE_STUDENT = "delete from student where id=?";
	
	public StudentDBUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Student> getStudents() throws Exception {
		PreparedStatement st = null;
		ResultSet resultSet = null;
		Connection conn = null;

		try {

			conn = dataSource.getConnection();
			st = conn.prepareStatement(SELECT_ALL);
			resultSet = st.executeQuery();

			List<Student> listStudents = new ArrayList<>();

			while (resultSet.next()) {
				listStudents.add(new Student(resultSet.getInt("id"), resultSet.getString("first_name"),
						resultSet.getString("last_name"), resultSet.getString("email")));
			}

			return listStudents;

		} finally {
			this.closeConnection(conn, st, resultSet);
		}
	}

	public void addStudentBB(String firstName, String lastName, String email) throws Exception {
		Connection conn = null;
		PreparedStatement st = null;

		try {
			conn = dataSource.getConnection();
			st = conn.prepareStatement(INSERT_STUDENT);

			Student tempStudent = new Student(firstName, lastName, email);

			st.setString(1, tempStudent.getFirstName());
			st.setString(2, tempStudent.getLastName());
			st.setString(3, tempStudent.getEmail());

			st.execute();

		} finally {
			closeConnection(conn, st, null);
		}
	}

	public Student loadStudent(Integer id) throws Exception {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		Student studentById = null;
		try {
			conn = dataSource.getConnection();
			st = conn.prepareStatement(SELECT_ID);
			st.setInt(1, id);

			rs = st.executeQuery();

			if (rs.next()) {
				studentById = new Student(id, rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("email"));
			} else {
				throw new Exception("Student couldn't be found. Id: " + id);
			}

			return studentById;
		} finally {
			this.closeConnection(conn, st, rs);
		}
	}

	public void updateStudent(Student student) throws Exception {
		PreparedStatement st = null;
		ResultSet resultSet = null;
		Connection conn = null;

		try {

			conn = dataSource.getConnection();

			st = conn.prepareStatement(UPDATE_STUDENT);
			st.setString(1, student.getFirstName());
			st.setString(2, student.getLastName());
			st.setString(3, student.getEmail());
			st.setInt(4, student.getId());

			if (st.executeUpdate() == 0) {
				throw new Exception("None student updated ID=" + student.getId());
			}

		} finally {
			closeConnection(conn, st, resultSet);
		}
	}

	public void deleteStudent(int id) throws Exception {
		PreparedStatement st = null;
		ResultSet resultSet = null;
		Connection conn = null;

		try {

			conn = dataSource.getConnection();

			st = conn.prepareStatement(DELETE_STUDENT);
			st.setInt(1, id);

			st.execute();

		} finally {
			closeConnection(conn, st, resultSet);
		}
	}

	private void closeConnection(Connection conn, Statement st, ResultSet resultSet) {
		try {
			if (conn != null) {
				conn.close();
			}
			if (st != null) {
				st.close();
			}
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
