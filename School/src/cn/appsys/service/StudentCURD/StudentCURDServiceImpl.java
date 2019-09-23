package cn.appsys.service.StudentCURD;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.appsys.mapper.StudentCURDMapper;
import cn.appsys.pojo.ClassInfo;
import cn.appsys.pojo.Student;

@Service("studentCURD")
public class StudentCURDServiceImpl implements StudentCURDService {

	@Resource
	private StudentCURDMapper studentCURDMapper;

	@Override
	public List<Student> queryStudent(String studentName,
			Integer studentGender, Integer studentClassId) {
		return studentCURDMapper.queryStudent(studentName, studentGender,
				studentClassId);
	}

	@Override
	public Student queryStudentById(Integer studentId) {
		return studentCURDMapper.queryStudentById(studentId);
	}

	@Override
	public Integer deleteStudent(Integer studentId) {
		return studentCURDMapper.deleteStudent(studentId);
	}

	@Override
	public Integer updateStudent(Student student) {
		return studentCURDMapper.updateStudent(student);
	}

	@Override
	public Integer addStudent(Student student) {
		return studentCURDMapper.addStudent(student);
	}

	@Override
	public List<ClassInfo> queryClassInfo() {
		return studentCURDMapper.queryClassInfo();
	}

	@Override
	public Integer ClassCount(Integer classId) {
		return studentCURDMapper.ClassCount(classId);
	}

}
