package cn.appsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.User;

public interface UserCURDMapper {
	/**
	 * 根据用户id查询用户信息
	 * @param userId
	 * @return
	 */
	public User QueryAdminById(@Param("id")Integer userId);
	/**
	 * 查询所有用户信息
	 * @param userName
	 * @param userGender
	 * @param userTypeId
	 * @return
	 */
	public List<User> queryUser(@Param("queryUserName")String userName,@Param("queryUserGender")Integer userGender,@Param("queryUserTypeId")Integer userTypeId);
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	public Integer deleteUser(@Param("id")Integer userId);
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public Integer updateUser(User user);
	/**
	 * 修改用户密码
	 * @param userPwd
	 * @param userId
	 * @param oldPwd
	 * @return
	 */
	public Integer updateUserPwd(@Param("userPwd")String userPwd,@Param("id")Integer userId,@Param("oldPwd")String oldPwd);
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public Integer addUser(User user);
}
