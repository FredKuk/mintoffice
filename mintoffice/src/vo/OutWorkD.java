package vo;

public class OutWorkD {
	private String out_no;
	private String emp_no;
	private String out_start;
	private String out_end;
	private String odStart;
	private String odEnd;
	private String compare;
	
	
	@Override
	public String toString() {
		return "OutWorkD [out_no=" + out_no + ", emp_no=" + emp_no + ", out_start=" + out_start + ", out_end=" + out_end
				+ ", odStart=" + odStart + ", odEnd=" + odEnd + ", compare=" + compare + "]";
	}
	public OutWorkD() {
		super();
	}
	public OutWorkD(String out_no, String emp_no, String out_start, String out_end, String odStart, String odEnd,
			String compare) {
		super();
		this.out_no = out_no;
		this.emp_no = emp_no;
		this.out_start = out_start;
		this.out_end = out_end;
		this.odStart = odStart;
		this.odEnd = odEnd;
		this.compare = compare;
	}
	public String getOut_no() {
		return out_no;
	}
	public void setOut_no(String out_no) {
		this.out_no = out_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getOut_start() {
		return out_start;
	}
	public void setOut_start(String out_start) {
		this.out_start = out_start;
	}
	public String getOut_end() {
		return out_end;
	}
	public void setOut_end(String out_end) {
		this.out_end = out_end;
	}
	public String getOdStart() {
		return odStart;
	}
	public void setOdStart(String odStart) {
		this.odStart = odStart;
	}
	public String getOdEnd() {
		return odEnd;
	}
	public void setOdEnd(String odEnd) {
		this.odEnd = odEnd;
	}
	public String getCompare() {
		return compare;
	}
	public void setCompare(String compare) {
		this.compare = compare;
	}
	
}
