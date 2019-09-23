package util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.appsys.pojo.DataDictionary;
import cn.appsys.service.DataDictionary.DataDictionaryService;

public class ApplicationListener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent servletContext) {
		System.out.println("--------初始化时查询出所有的数据字典字段--------");
	   	 ApplicationContext act = new ClassPathXmlApplicationContext("applicationmvc-Servlet.xml");
	     DataDictionaryService dataDictionaryService =(DataDictionaryService)act.getBean("dataDictionaryService");
	   	 //得到所有的 TYPECode 
	   	 List<DataDictionary> list =dataDictionaryService.queryData(null,null);
	   	 Map<String,List<DataDictionary>> map=new HashMap<String,List<DataDictionary>>();
	   	 for (int i = 0; i < list.size(); i++) {//遍历这个 list
	   		String typeCode=list.get(i).getTypeCode();
	   		//把你得到的code 传递进去 作为参数 查出自己对应的 list
	   		 List<DataDictionary> list2 = dataDictionaryService.queryData(typeCode,null);
	   		 map.put(typeCode, list2); //然后你的map 存的key 就是code 值就是list
			}
	   	servletContext.getServletContext().setAttribute("dataMap", map);
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}
}
