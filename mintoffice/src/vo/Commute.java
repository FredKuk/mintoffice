package vo;

public class Commute {

	private String com_no;
	private String emp_no;
	private String com_start;
	private String com_end;
	private String com_late;
	private String com_sick;
	private String com_sTime;
	private String com_eTime;
	private	String com_early;
	
	public Commute() {
		super();
	}
	public Commute(String com_no, String emp_no, String com_start, String com_end, String com_late, String com_sick,String com_sTime,String com_eTime,String com_early) {
		super();
		this.com_no = com_no;
		this.emp_no = emp_no;
		this.com_start = com_start;
		this.com_end = com_end;
		this.com_late = com_late;
		this.com_sick = com_sick;
		this.com_sTime= com_sTime;
		this.com_eTime=com_eTime;
		this.com_early=com_early;
	}
	
	public String getCom_sTime() {
		return com_sTime;
	}
	public void setCom_sTime(String com_sTime) {
		this.com_sTime = com_sTime;
	}
	public String getCom_eTime() {
		return com_eTime;
	}
	public void setCom_eTime(String com_eTime) {
		this.com_eTime = com_eTime;
	}
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getCom_start() {
		return com_start;
	}
	public void setCom_start(String com_start) {
		this.com_start = com_start;
	}
	public String getCom_end() {
		return com_end;
	}
	public void setCom_end(String com_end) {
		this.com_end = com_end;
	}
	public String getCom_late() {
		return com_late;
	}
	public void setCom_late(String com_late) {
		this.com_late = com_late;
	}
	public String getCom_sick() {
		return com_sick;
	}
	public void setCom_sick(String com_sick) {
		this.com_sick = com_sick;
	}
	public String getCom_early() {
		return com_early;
	}
	public void setCom_early(String com_early) {
		this.com_early = com_early;
	}
	
}
