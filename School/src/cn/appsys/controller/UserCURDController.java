package cn.appsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.appsys.pojo.User;
import cn.appsys.service.Login.LoginService;
import cn.appsys.service.UserCURD.UserCURDservice;

@Controller
@RequestMapping("userCURD")
public class UserCURDController {

	@Resource
	private UserCURDservice userCURDservice;
	@Resource
	private LoginService loginService;

	/**
	 * �����û�id����ѯ�û�
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryUserById.action")
	public String queryUserById(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("userUpdate", userCURDservice.QueryAdminById(id));
		request.setAttribute("updateUserType", loginService.userType());
		return "UpdateUser.jsp";
	}

	/**
	 * ��ѯ�����û�
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryUser.action")
	public String queryUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		request.setAttribute("queryType", loginService.userType());
		// Ҫ���в�ѯ���û���
		String userName = null;
		// Ҫ��ѯ���û��Ա�id
		Integer userGender = -1;
		// Ҫ��ѯ���û�����id
		Integer userTypeId = -1;
		if (null != request.getParameter("queryUserName")) {
			userName = request.getParameter("queryUserName");
		}
		if (null != request.getParameter("queryUserGender")) {
			userGender = Integer.parseInt(request
					.getParameter("queryUserGender"));
		}
		if (null != request.getParameter("queryUserType")) {
			userTypeId = Integer
					.parseInt(request.getParameter("queryUserType"));
		}
		// ��ǰҳ��
		Integer pageNumber = 1;
		if (null != request.getParameter("pageNumber")) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		PageHelper.startPage(pageNumber, 5);

		List<User> listUser = userCURDservice.queryUser(userName, userGender,
				userTypeId);

		request.setAttribute("userList", new PageInfo<User>(listUser));
		request.setAttribute("queryUserName", userName);
		request.setAttribute("queryUserGender", userGender);
		request.setAttribute("queryUserType", userTypeId);
		return "User.jsp";
	}

	/**
	 * ɾ���û�
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/deleteUser.action")
	public void deleteUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Integer userId = Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(userCURDservice.deleteUser(userId));
		out.flush();
		out.close();
	}

	/**
	 * �޸��û�
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param user
	 * @throws IOException
	 */
	@RequestMapping("/updateUser.action")
	public void updateUser(HttpServletRequest request,
			HttpServletResponse response, User user) throws IOException {
		String qq = user.getEmail().substring(0, user.getEmail().indexOf("@"));
		user.setQQ(qq);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(userCURDservice.updateUser(user));
		out.flush();
		out.close();
	}

	/**
	 * �޸ĵ�ǰ��¼���û�����
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping("/updateUserPwd.action")
	public void updateUserPwd(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String userPwd = request.getParameter("userPwd");
		String oldPwd = request.getParameter("oldPwd");
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		out.println(userCURDservice.updateUserPwd(userPwd, userId, oldPwd));
		out.flush();
		out.close();
	}
}
