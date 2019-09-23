package cn.appsys.pojo;

public class Dorm {
	private Integer id;
	private String dormName;
	private Integer livepeople;
	private Integer canlivepeople;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDormName() {
		return dormName;
	}
	public void setDormName(String dormName) {
		this.dormName = dormName;
	}
	public Integer getLivepeople() {
		return livepeople;
	}
	public void setLivepeople(Integer livepeople) {
		this.livepeople = livepeople;
	}
	public Integer getCanlivepeople() {
		return canlivepeople;
	}
	public void setCanlivepeople(Integer canlivepeople) {
		this.canlivepeople = canlivepeople;
	}

}
