package cn.appsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.Dorm;
import cn.appsys.pojo.Student;

public interface DormCURDMapper {
	/**
	 * ��ѯ���� �����ѯ����dormName����  null
	 * @param dormName
	 * @return
	 */
	public List<Dorm> queryDorm(@Param("dormName")String dormName);
	/**
	 * ��������id��ѯ����
	 * @param dormId
	 * @return
	 */
	public Integer deleteDorm(@Param("id")Integer dormId);
	/**
	 * �������
	 * @param dorm
	 * @return
	 */
	public Integer addDorm(Dorm dorm);
	/**
	 * �жϴ�������������Ƿ����
	 * @param dormName
	 * @return
	 */
	public Integer queryDormByName(@Param("dormName")String dormName);
	/**
	 * �޸�������Ϣ
	 * @param dorm
	 * @return
	 */
	public Integer updateDorm(Dorm dorm);
	/**
	 * ��������id��ѯ����
	 * @param dormId
	 * @return
	 */
	public Dorm queryDormById(@Param("id")Integer dormId);
	/**
	 * ��ѯ��û�з������ҵ�ѧԱ
	 * @return
	 */
	public List<Student> queryStudentDormIdIsNull();
	/**
	 * ���� ��ס����-1
	 * @param dormId
	 * @return
	 */
	public Integer updateDormDown(@Param("id")Integer dormId);
	/**
	 * ���� ��ס����+1
	 * @param dormId
	 * @return
	 */
	public Integer updateDormUp(@Param("id")Integer dormId);
	/**
	 * ��ѯ���������id�µ�����ѧ��
	 * @param dormId 
	 * @return
	 */
	public List<Student> queryStudentByDormId(@Param("id")Integer dormId);
	/**
	 * Ϊѧ���������id
	 * @param dormId
	 * @param studentId
	 * @return
	 */
	public Integer updateStudentDormId(@Param("dormId")Integer dormId,@Param("studentId")Integer studentId);
	/**
	 * ��ѯ���һ�û��ס��������
	 * @return
	 */
	public List<Dorm> queryDormLivepeopleKng();
}
