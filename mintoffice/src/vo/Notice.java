package vo;

public class Notice {
	private String noti_no;
	private String emp_no;
	private String noti_title;
	private String noti_contents;
	private String noti_date;
	private int noti_clicks;
	
	
	public Notice() {
		super();
	}
	public Notice(String noti_no, String emp_no, String noti_title, String noti_contents, String noti_date,
			int noti_clicks) {
		super();
		this.noti_no = noti_no;
		this.emp_no = emp_no;
		this.noti_title = noti_title;
		this.noti_contents = noti_contents;
		this.noti_date = noti_date;
		this.noti_clicks = noti_clicks;
	}
	@Override
	public String toString() {
		return "Notice [noti_no=" + noti_no + ", emp_no=" + emp_no + ", noti_title=" + noti_title + ", noti_contents="
				+ noti_contents + ", noti_date=" + noti_date + ", noti_clicks=" + noti_clicks + "]";
	}
	public String getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(String noti_no) {
		this.noti_no = noti_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_contents() {
		return noti_contents;
	}
	public void setNoti_contents(String noti_contents) {
		this.noti_contents = noti_contents;
	}
	public String getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(String noti_date) {
		this.noti_date = noti_date;
	}
	public int getNoti_clicks() {
		return noti_clicks;
	}
	public void setNoti_clicks(int noti_clicks) {
		this.noti_clicks = noti_clicks;
	}

	
}
