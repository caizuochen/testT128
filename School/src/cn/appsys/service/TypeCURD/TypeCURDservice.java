package cn.appsys.service.TypeCURD;

import java.util.List;

import cn.appsys.pojo.Type;

public interface TypeCURDservice {

	public List<Type> queryType();

	public Integer deleteType(Integer typeId);

	public Integer updateType(String typeName, Integer typeId);

	public Type queryTypeById(Integer typeId);

	public Integer addType(String typeName);

}
