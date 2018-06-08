package vo;

public class Emp {
	private String emp_no;
	private String id;
	private String name;
	private String email;
	private String join_date;
	private String retire_date;
	private String msg;
	private String address;
	private Position position;
	private Department department;
	
	public Emp() {
		
	}
	//개인설정
	public Emp(String emp_no, String id, String name, String email, String msg, String address, Position position,
			Department department) {
		super();
		this.emp_no = emp_no;
		this.id = id;
		this.name = name;
		this.email = email;
		this.msg = msg;
		this.address = address;
		this.position = position;
		this.department = department;
	}
	
	//직원검색
	public Emp(String emp_no, String id, String name, Position position, Department department, String join_date, String retire_date, String msg,
			String email) {
		super();
		this.emp_no = emp_no;
		this.id = id;
		this.name = name;
		this.email = email;
		this.join_date = join_date;
		this.retire_date = retire_date;
		this.msg = msg;
		this.position = position;
		this.department = department;
	}
	

	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getRetire_date() {
		return retire_date;
	}
	public void setRetire_date(String retire_date) {
		this.retire_date = retire_date;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}



	

}
