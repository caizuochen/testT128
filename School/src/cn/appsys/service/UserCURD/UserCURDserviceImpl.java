package cn.appsys.service.UserCURD;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.appsys.mapper.UserCURDMapper;
import cn.appsys.pojo.User;

@Service("UserCURDservice")
public class UserCURDserviceImpl implements UserCURDservice {
	@Resource
	private UserCURDMapper userCURDMapper;

	@Override
	public User QueryAdminById(Integer userId) {
		return userCURDMapper.QueryAdminById(userId);
	}

	@Override
	public List<User> queryUser(String userName, Integer userGender,
			Integer userTypeId) {
		return userCURDMapper.queryUser(userName, userGender, userTypeId);
	}

	@Override
	public Integer deleteUser(Integer userId) {
		return userCURDMapper.deleteUser(userId);
	}

	@Override
	public Integer updateUser(User user) {
		return userCURDMapper.updateUser(user);
	}

	@Override
	public Integer addUser(User user) {
		return userCURDMapper.addUser(user);
	}

	@Override
	public Integer updateUserPwd(String userPwd, Integer userId, String oldPwd) {
		return userCURDMapper.updateUserPwd(userPwd, userId, oldPwd);
	}

}
