package mapper;

public interface StudentMapper {
	/**
	 * 根据班级名称展示班级对应的信息
	 * @param name 班级的名称
	 * @return 班级对应的信息
	 */
	public String selectClassInfoExplain(String name);
}
