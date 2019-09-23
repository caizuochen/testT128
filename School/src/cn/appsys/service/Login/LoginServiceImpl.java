package cn.appsys.service.Login;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.appsys.mapper.LoginMapper;
import cn.appsys.pojo.Type;
import cn.appsys.pojo.User;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {

	@Resource
	private LoginMapper loginMapper;

	@Override
	public User login(String userName, String userPwd) {
		return loginMapper.login(userName, userPwd);
	}

	@Override
	public int isUserName(String userName) {
		return loginMapper.isUserName(userName);
	}

	@Override
	public int userPwdUpdate(String userName, String cardId, String userPwd) {
		return loginMapper.userPwdUpdate(userName, cardId, userPwd);
	}

	@Override
	public List<Type> userType() {
		return loginMapper.userType();
	}

	@Override
	public Integer addUser(User user) {
		return loginMapper.addUser(user);
	}
}
