package g_생성자;

public class J0202_dto {
	String sabun, name, depart, rank;
	int salary;
	

	public J0202_dto(String sabun, String name, String depart, String rank, int salary) {
		super();
		this.sabun = sabun;
		this.name = name;
		this.depart = depart;
		this.rank = rank;
		this.salary= salary;
		
	}

	public String getSabun() {
		return sabun;
	}

	public String getName() {
		return name;
	}

	public String getDepart() {
		return depart;
	}

	public String getRank() {
		return rank;
	}

	public int getSalary() {
		return salary;
	}

}
