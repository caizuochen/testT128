package cn.appsys.service.ClassInfo;

import java.util.List;
import cn.appsys.pojo.ClassInfo;

public interface ClassInfoCURDService {
	public Integer queryStudentByClassid(Integer classId);

	public Integer queryClassInfoByClassName(String className);

	public ClassInfo queryClassInfoByClassId(Integer classId);

	public List<ClassInfo> queryClassInfo(String classInfoName);

	public Integer updateClassInfo(ClassInfo classInfo);

	public Integer addClassInfo(String className);

	public Integer deleteClassInfo(Integer id);
}
