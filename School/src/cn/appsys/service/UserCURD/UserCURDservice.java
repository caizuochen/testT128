package cn.appsys.service.UserCURD;
import java.util.List;

import cn.appsys.pojo.User;

public interface UserCURDservice {

	public User QueryAdminById(Integer userId);
	
	public List<User> queryUser(String userName,Integer userGender,Integer userTypeId);
	
	public Integer deleteUser(Integer userId);
	
	public Integer updateUser(User user);
	
	public Integer addUser(User user);
	
	public Integer updateUserPwd(String userPwd,Integer userId,String oldPwd);
}
