package cn.appsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.ClassInfo;

public interface ClassInfoCURDMapper {
	/**
	 * 根据班级id查询该班级下是否存在学员
	 * @param classId
	 * @return
	 */
	public Integer queryStudentByClassid(@Param("classId")Integer classId);
	/**
	 * 根据年级名称查询该名称是否已经存在
	 * @param calssName
	 * @return
	 */
	public Integer queryClassInfoByClassName(@Param("className")String className);
	/**
	 * 根据年级id查询一条学生数据
	 * @param classId
	 * @return
	 */
	public ClassInfo queryClassInfoByClassId(@Param("classId")Integer classId);
	/**
	 * 查询班级信息 如果要查询所有 将classInfoName传为null 即可
	 * @param classInfoName
	 * @return
	 */
	public List<ClassInfo> queryClassInfo(@Param("classInfoName")String classInfoName);
	/**
	 * 修改班级信息
	 * @param classInfo
	 * @return
	 */
	public Integer updateClassInfo(ClassInfo classInfo);
	/**
	 * 添加班级信息
	 * @param className
	 * @return
	 */
	public Integer addClassInfo(@Param("classInfoName")String className);
	/**
	 * 根据班级id删除班级
	 * @param id
	 * @return
	 */
	public Integer deleteClassInfo(@Param("id")Integer id);
}
