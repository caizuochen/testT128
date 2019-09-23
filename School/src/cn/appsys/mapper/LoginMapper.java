package cn.appsys.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.appsys.pojo.Type;
import cn.appsys.pojo.User;

public interface LoginMapper {
	/**
	 * �����û����û�������������ѯ�����û�
	 * @param userName  �û���
	 * @param userPwd	�û�����
	 * @return
	 */
	public User login(@Param("userName")String userName,@Param("userPwd")String userPwd);
	/**
	 * �ж��û����Ƿ��Ѿ�����
	 * @param userName �û���
	 * @return
	 */
	public int isUserName(@Param("userName")String userName);
	/**
	 * �����û������������޸��û�������
	 * @param userName �û���
	 * @param cardId   �û������֤����
	 * @return
	 */
	public int userPwdUpdate(@Param("userName")String userName,@Param("cardId")String cardId,@Param("userPwd")String userPwd);
	/**
	 * ��ȡ���е��û�����
	 * @return
	 */
	public List<Type> userType();
	/**
	 * ���һ���û�����
	 * @param user
	 * @return
	 */
	public Integer addUser(User user);
}
