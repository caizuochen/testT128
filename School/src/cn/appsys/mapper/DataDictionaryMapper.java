package cn.appsys.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.appsys.pojo.DataDictionary;

public interface DataDictionaryMapper {
	/**
	 * 查询字典里面的数据 如果查询全部传入 null
	 * @param typeCode
	 * @param typeName
	 * @return
	 */
	public List<DataDictionary> queryData(@Param("typeCode")String typeCode,@Param("typeName")String typeName);
	/**
	 * 根据id来查询数据字典中的数据
	 * @param dataId
	 * @return
	 */
	public DataDictionary queryDataById(@Param("id")Integer dataId);
	/**
	 * 删除一条数据字典数据
	 * @param dateId
	 * @return
	 */
	public Integer deleteData(@Param("id")Integer dateId);
	/**
	 * 修改数据字典
	 * @param dataDictionary
	 * @return
	 */
	public Integer updateData(DataDictionary dataDictionary);
	/**
	 * 添加数据字典
	 * @param dataDictionary
	 * @return
	 */
	public Integer addData(DataDictionary dataDictionary);
}
