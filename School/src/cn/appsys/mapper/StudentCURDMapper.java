package cn.appsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.ClassInfo;
import cn.appsys.pojo.Student;

public interface StudentCURDMapper {
	/**
	 * ���ݰ༶id����ѯ�ð༶������
	 * @param classId
	 * @return
	 */
	public Integer ClassCount(@Param("id")Integer classId);
	/**
	 * ������������ѯ����ѧԱ��Ϣ �����ѯȫ�������
	 * @param studentName     ѧԱ����
	 * @param studentGender   ѧԱ�Ա�id
	 * @param studentClassId  ѧԱ�꼶id
	 * @return
	 */
	public List<Student> queryStudent(@Param("queryStudentName")String studentName,@Param("queryStudentGender")Integer studentGender,@Param("queryStudentClassId")Integer studentClassId);
	/**
	 * ����ѧ��id��ѯһ��ѧԱ����
	 * @param studentId  ѧԱid
	 * @return
	 */
	public Student queryStudentById(@Param("id")Integer studentId);
	/**
	 * ����ѧ��idɾ��һ��ѧԱ����
	 * @param studentId  ѧԱid  
	 * @return
	 */
	public Integer deleteStudent(@Param("id")Integer studentId);
	/**
	 * �޸�һ��ѧԱ����
	 * @param student ѧԱ����
	 * @return
	 */
	public Integer updateStudent(Student student);
	/**
	 * ���һλѧԱ
	 * @param student ѧԱ����  
	 * @return
	 */
	public Integer addStudent(Student student);
	/**
	 * ��ѯ���а༶��Ϣ
	 * @return
	 */
	public List<ClassInfo> queryClassInfo();
}
