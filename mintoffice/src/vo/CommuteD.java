package vo;

public class CommuteD {
	private String com_no;
	private String emp_no;
	private String com_start;
	private String com_end;
	private String com_late;
	private String com_sick;
	private String com_early;
	private String overwork;
	private String dStart;
	private String dEnd;
	private	String compare;
	
	
	
	
	@Override
	public String toString() {
		return "CommuteD [com_no=" + com_no + ", emp_no=" + emp_no + ", com_start=" + com_start + ", com_end=" + com_end
				+ ", com_late=" + com_late + ", com_sick=" + com_sick + ", com_early=" + com_early + ", overwork="
				+ overwork + ", dStart=" + dStart + ", dEnd=" + dEnd + ", compare=" + compare + "]";
	}
	public CommuteD() {
		super();
	}
	public CommuteD(String com_no, String emp_no, String com_start, String com_end, String com_late, String com_sick,
			String com_early, String overwork, String dStart, String dEnd, String compare) {
		super();
		this.com_no = com_no;
		this.emp_no = emp_no;
		this.com_start = com_start;
		this.com_end = com_end;
		this.com_late = com_late;
		this.com_sick = com_sick;
		this.com_early = com_early;
		this.overwork = overwork;
		this.dStart = dStart;
		this.dEnd = dEnd;
		this.compare = compare;
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
	public String getOverwork() {
		return overwork;
	}
	public void setOverwork(String overwork) {
		this.overwork = overwork;
	}
	public String getdStart() {
		return dStart;
	}
	public void setdStart(String dStart) {
		this.dStart = dStart;
	}
	public String getdEnd() {
		return dEnd;
	}
	public void setdEnd(String dEnd) {
		this.dEnd = dEnd;
	}
	public String getCompare() {
		return compare;
	}
	public void setCompare(String compare) {
		this.compare = compare;
	}
	
}
