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
	 * 根据 typeCode 在缓存中取出对应的 数据字典
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
	 * 根据valueName 获得valuerId
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
	 * 根据 valuerId获得valueName
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
	 * 刷新缓存
	 * 
	 * @param servletContext
	 */
	public static void flushDataDictionary(ServletContext servletContext) {
		System.out.println("刷新缓存完成!!!");
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
