package cn.appsys.service.DataDictionary;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.appsys.mapper.DataDictionaryMapper;
import cn.appsys.pojo.DataDictionary;

@Service("dataDictionaryService")
public class DataDictionaryServiceImpl implements DataDictionaryService {

	@Resource
	public DataDictionaryMapper dataDictionaryMapper;

	@Override
	public List<DataDictionary> queryData(String typeCode, String typeName) {
		return dataDictionaryMapper.queryData(typeCode, typeName);
	}

	@Override
	public DataDictionary queryDataById(Integer dataId) {
		return dataDictionaryMapper.queryDataById(dataId);
	}

	@Override
	public Integer deleteData(Integer dateId) {
		return dataDictionaryMapper.deleteData(dateId);
	}

	@Override
	public Integer updateData(DataDictionary dataDictionary) {
		return dataDictionaryMapper.updateData(dataDictionary);
	}

	@Override
	public Integer addData(DataDictionary dataDictionary) {
		return dataDictionaryMapper.addData(dataDictionary);
	}
}
