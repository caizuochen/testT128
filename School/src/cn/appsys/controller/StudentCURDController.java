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
import util.ExcelExportUtil;
import cn.appsys.pojo.Student;
import cn.appsys.service.StudentCURD.StudentCURDService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping("student")
public class StudentCURDController{
	@Resource
	private StudentCURDService studentCURDService;
	
	/**
	 * 根据id来查询学生信息
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryStudentById.action")
	public String queryStudentById(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer studentId=Integer.parseInt(request.getParameter("id"));
		request.setAttribute("studentUpdate", studentCURDService.queryStudentById(studentId));
		return "UpdateStudent.jsp";
	}
	
	/**
	 * 查询所有学生信息
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryStudent.action")
	public String queryStudent(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//要进行查询的用户名
		String studentName=null;
		//要查询的用户性别id
		Integer studentGender=-1;
		//要查询的班级id
		Integer studentClassId=-1;
		if (null!=request.getParameter("queryStudentName")) {
			studentName=request.getParameter("queryStudentName");
		}
		if (null!=request.getParameter("queryStudentGender")) {
			studentGender=Integer.parseInt(request.getParameter("queryStudentGender"));
		}
		if (null!=request.getParameter("queryStudentClassId")) {
			studentClassId=Integer.parseInt(request.getParameter("queryStudentClassId"));
		}
		//当前页数
		Integer pageNumber=1;
		if (null!=request.getParameter("pageNumber")) {
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
		PageHelper.startPage(pageNumber,5);
		List<Student> listStudent=studentCURDService.queryStudent(studentName, studentGender, studentClassId);
		session.setAttribute("student", new PageInfo<Student>(listStudent));
		session.setAttribute("classInfo", studentCURDService.queryClassInfo());
		session.setAttribute("queryStudentName", studentName);
		session.setAttribute("queryStudentGender", studentGender);
		session.setAttribute("queryStudentClassId", studentClassId);
		return "redirect:/Student.jsp";
	}
	
	/**
	 * 删除学生
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/deleteStudent.action")
	public void deleteStudent(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer studentId=Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(studentCURDService.deleteStudent(studentId));
		out.flush();
		out.close();
	}
	
	/**
	 * 根据班级id来查询该班级的人数
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/classCount.action")
	public void classCount(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer classId=Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(studentCURDService.ClassCount(classId));
		out.flush();
		out.close();
	}
	
	/**
	 * 修改学生信息
	 * @param request
	 * @param response
	 * @param student
	 * @throws IOException
	 */
	@RequestMapping("/updateStudent.action")
	public void updateStudent(HttpServletRequest request,HttpServletResponse response,Student student) throws IOException {
		request.setCharacterEncoding("utf-8");
		String qq=student.getEmail().substring(0, student.getEmail().indexOf("@"));
		student.setQQ(qq);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(studentCURDService.updateStudent(student));
		out.flush();
		out.close();
	}
	
	/**
	 * 添加学生信息
	 * @param request
	 * @param response
	 * @param session
	 * @param student
	 * @throws IOException
	 */
	@RequestMapping("/addStudent.action")
	public void addStudent(HttpServletRequest request,HttpServletResponse response,HttpSession session,Student student) throws IOException {
		request.setCharacterEncoding("utf-8");
		String qq=student.getEmail().substring(0, student.getEmail().indexOf("@"));
		student.setQQ(qq);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(studentCURDService.addStudent(student));
		out.flush();
		out.close();
	}
	
	/**
	 * 导出学生到Excel
	 * @param request
	 * @param response
	 */
	@RequestMapping("/excelExport.action")
	public void excelExport(HttpServletRequest request,HttpServletResponse response) {
	     ExcelExportUtil.excelReport(studentCURDService.queryStudent(null,-1, -1), request, response);
	}
}
