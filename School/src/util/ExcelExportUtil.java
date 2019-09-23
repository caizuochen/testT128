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
			// 填充报表
			String filePath = "\\feedBackTemplet.xls";
			String fileName = "用户反馈信息报表.xls";
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
				out.flush(); // 类似于文件复制，将文件存储到输入流，再通过输出流写入到上传位置
			} // 这段代码也可以用IOUtils.copy(in, out)工具类的copy方法完成
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
