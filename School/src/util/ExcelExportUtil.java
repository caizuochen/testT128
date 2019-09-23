package util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.appsys.pojo.Student;

public class ExcelExportUtil {
	public static void excelReport(List<Student> listStudent,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, Object> beans = new HashMap<String, Object>();
			beans.put("student", listStudent);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
			// ��䱨��
			String filePath = "\\feedBackTemplet.xls";
			String fileName = "�û�������Ϣ����.xls";
			beans.put("createDate", df.format(new Date()));
			InputStream is = new ExcelReport().makeReportFromTemplet(
					request.getRealPath("/WEB-INF") + filePath, beans);
			OutputStream out = response.getOutputStream();
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(fileName.getBytes(), "ISO-8859-1"));
			response.setContentType("application/msexcel;charset=UTF-8");
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = is.read(buffer)) != -1) {
				out.write(buffer, 0, len);
				out.flush(); // �������ļ����ƣ����ļ��洢������������ͨ�������д�뵽�ϴ�λ��
			} // ��δ���Ҳ������IOUtils.copy(in, out)�������copy�������
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
