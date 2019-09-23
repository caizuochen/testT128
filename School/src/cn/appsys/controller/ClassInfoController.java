package cn.appsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.appsys.pojo.ClassInfo;
import cn.appsys.service.ClassInfo.ClassInfoCURDService;

@Controller
@RequestMapping("classInfo")
public class ClassInfoController {
		
	@Resource
	public ClassInfoCURDService classInfoCURDService;
	
	/**
	 * ��ѯ���а༶��Ϣ
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryClassInfo.action")
	public String queryClassInfo(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		//Ҫ��ѯ�İ༶����
		String classInfoName=null;
		if (null!=request.getParameter("queryClassInfoName") && !(request.getParameter("queryClassInfoName").isEmpty())) {
			classInfoName=request.getParameter("queryClassInfoName");
		}
		//��ǰҳ��
		Integer pageNumber=1;
		if (null!=request.getParameter("pageNumber")) {
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
		PageHelper.startPage(pageNumber,5);
		List<ClassInfo> classInfos=classInfoCURDService.queryClassInfo(classInfoName);
		request.setAttribute("queryclassInfo", new PageInfo<ClassInfo>(classInfos));
		request.setAttribute("queryClassInfoName", classInfoName);
		return "ClassInfo.jsp";
	}
	
	/**
	 * ɾ��һ���༶
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/deleteClassInfo.action")
	public void deleteStudent(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer classId=Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if (classInfoCURDService.queryStudentByClassid(classId)>0) {
			out.println(-1);
		}else {
			out.println(classInfoCURDService.deleteClassInfo(classId));
		}
		out.flush();
		out.close();
	}
	
	/**
	 * ���ݰ༶id��ѯ�༶
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryClassInfoById.action")
	public String queryClassInfoById(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer classId=Integer.parseInt(request.getParameter("id"));
		request.setAttribute("queryClassInfo", classInfoCURDService.queryClassInfoByClassId(classId));
		return "UpdateClassInfo.jsp";
	}
	
	/**
	 * ��ѯĳ���༶���Ƶ�����
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping("/queryClassInfoByclassName.action")
	public void queryClassInfoByclassName(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		request.setCharacterEncoding("utf-8");
		String className=request.getParameter("className");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(classInfoCURDService.queryClassInfoByClassName(className));
		out.flush();
		out.close();
	}
	
	/**
	 * �޸İ༶��Ϣ
	 * @param request
	 * @param response
	 * @param session
	 * @param classInfo
	 * @throws IOException
	 */
	@RequestMapping("/updateClassInfo.action")
	public void updateClassInfo(HttpServletRequest request,HttpServletResponse response,HttpSession session,ClassInfo classInfo) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(classInfoCURDService.updateClassInfo(classInfo));
		out.flush();
		out.close();
	}
	
	/**
	 * ��Ӱ༶
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping("/addClassInfo.action")
	public void addClassInfo(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		request.setCharacterEncoding("utf-8");
		String className=request.getParameter("className");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(classInfoCURDService.addClassInfo(className));
		out.flush();
		out.close();
	}
}
