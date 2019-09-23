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
	//���ڽ���������֤��
	String emailCode;
	
	@Resource
	private LoginService loginService;
	
	/**
	 * �û���¼
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
			request.setAttribute("error", "��¼ʧ��, �˺Ż��������!!!");
			return "login/login.jsp";
		}else {
			session.setAttribute("user", user);
			return "redirect:/Index.jsp";
		}
	}
	/**
	 * �˳���¼����
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
	 * �ж��û����Ƿ���������ݿ�
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
	 * �һ��û�����
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
	 * �û�ע��Ҫ����QQ���������֤�����ע��
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
			List<String> list = Arrays.asList(beforeShuffle);// ������ת��Ϊ����
			Collections.shuffle(list); // ���Ҽ���˳��
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < list.size(); i++) {
				sb.append(list.get(i)); // ������ת��Ϊ�ַ���
			}
			emailCode=sb.toString().substring(3, 8);
			SimpleEmail mail = new SimpleEmail();
			mail.setHostName("smtp.qq.com");// �����ʼ��ķ�����
			mail.setAuthentication("209642876@qq.com", "kkznqnwvkadrbhbc");// �ոռ�¼����Ȩ�룬�ǿ���SMTP������
			mail.setFrom("209642876@qq.com", "��Ѫ��ħ"); // �����ʼ�������ͷ�����
			mail.setSSLOnConnect(true); // ʹ�ð�ȫ����
			mail.addTo(email);// ���յ�����
			mail.setSubject("�ڿ�����");// �����ʼ�������
			mail.setMsg("��ë:���!\n ע����֤��Ϊ:" + emailCode + "\n������θ���");// �����ʼ�������
			mail.send();// ����
			out.println(1);
			out.flush();
			out.close();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * �ж��û��������֤��ͷ��͵���֤������һ��
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
	 * ���һ������
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
	 * ��ѯ���е��û�����
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
