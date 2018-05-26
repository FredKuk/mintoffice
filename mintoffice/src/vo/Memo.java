package vo;

public class Memo {

	private String memo_no;
	private String emp_no;
	private String memo_date;
	private String memo_contents;
	
	@Override
	public String toString() {
		return "Memo [memo_no=" + memo_no + ", emp_no=" + emp_no + ", memo_date=" + memo_date + ", memo_contents="
				+ memo_contents + "]";
	}
	
	public Memo() {
		super();
	}
	
	public Memo(String memo_no, String emp_no, String memo_date, String memo_contents) {
		super();
		this.memo_no = memo_no;
		this.emp_no = emp_no;
		this.memo_date = memo_date;
		this.memo_contents = memo_contents;
	}
	
	public String getMemo_no() {
		return memo_no;
	}
	public void setMemo_no(String memo_no) {
		this.memo_no = memo_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getMemo_date() {
		return memo_date;
	}
	public void setMemo_date(String memo_date) {
		this.memo_date = memo_date;
	}
	public String getMemo_contents() {
		return memo_contents;
	}
	public void setMemo_contents(String memo_contents) {
		this.memo_contents = memo_contents;
	}
}
