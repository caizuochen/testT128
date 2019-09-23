package cn.appsys.service.StudentCURD;

import java.util.List;

import cn.appsys.pojo.ClassInfo;
import cn.appsys.pojo.Student;

public interface StudentCURDService {
	public Integer ClassCount(Integer classId);

	public List<Student> queryStudent(String studentName,
			Integer studentGender, Integer studentClassId);

	public Student queryStudentById(Integer studentId);

	public Integer deleteStudent(Integer studentId);

	public Integer updateStudent(Student student);

	public Integer addStudent(Student student);

	public List<ClassInfo> queryClassInfo();
}
