package vo;

public class OutWork {
	private String out_no;
	private String emp_no;
	private String out_start;
	private String out_end;
	
	@Override
	public String toString() {
		return "OutWork [out_no=" + out_no + ", emp_no=" + emp_no + ", out_start=" + out_start + ", out_end=" + out_end
				+ "]";
	}
	public OutWork() {
		super();
	}
	public OutWork(String out_no, String emp_no, String out_start, String out_end) {
		super();
		this.out_no = out_no;
		this.emp_no = emp_no;
		this.out_start = out_start;
		this.out_end = out_end;
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
	
	
}
