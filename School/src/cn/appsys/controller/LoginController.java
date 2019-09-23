package cn.appsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.appsys.pojo.User;
import cn.appsys.service.Login.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {
	//用于接收邮箱验证码
	String emailCode;
	
	@Resource
	private LoginService loginService;
	
	/**
	 * 用户登录
	 * @param request
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/login.action")
	public String login(HttpServletRequest request,HttpSession session) throws IOException {
		request.setCharacterEncoding("utf-8");
		String userName=request.getParameter("userName");
		String userPwd=request.getParameter("userPwd");
		User user = loginService.login(userName, userPwd);
		if (null == user) {
			request.setAttribute("error", "登录失败, 账号或密码错误!!!");
			return "login/login.jsp";
		}else {
			session.setAttribute("user", user);
			return "redirect:/Index.jsp";
		}
	}
	/**
	 * 退出登录操作
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/quitSession.action")
	public String quitSession(HttpSession session) throws IOException {
		session.removeAttribute("student");
		return "login/login.jsp";
	}
	
	/**
	 * 判断用户名是否存在于数据库
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/isUserName.action")
	public void isUserName(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		String userName=request.getParameter("userName");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(loginService.isUserName(userName));
		out.flush();
		out.close();
		
	}
	
	/**
	 * 找回用户密码
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping("/getPass.action")
	public void getPass(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		String cardId=request.getParameter("cardId");
		String userPwd=request.getParameter("userPwd");
		String userName=request.getParameter("userName");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(loginService.userPwdUpdate(userName, cardId, userPwd));
		out.flush();
		out.close();
	}
	
	/**
	 * 用户注册要进行QQ邮箱接收验证码进行注册
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping("/qqEmail.action")
	public void qqEmail(HttpServletRequest request,HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String email=request.getParameter("email");
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String[] beforeShuffle = new String[] { "2", "3", "4", "5", "6",
					"7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
					"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
					"V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g",
					"h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
					"t", "u", "v", "w", "x", "y", "z" };
			List<String> list = Arrays.asList(beforeShuffle);// 将数组转换为集合
			Collections.shuffle(list); // 打乱集合顺序
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < list.size(); i++) {
				sb.append(list.get(i)); // 将集合转化为字符串
			}
			emailCode=sb.toString().substring(3, 8);
			SimpleEmail mail = new SimpleEmail();
			mail.setHostName("smtp.qq.com");// 发送邮件的服务器
			mail.setAuthentication("209642876@qq.com", "kkznqnwvkadrbhbc");// 刚刚记录的授权码，是开启SMTP的密码
			mail.setFrom("209642876@qq.com", "嗜血狂魔"); // 发送邮件的邮箱和发件人
			mail.setSSLOnConnect(true); // 使用安全链接
			mail.addTo(email);// 接收的邮箱
			mail.setSubject("黑客渗入");// 设置邮件的主题
			mail.setMsg("叼毛:你好!\n 注册验证码为:" + emailCode + "\n尽量快滴搞完");// 设置邮件的内容
			mail.send();// 发送
			out.println(1);
			out.flush();
			out.close();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断用户输入的验证码和发送的验证码所有一致
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/emailVerify.action")
	public void emailVerify(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		String emailCode=request.getParameter("emailCode");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		if (emailCode.equals(this.emailCode)) {
			out.println(1);
		}else {
			out.println(0);
		}
		out.flush();
		out.close();
	}
	
	/**
	 * 添加一条数据
	 * @param request
	 * @param response
	 * @param session
	 * @param student
	 * @throws IOException
	 */
	@RequestMapping("/addUser.action")
	public void addUser(HttpServletRequest request,HttpServletResponse response,User user) throws IOException {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String qq=user.getEmail().substring(0, user.getEmail().indexOf("@"));
		user.setQQ(qq);
		out.println(loginService.addUser(user));
		out.flush();
		out.close();
	}
	/**
	 * 查询所有的用户类型
	 * @param request
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/regJSP.action")
	public String regJSP(HttpServletRequest request) throws IOException {
		request.setAttribute("type", loginService.userType());
		return "login/reg.jsp";
	}
}
