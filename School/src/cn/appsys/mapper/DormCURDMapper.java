package cn.appsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.Dorm;
import cn.appsys.pojo.Student;

public interface DormCURDMapper {
	/**
	 * 查询寝室 如果查询所有dormName传入  null
	 * @param dormName
	 * @return
	 */
	public List<Dorm> queryDorm(@Param("dormName")String dormName);
	/**
	 * 根据寝室id查询寝室
	 * @param dormId
	 * @return
	 */
	public Integer deleteDorm(@Param("id")Integer dormId);
	/**
	 * 添加寝室
	 * @param dorm
	 * @return
	 */
	public Integer addDorm(Dorm dorm);
	/**
	 * 判断传入的寝室名称是否存在
	 * @param dormName
	 * @return
	 */
	public Integer queryDormByName(@Param("dormName")String dormName);
	/**
	 * 修改寝室信息
	 * @param dorm
	 * @return
	 */
	public Integer updateDorm(Dorm dorm);
	/**
	 * 根据寝室id查询寝室
	 * @param dormId
	 * @return
	 */
	public Dorm queryDormById(@Param("id")Integer dormId);
	/**
	 * 查询还没有分配寝室的学员
	 * @return
	 */
	public List<Student> queryStudentDormIdIsNull();
	/**
	 * 寝室 已住人数-1
	 * @param dormId
	 * @return
	 */
	public Integer updateDormDown(@Param("id")Integer dormId);
	/**
	 * 寝室 已住人数+1
	 * @param dormId
	 * @return
	 */
	public Integer updateDormUp(@Param("id")Integer dormId);
	/**
	 * 查询传入的寝室id下的所有学生
	 * @param dormId 
	 * @return
	 */
	public List<Student> queryStudentByDormId(@Param("id")Integer dormId);
	/**
	 * 为学生添加寝室id
	 * @param dormId
	 * @param studentId
	 * @return
	 */
	public Integer updateStudentDormId(@Param("dormId")Integer dormId,@Param("studentId")Integer studentId);
	/**
	 * 查询寝室还没有住满的寝室
	 * @return
	 */
	public List<Dorm> queryDormLivepeopleKng();
}
