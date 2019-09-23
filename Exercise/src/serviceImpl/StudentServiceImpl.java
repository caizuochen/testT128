package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.StudentMapper;
import service.StudentService;
import utils.MyBatisUtil;

@Service
public class StudentServiceImpl extends MyBatisUtil implements StudentService {

	@Resource
	private StudentMapper studentMapper;
	
	public String selectClassInfoExplain(String name) {
		return studentMapper.selectClassInfoExplain(name);
	}
}
