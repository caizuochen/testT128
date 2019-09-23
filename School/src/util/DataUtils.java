package util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.appsys.pojo.DataDictionary;
import cn.appsys.service.DataDictionary.DataDictionaryService;

public class DataUtils {

	/**
	 * ���� typeCode �ڻ�����ȡ����Ӧ�� �����ֵ�
	 * 
	 * @param servletContext
	 * @param typeCode
	 * @return
	 */
	public static List<DataDictionary> getDataDictionary(
			ServletContext servletContext, String typeCode) {
		Map map = (Map) servletContext.getAttribute("dataMap");
		List<DataDictionary> list = (List<DataDictionary>) map.get(typeCode);
		return list;
	}

	/**
	 * ����valueName ���valuerId
	 * 
	 * @param servletContext
	 * @param typeCode
	 * @param ValueName
	 * @return
	 */
	public static int getDataValueId(ServletContext servletContext,
			String typeCode, String ValueName) {
		int value = 0;
		Map map = (Map) servletContext.getAttribute("dataMap");
		List<DataDictionary> list = (List<DataDictionary>) map.get(typeCode);

		for (int i = 0; i < list.size(); i++) {
			DataDictionary d = list.get(i);
			if (ValueName.equals(d.getValueName())) {
				value = d.getValueId();
			}
		}

		return value;
	}

	/**
	 * ���� valuerId���valueName
	 * 
	 * @param servletContext
	 * @param typeCode
	 * @param ValueId
	 * @return
	 */
	public static String getDataValueName(ServletContext servletContext,
			String typeCode, int ValueId) {

		String ValueName = "";
		Map map = (Map) servletContext.getAttribute("dataMap");
		List<DataDictionary> list = (List<DataDictionary>) map.get(typeCode);

		for (int i = 0; i < list.size(); i++) {
			DataDictionary d = list.get(i);
			if (ValueId == d.getValueId()) {
				ValueName = d.getValueName();
			}
		}

		return ValueName;
	}

	/**
	 * ˢ�»���
	 * 
	 * @param servletContext
	 */
	public static void flushDataDictionary(ServletContext servletContext) {
		System.out.println("ˢ�»������!!!");
		ApplicationContext act = new ClassPathXmlApplicationContext(
				"applicationmvc-Servlet.xml");
		DataDictionaryService dataDictionaryService = (DataDictionaryService) act
				.getBean("dataDictionaryService");

		List<DataDictionary> list = dataDictionaryService.queryData(null, null);
		Map<String, List<DataDictionary>> map = new HashMap<String, List<DataDictionary>>();

		for (int i = 0; i < list.size(); i++) {
			String typeCode = list.get(i).getTypeCode();

			List<DataDictionary> list2 = dataDictionaryService.queryData(
					typeCode, null);
			map.put(typeCode, list2);

		}
		servletContext.setAttribute("dataMap", map);
	}
}
