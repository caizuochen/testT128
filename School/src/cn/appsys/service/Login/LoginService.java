package cn.appsys.service.Login;

import java.util.List;
import cn.appsys.pojo.Type;
import cn.appsys.pojo.User;

public interface LoginService {
	public User login(String userName, String userPwd);

	public int isUserName(String userName);

	public int userPwdUpdate(String userName, String cardId, String userPwd);

	public List<Type> userType();

	public Integer addUser(User user);
}
