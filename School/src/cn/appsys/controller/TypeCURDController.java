package cn.appsys.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.appsys.service.TypeCURD.TypeCURDservice;

@Controller
@RequestMapping("typeCURD")
public class TypeCURDController {
	@Resource
	private TypeCURDservice typeCURDservice;
	
	/**
	 * ��ѯ�����û�����
	 * @param request
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryType.action")
	public String queryType(HttpServletRequest request,HttpSession session) throws IOException {
		request.setCharacterEncoding("utf-8");
		session.setAttribute("queryType", typeCURDservice.queryType());
		return "redirect:/Type.jsp";
	}
	
	/**
	 * ɾ��һ���û�����
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/deleteType.action")
	public String deleteType(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer typeId=Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html");
		Integer result=typeCURDservice.deleteType(typeId);
		request.setAttribute("queryType", typeCURDservice.queryType());
		if (result<=0) {
			request.setAttribute("result", "ɾ��ʧ����");
		}else {
			request.setAttribute("result", "ɾ���ɹ���");
		}
		return "Type.jsp";
	}
	
	/**
	 * �޸�һ���û�����
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/updateType.action")
	public void updateType(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer typeId=Integer.parseInt(request.getParameter("id"));
		String typeName=request.getParameter("typeName");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(typeCURDservice.updateType(typeName, typeId));
		out.flush();
		out.close();
	}
	
	/**
	 * ���һ���û�����
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addType.action")
	public void addType(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		String typeName=request.getParameter("typeName");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(typeCURDservice.addType(typeName));
		out.flush();
		out.close();
	}
	
	/**
	 * �����û�����id�޸�
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryTypeById.action")
	public String queryTypeById(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer typeId=Integer.parseInt(request.getParameter("id"));
		request.setAttribute("queryTypeById", typeCURDservice.queryTypeById(typeId));
		return "UpdateType.jsp";
	}
}
