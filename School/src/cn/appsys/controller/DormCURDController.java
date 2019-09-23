package cn.appsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.appsys.pojo.Dorm;
import cn.appsys.service.DormCURD.DormCURDService;

@Transactional
@Controller
@RequestMapping("dorm")
public class DormCURDController {
	@Resource
	public DormCURDService dormCURDService;
	
	/**
	 * 查询所有寝室
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryDorm.action")
	public String queryDorm(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		//要查询的班级名称
		String dormName=null;
		if (null!=request.getParameter("queryDormName") && !(request.getParameter("queryDormName").isEmpty())) {
			dormName=request.getParameter("queryDormName");
		}
		//当前页数
		Integer pageNumber=1;
		if (null!=request.getParameter("pageNumber")) {
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
		PageHelper.startPage(pageNumber,5);
		List<Dorm> dorms=dormCURDService.queryDorm(dormName);
		request.setAttribute("queryDorm", new PageInfo<Dorm>(dorms));
		request.setAttribute("queryDormName", dormName);
		return "Dorm.jsp";
	}
	/**
	 * 根据寝室id来查询寝室
	 * @param request
	 * @param dorm
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryDormById.action")
	public String queryDormById(HttpServletRequest request,Dorm dorm) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer dormId=Integer.parseInt(request.getParameter("id"));
		request.setAttribute("queryDorm", dormCURDService.queryDormById(dormId));
		return "UpdateDorm.jsp";
	}
	/**
	 * 删除寝室
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/deleteDorm.action")
	public void deleteDorm(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer dormId=Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(dormCURDService.deleteDorm(dormId));
		out.flush();
		out.close();
	}
	/**
	 * 添加寝室
	 * @param request
	 * @param response
	 * @param dorm
	 * @throws IOException
	 */
	@RequestMapping("/addDorm.action")
	public void addDorm(HttpServletRequest request,HttpServletResponse response,Dorm dorm) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(dormCURDService.addDorm(dorm));
		out.flush();
		out.close();
	}
    
	/**
	 * 修改寝室
	 * @param request
	 * @param response
	 * @param dorm
	 * @throws IOException
	 */
	@RequestMapping("/updateDorm.action")
	public void updateDorm(HttpServletRequest request,HttpServletResponse response,Dorm dorm) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(dormCURDService.updateDorm(dorm));
		out.flush();
		out.close();
	}
	
	/**
	 * 查询某个寝室名称的寝室是否存在
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/queryDormByName.action")
	public void queryDormByName(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		String dormName=request.getParameter("dormName");
		PrintWriter out = response.getWriter();
		out.println(dormCURDService.queryDormByName(dormName));
		out.flush();
		out.close();
	}
	
	/**
	 * 查询某个寝室下的所有学生
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryStudentByDormId.action")
	public String queryStudentByDormId(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		Integer dormId=Integer.parseInt(request.getParameter("id"));
		request.getSession().setAttribute("dormStudent",dormCURDService.queryStudentByDormId(dormId));
		return "DormStudent.jsp";
	}
	
	/**
	 * 为寝室添加学生
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/addStudentDorm.action")
	public String addStudentDorm(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		request.setAttribute("addDormInStudent",dormCURDService.queryDormLivepeopleKng());
		request.setAttribute("addStudentInDorm",dormCURDService.queryStudentDormIdIsNull());
		return "UpdateStudentDorm.jsp";
	}
	
	/**
	 * 判断添加学生到寝室是否成功
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/UpdateStudentDormUp.action")
	public void UpdateStudentDormUp(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Integer dormId=Integer.parseInt(request.getParameter("dormId"));
		Integer studentId=Integer.parseInt(request.getParameter("studentId"));
		int result=dormCURDService.updateStudentDormId(dormId, studentId);
		if (result>0) {
			out.print(dormCURDService.updateDormUp(dormId));
		}else {
			out.print(0);
		}
		out.flush();
		out.close();
	}
	
	/**
	 * 将一个学生从寝室移除
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/UpdateStudentDormDown.action")
	public String UpdateStudentDormDown(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer dormId=Integer.parseInt(request.getParameter("dormId"));
		Integer studentId=Integer.parseInt(request.getParameter("studentId"));
		int result=dormCURDService.updateStudentDormId(null, studentId);
		if (result>0 && dormCURDService.updateDormDown(dormId)>0) {
			request.getSession().setAttribute("dormStudent",dormCURDService.queryStudentByDormId(dormId));
			request.setAttribute("error", "踢出成功!!!");
		}else {
			request.getSession().setAttribute("dormStudent",dormCURDService.queryStudentByDormId(dormId));
			request.setAttribute("error", "踢出失败!!!");
		}
		return "DormStudent.jsp";
	}
}
