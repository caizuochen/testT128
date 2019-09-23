package cn.appsys.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.appsys.pojo.Type;

public interface TypeCURDMapper {
	/**
	 * 查询所有的用户类型
	 * @return
	 */
	public List<Type> queryType();
	/**
	 * 根据角色id来查询即将修改的学生信息
	 * @param tpeeId
	 * @return
	 */
	public Type queryTypeById(@Param("id")Integer typeId);
	/**
	 * 根据角色id来删除角色
	 * @param typeId
	 * @return
	 */
	public Integer deleteType(@Param("id")Integer typeId);
	/**
	 * 根据角色id来修改角色名称
	 * @param typeName
	 * @param typeId
	 * @return
	 */
	public Integer updateType(@Param("typeName")String typeName,@Param("id")Integer typeId);
	/**
	 * 添加一条角色信息
	 * @param typeName
	 * @return
	 */
	public Integer addType(@Param("typeName")String typeName);
}
