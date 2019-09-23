package cn.appsys.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.appsys.pojo.DataDictionary;

public interface DataDictionaryMapper {
	/**
	 * ��ѯ�ֵ���������� �����ѯȫ������ null
	 * @param typeCode
	 * @param typeName
	 * @return
	 */
	public List<DataDictionary> queryData(@Param("typeCode")String typeCode,@Param("typeName")String typeName);
	/**
	 * ����id����ѯ�����ֵ��е�����
	 * @param dataId
	 * @return
	 */
	public DataDictionary queryDataById(@Param("id")Integer dataId);
	/**
	 * ɾ��һ�������ֵ�����
	 * @param dateId
	 * @return
	 */
	public Integer deleteData(@Param("id")Integer dateId);
	/**
	 * �޸������ֵ�
	 * @param dataDictionary
	 * @return
	 */
	public Integer updateData(DataDictionary dataDictionary);
	/**
	 * ��������ֵ�
	 * @param dataDictionary
	 * @return
	 */
	public Integer addData(DataDictionary dataDictionary);
}
