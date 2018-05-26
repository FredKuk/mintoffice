package vo;

public class Employee {
	private String emp_no;
	private String id;
	private String pwd;
	private String name;
	private String dep_no;
	private String position_no;
	private String address;
	private String email;
	private String profile_pic;
	private String signature;
	private String join_date;
	private String retire_date;
	private int holiday_all;
	private int holiday_use;
	private int is_retire;
	private int is_manager;
	private String msg;
	
	public Employee() {
		super();
	}
	public Employee(String emp_no, String id, String pwd, String name, String dep_no, String position_no,
			String address, String email, String profile_pic, String signature, String join_date, String retire_date,
			int is_retire,String msg, int is_manager,int holiday_all, int holiday_use) {
		super();
		this.emp_no = emp_no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.dep_no = dep_no;
		this.position_no = position_no;
		this.address = address;
		this.email = email;
		this.profile_pic = profile_pic;
		this.signature = signature;
		this.join_date = join_date;
		this.retire_date = retire_date;
		this.holiday_all = holiday_all;
		this.holiday_use = holiday_use;
		this.is_retire = is_retire;
		this.is_manager = is_manager;
		this.msg = msg;
	}


	@Override
	public String toString() {
		return "Employee [emp_no=" + emp_no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", dep_no=" + dep_no
				+ ", position_no=" + position_no + ", address=" + address + ", email=" + email + ", profile_pic="
				+ profile_pic + ", signature=" + signature + ", join_date=" + join_date + ", retire_date=" + retire_date
				+ ", holiday_all=" + holiday_all + ", holiday_use=" + holiday_use + ", is_retire=" + is_retire
				+ ", is_manager=" + is_manager + ", msg=" + msg + "]";
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDep_no() {
		return dep_no;
	}
	public void setDep_no(String dep_no) {
		this.dep_no = dep_no;
	}
	public String getPosition_no() {
		return position_no;
	}
	public void setPosition_no(String position_no) {
		this.position_no = position_no;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfile_pic() {
		return profile_pic;
	}
	public void setProfile_pic(String profile_pic) {
		this.profile_pic = profile_pic;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
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
	public int getHoliday_all() {
		return holiday_all;
	}
	public void setHoliday_all(int holiday_all) {
		this.holiday_all = holiday_all;
	}
	public int getHoliday_use() {
		return holiday_use;
	}
	public void setHoliday_use(int holiday_use) {
		this.holiday_use = holiday_use;
	}
	public int getIs_retire() {
		return is_retire;
	}
	public void setIs_retire(int is_retire) {
		this.is_retire = is_retire;
	}
	public int getIs_manager() {
		return is_manager;
	}
	public void setIs_manager(int is_manager) {
		this.is_manager = is_manager;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
