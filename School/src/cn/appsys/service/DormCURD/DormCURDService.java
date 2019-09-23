package cn.appsys.service.DormCURD;

import java.util.List;

import cn.appsys.pojo.Dorm;
import cn.appsys.pojo.Student;

public interface DormCURDService {
	public List<Dorm> queryDorm(String dormName);

	public Integer deleteDorm(Integer dormId);

	public Integer addDorm(Dorm dorm);

	public Integer queryDormByName(String dormName);

	public Integer updateDorm(Dorm dorm);

	public Dorm queryDormById(Integer dormId);

	public List<Student> queryStudentDormIdIsNull();

	public Integer updateDormDown(Integer dormId);

	public Integer updateDormUp(Integer dormId);

	public List<Student> queryStudentByDormId(Integer dormId);

	public Integer updateStudentDormId(Integer dormId, Integer studentId);

	public List<Dorm> queryDormLivepeopleKng();
}
