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
		System.out.println("--------��ʼ��ʱ��ѯ�����е������ֵ��ֶ�--------");
	   	 ApplicationContext act = new ClassPathXmlApplicationContext("applicationmvc-Servlet.xml");
	     DataDictionaryService dataDictionaryService =(DataDictionaryService)act.getBean("dataDictionaryService");
	   	 //�õ����е� TYPECode 
	   	 List<DataDictionary> list =dataDictionaryService.queryData(null,null);
	   	 Map<String,List<DataDictionary>> map=new HashMap<String,List<DataDictionary>>();
	   	 for (int i = 0; i < list.size(); i++) {//������� list
	   		String typeCode=list.get(i).getTypeCode();
	   		//����õ���code ���ݽ�ȥ ��Ϊ���� ����Լ���Ӧ�� list
	   		 List<DataDictionary> list2 = dataDictionaryService.queryData(typeCode,null);
	   		 map.put(typeCode, list2); //Ȼ�����map ���key ����code ֵ����list
			}
	   	servletContext.getServletContext().setAttribute("dataMap", map);
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}
}
