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
	 * 查询所有用户类型
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
	 * 删除一个用户类型
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
			request.setAttribute("result", "删除失败啦");
		}else {
			request.setAttribute("result", "删除成功啦");
		}
		return "Type.jsp";
	}
	
	/**
	 * 修改一个用户类型
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
	 * 添加一个用户类型
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
	 * 根据用户类型id修改
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
