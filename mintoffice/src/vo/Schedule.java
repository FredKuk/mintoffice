package vo;

public class Schedule {
	private String schedule_no;
	private String emp_no;
	private String schedule_title;
	private String schedule_place;
	private String schedule_start;
	private String schedule_end;
	private String schedule_contents;
	private String schedule_kind;
	
	
	public Schedule() {
		super();
	}

	public Schedule(String schedule_no, String emp_no, String schedule_title, String schedule_place,
			String schedule_start, String schedule_end, String schedule_contents, String schedule_kind) {
		super();
		this.schedule_no = schedule_no;
		this.emp_no = emp_no;
		this.schedule_title = schedule_title;
		this.schedule_place = schedule_place;
		this.schedule_start = schedule_start;
		this.schedule_end = schedule_end;
		this.schedule_contents = schedule_contents;
		this.schedule_kind = schedule_kind;
	}

	@Override
	public String toString() {
		return "Schedule [schedule_no=" + schedule_no + ", emp_no=" + emp_no + ", schedule_title=" + schedule_title
				+ ", schedule_place=" + schedule_place + ", schedule_start=" + schedule_start + ", schedule_end="
				+ schedule_end + ", schedule_contents=" + schedule_contents + ", schedule_kind=" + schedule_kind + "]";
	}
	
	public String getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(String schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getSchedule_title() {
		return schedule_title;
	}
	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}
	public String getSchedule_place() {
		return schedule_place;
	}
	public void setSchedule_place(String schedule_place) {
		this.schedule_place = schedule_place;
	}
	public String getSchedule_start() {
		return schedule_start;
	}
	public void setSchedule_start(String schedule_start) {
		this.schedule_start = schedule_start;
	}
	public String getSchedule_end() {
		return schedule_end;
	}
	public void setSchedule_end(String schedule_end) {
		this.schedule_end = schedule_end;
	}
	public String getSchedule_contents() {
		return schedule_contents;
	}
	public void setSchedule_contents(String schedule_contents) {
		this.schedule_contents = schedule_contents;
	}
	public String getSchedule_kind() {
		return schedule_kind;
	}
	public void setSchedule_kind(String schedule_kind) {
		this.schedule_kind = schedule_kind;
	}
	
	
}
