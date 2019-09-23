package cn.appsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.User;

public interface UserCURDMapper {
	/**
	 * �����û�id��ѯ�û���Ϣ
	 * @param userId
	 * @return
	 */
	public User QueryAdminById(@Param("id")Integer userId);
	/**
	 * ��ѯ�����û���Ϣ
	 * @param userName
	 * @param userGender
	 * @param userTypeId
	 * @return
	 */
	public List<User> queryUser(@Param("queryUserName")String userName,@Param("queryUserGender")Integer userGender,@Param("queryUserTypeId")Integer userTypeId);
	/**
	 * ɾ���û�
	 * @param userId
	 * @return
	 */
	public Integer deleteUser(@Param("id")Integer userId);
	/**
	 * �޸��û�
	 * @param user
	 * @return
	 */
	public Integer updateUser(User user);
	/**
	 * �޸��û�����
	 * @param userPwd
	 * @param userId
	 * @param oldPwd
	 * @return
	 */
	public Integer updateUserPwd(@Param("userPwd")String userPwd,@Param("id")Integer userId,@Param("oldPwd")String oldPwd);
	/**
	 * ����û�
	 * @param user
	 * @return
	 */
	public Integer addUser(User user);
}
