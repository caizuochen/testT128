package cn.appsys.service.ClassInfo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.appsys.mapper.ClassInfoCURDMapper;
import cn.appsys.pojo.ClassInfo;

@Service("classInfoCURDService")
public class ClassInfoCURDServiceImpl implements ClassInfoCURDService {

	@Resource
	public ClassInfoCURDMapper classInfoCURDMapper;

	@Override
	public List<ClassInfo> queryClassInfo(String classInfoName) {
		return classInfoCURDMapper.queryClassInfo(classInfoName);
	}

	@Override
	public Integer updateClassInfo(ClassInfo classInfo) {
		return classInfoCURDMapper.updateClassInfo(classInfo);
	}

	@Override
	public Integer addClassInfo(String className) {
		return classInfoCURDMapper.addClassInfo(className);
	}

	@Override
	public Integer deleteClassInfo(Integer id) {
		return classInfoCURDMapper.deleteClassInfo(id);
	}

	@Override
	public ClassInfo queryClassInfoByClassId(Integer classId) {
		return classInfoCURDMapper.queryClassInfoByClassId(classId);
	}

	@Override
	public Integer queryClassInfoByClassName(String className) {
		return classInfoCURDMapper.queryClassInfoByClassName(className);
	}

	@Override
	public Integer queryStudentByClassid(Integer classId) {
		return classInfoCURDMapper.queryStudentByClassid(classId);
	}

}
