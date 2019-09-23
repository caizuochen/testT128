package cn.appsys.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.appsys.pojo.Type;
import cn.appsys.pojo.User;

public interface LoginMapper {
	/**
	 * 根据用户的用户名和密码来查询单个用户
	 * @param userName  用户名
	 * @param userPwd	用户密码
	 * @return
	 */
	public User login(@Param("userName")String userName,@Param("userPwd")String userPwd);
	/**
	 * 判断用户名是否已经存在
	 * @param userName 用户名
	 * @return
	 */
	public int isUserName(@Param("userName")String userName);
	/**
	 * 根据用户名和密码来修改用户的密码
	 * @param userName 用户名
	 * @param cardId   用户的身份证号码
	 * @return
	 */
	public int userPwdUpdate(@Param("userName")String userName,@Param("cardId")String cardId,@Param("userPwd")String userPwd);
	/**
	 * 获取所有的用户类型
	 * @return
	 */
	public List<Type> userType();
	/**
	 * 添加一个用户数据
	 * @param user
	 * @return
	 */
	public Integer addUser(User user);
}
