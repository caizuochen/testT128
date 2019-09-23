package cn.appsys.service.DormCURD;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import cn.appsys.mapper.DormCURDMapper;
import cn.appsys.pojo.Dorm;
import cn.appsys.pojo.Student;

@Service("dormCURDService")
public class DormCURDServiceImpl implements DormCURDService {
	@Resource
	public DormCURDMapper dormCURDMapper;

	@Override
	public List<Dorm> queryDorm(String dormName) {
		return dormCURDMapper.queryDorm(dormName);
	}

	@Override
	public Integer deleteDorm(Integer dormId) {
		return dormCURDMapper.deleteDorm(dormId);
	}

	@Override
	public Integer addDorm(Dorm dorm) {
		return dormCURDMapper.addDorm(dorm);
	}

	@Override
	public Integer queryDormByName(String dormName) {
		return dormCURDMapper.queryDormByName(dormName);
	}

	@Override
	public Integer updateDorm(Dorm dorm) {
		return dormCURDMapper.updateDorm(dorm);
	}

	@Override
	public Dorm queryDormById(Integer dormId) {
		return dormCURDMapper.queryDormById(dormId);
	}

	@Override
	public List<Student> queryStudentDormIdIsNull() {
		return dormCURDMapper.queryStudentDormIdIsNull();
	}

	@Override
	public Integer updateDormDown(Integer dormId) {
		return dormCURDMapper.updateDormDown(dormId);
	}

	@Override
	public Integer updateDormUp(Integer dormId) {
		return dormCURDMapper.updateDormUp(dormId);
	}

	@Override
	public List<Student> queryStudentByDormId(Integer dormId) {
		return dormCURDMapper.queryStudentByDormId(dormId);
	}

	@Override
	public Integer updateStudentDormId(Integer dormId, Integer studentId) {
		return dormCURDMapper.updateStudentDormId(dormId, studentId);
	}

	@Override
	public List<Dorm> queryDormLivepeopleKng() {
		return dormCURDMapper.queryDormLivepeopleKng();
	}

}
