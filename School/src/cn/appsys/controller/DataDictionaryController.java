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
import util.DataUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.appsys.pojo.DataDictionary;
import cn.appsys.pojo.Dorm;
import cn.appsys.service.DataDictionary.DataDictionaryService;

@Transactional
@Controller
@RequestMapping("dataDictionary")
public class DataDictionaryController {
	@Resource
	public DataDictionaryService dataDictionaryService;
	
	/**
	 * 查询所有数据字典
	 * @param request
	 * @param dorm
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryData.action")
	public String queryDormById(HttpServletRequest request,Dorm dorm) throws IOException {
		request.setCharacterEncoding("utf-8");
		//要查询的类型编码
		String typeCode=null;
		if (null!=request.getParameter("queryTypeCode") && !(request.getParameter("queryTypeCode").isEmpty())) {
			typeCode=request.getParameter("queryTypeCode");
		}
		String typeName=null;
		if (null!=request.getParameter("queryTypeName") && !(request.getParameter("queryTypeName").isEmpty())) {
			typeName=request.getParameter("queryTypeName");
		}
		//当前页数
		Integer pageNumber=1;
		if (null!=request.getParameter("pageNumber")) {
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
		PageHelper.startPage(pageNumber,5);
		List<DataDictionary> dataDictionaries=dataDictionaryService.queryData(typeCode, typeName);
		request.setAttribute("queryData", new PageInfo<DataDictionary>(dataDictionaries));
		request.setAttribute("queryTypeCode", typeCode);
		request.setAttribute("queryTypeName", typeName);
		DataUtils.flushDataDictionary(request.getServletContext());
		return "DataDictionary.jsp";
	}
	
	/**
	 * 删除数据字典
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/deleteData.action")
	public void deleteData(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer dataId=Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(dataDictionaryService.deleteData(dataId));
		out.flush();
		out.close();
	}
	
	/**
	 * 根据id来查询数据字典
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/queryDataById.action")
	public String queryDataById(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		Integer dataId=Integer.parseInt(request.getParameter("id"));
		request.setAttribute("updateData", dataDictionaryService.queryDataById(dataId));
		return "UpdateDataDictionary.jsp";
	}
	
	/**
	 * 修改数据字典
	 * @param request
	 * @param response
	 * @param dataDictionary
	 * @throws IOException
	 */
	@RequestMapping("/updateData.action")
	public void updateData(HttpServletRequest request,HttpServletResponse response,DataDictionary dataDictionary) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(dataDictionaryService.updateData(dataDictionary));
		out.flush();
		out.close();
	}
	
	/**
	 * 添加数据字典
	 * @param request
	 * @param response
	 * @param dataDictionary
	 * @throws IOException
	 */
	@RequestMapping("/addDate.action")
	public void addDate(HttpServletRequest request,HttpServletResponse response,DataDictionary dataDictionary) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(dataDictionaryService.addData(dataDictionary));
		out.flush();
		out.close();
	}
}
