package cn.appsys.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.appsys.pojo.Type;

public interface TypeCURDMapper {
	/**
	 * ��ѯ���е��û�����
	 * @return
	 */
	public List<Type> queryType();
	/**
	 * ���ݽ�ɫid����ѯ�����޸ĵ�ѧ����Ϣ
	 * @param tpeeId
	 * @return
	 */
	public Type queryTypeById(@Param("id")Integer typeId);
	/**
	 * ���ݽ�ɫid��ɾ����ɫ
	 * @param typeId
	 * @return
	 */
	public Integer deleteType(@Param("id")Integer typeId);
	/**
	 * ���ݽ�ɫid���޸Ľ�ɫ����
	 * @param typeName
	 * @param typeId
	 * @return
	 */
	public Integer updateType(@Param("typeName")String typeName,@Param("id")Integer typeId);
	/**
	 * ���һ����ɫ��Ϣ
	 * @param typeName
	 * @return
	 */
	public Integer addType(@Param("typeName")String typeName);
}
