package source;

public class LegisterVO {
	private String id;
	private String password;
	private String name;
	private String birthday;
	private String gender;
	
	public LegisterVO() {}
	
	public LegisterVO(String id, String password, String name, String birthday, String gender) {
		this.id=id;
		this.password=password;
		this.name=name;
		this.birthday=birthday;
		this.gender=gender;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "legisterVO [id=" + id + ", password=" + password + ", name=" + name + ", birthday=" + birthday
				+ ", gender=" + gender + "]";
	}	
	
	
}
