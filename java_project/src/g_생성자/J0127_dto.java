package g_생성자;

public class J0127_dto {
	String id, name, area;
	int age;
	public J0127_dto(String id, String name, String area, int age) {
		this.id = id;
		this.name = name;
		this.area = area;
		this.age = age;
	}
	public J0127_dto(String id) {
		this.id = id;
	}
	public J0127_dto() {}
	public J0127_dto(int age, String id, String name, String area) {
		this.age = age;
		this.id = id;
		this.name = name;
		this.area = area;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	

	
	
}
