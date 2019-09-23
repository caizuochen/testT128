package cn.appsys.service.DataDictionary;

import java.util.List;
import cn.appsys.pojo.DataDictionary;

public interface DataDictionaryService {

	public List<DataDictionary> queryData(String typeCode, String typeName);

	public DataDictionary queryDataById(Integer dataId);

	public Integer deleteData(Integer dateId);

	public Integer updateData(DataDictionary dataDictionary);

	public Integer addData(DataDictionary dataDictionary);
}
