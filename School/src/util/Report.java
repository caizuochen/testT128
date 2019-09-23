package util;

import java.io.InputStream;
import java.util.Collection;
import java.util.Map;

public interface Report {
	@SuppressWarnings("rawtypes")
	public void makeReport(Collection collection, String filePath);

	public void makeReport(String[] dataStr, String filePath);

	@SuppressWarnings("rawtypes")
	public void makeReport(Collection collection, String[] collumHead,
			String filePath);

	/**
	 * ��ģ�����ɱ���ʹ��jxls���ñ���ģ��,����ͨ����������ر���
	 * 
	 * @param templetFileName
	 *            ģ���ļ�����·��+ģ���ļ���
	 * @param beans
	 *            ģ��������󼯺�
	 * @return InputStream
	 */
	@SuppressWarnings("rawtypes")
	public InputStream makeReportFromTemplet(String templetFileName, Map beans);

	/**
	 * ��ģ�����ɱ���ʹ��jxls���ñ���ģ��,ֱ�����ɱ����ļ�
	 * 
	 * @param templetFileName
	 * @param beans
	 * @param targetFileName
	 */
	@SuppressWarnings("rawtypes")
	public void makeReportFromTemplet(String templetFileName, Map beans,
			String targetFileName);

}
