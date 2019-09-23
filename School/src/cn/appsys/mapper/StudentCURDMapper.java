package cn.appsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.ClassInfo;
import cn.appsys.pojo.Student;

public interface StudentCURDMapper {
	/**
	 * 根据班级id来查询该班级的人数
	 * @param classId
	 * @return
	 */
	public Integer ClassCount(@Param("id")Integer classId);
	/**
	 * 根据条件来查询所有学员信息 如果查询全部传入空
	 * @param studentName     学员姓名
	 * @param studentGender   学员性别id
	 * @param studentClassId  学员年级id
	 * @return
	 */
	public List<Student> queryStudent(@Param("queryStudentName")String studentName,@Param("queryStudentGender")Integer studentGender,@Param("queryStudentClassId")Integer studentClassId);
	/**
	 * 根据学生id查询一条学员数据
	 * @param studentId  学员id
	 * @return
	 */
	public Student queryStudentById(@Param("id")Integer studentId);
	/**
	 * 根据学生id删除一条学员数据
	 * @param studentId  学员id  
	 * @return
	 */
	public Integer deleteStudent(@Param("id")Integer studentId);
	/**
	 * 修改一条学员数据
	 * @param student 学员对象
	 * @return
	 */
	public Integer updateStudent(Student student);
	/**
	 * 添加一位学员
	 * @param student 学员对象  
	 * @return
	 */
	public Integer addStudent(Student student);
	/**
	 * 查询所有班级信息
	 * @return
	 */
	public List<ClassInfo> queryClassInfo();
}
