package mcvStudent;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {

	public static List<StudentModel> getStudents() {
		
		List<StudentModel> students = new ArrayList<>();
		students.add(new StudentModel("William", "Vieira", "a@a.com"));
		students.add(new StudentModel("Adri", "Brunner", "b@b.com"));
		students.add(new StudentModel("Zana", "Carneiro", "c@c.com"));
		
		return students;
	}
}
