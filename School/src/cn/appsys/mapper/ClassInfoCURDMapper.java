package cn.appsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.ClassInfo;

public interface ClassInfoCURDMapper {
	/**
	 * ���ݰ༶id��ѯ�ð༶���Ƿ����ѧԱ
	 * @param classId
	 * @return
	 */
	public Integer queryStudentByClassid(@Param("classId")Integer classId);
	/**
	 * �����꼶���Ʋ�ѯ�������Ƿ��Ѿ�����
	 * @param calssName
	 * @return
	 */
	public Integer queryClassInfoByClassName(@Param("className")String className);
	/**
	 * �����꼶id��ѯһ��ѧ������
	 * @param classId
	 * @return
	 */
	public ClassInfo queryClassInfoByClassId(@Param("classId")Integer classId);
	/**
	 * ��ѯ�༶��Ϣ ���Ҫ��ѯ���� ��classInfoName��Ϊnull ����
	 * @param classInfoName
	 * @return
	 */
	public List<ClassInfo> queryClassInfo(@Param("classInfoName")String classInfoName);
	/**
	 * �޸İ༶��Ϣ
	 * @param classInfo
	 * @return
	 */
	public Integer updateClassInfo(ClassInfo classInfo);
	/**
	 * ��Ӱ༶��Ϣ
	 * @param className
	 * @return
	 */
	public Integer addClassInfo(@Param("classInfoName")String className);
	/**
	 * ���ݰ༶idɾ���༶
	 * @param id
	 * @return
	 */
	public Integer deleteClassInfo(@Param("id")Integer id);
}
