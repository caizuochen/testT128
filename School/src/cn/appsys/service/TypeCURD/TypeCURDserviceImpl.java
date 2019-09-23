package cn.appsys.service.TypeCURD;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.appsys.mapper.TypeCURDMapper;
import cn.appsys.pojo.Type;

@Service("TypeCURDservice")
public class TypeCURDserviceImpl implements TypeCURDservice {

	@Resource
	private TypeCURDMapper typeCURDMapper;

	@Override
	public List<Type> queryType() {
		return typeCURDMapper.queryType();
	}

	@Override
	public Integer deleteType(Integer typeId) {
		return typeCURDMapper.deleteType(typeId);
	}

	@Override
	public Integer updateType(String typeName, Integer typeId) {
		return typeCURDMapper.updateType(typeName, typeId);
	}

	@Override
	public Type queryTypeById(Integer typeId) {
		return typeCURDMapper.queryTypeById(typeId);
	}

	@Override
	public Integer addType(String typeName) {
		return typeCURDMapper.addType(typeName);
	}

}
