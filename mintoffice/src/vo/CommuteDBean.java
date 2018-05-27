package vo;

public class CommuteDBean {
	private String date;
	private String start;
	private String end;
	private String late;
	private String early;
	private String sick;
	private String overwork;
	private String oStart;
	private String oEnd;
	
	
	
	@Override
	public String toString() {
		return "CommuteDBean [date=" + date + ", start=" + start + ", end=" + end + ", late=" + late + ", early="
				+ early + ", sick=" + sick + ", overwork=" + overwork + ", oStart=" + oStart + ", oEnd=" + oEnd + "]";
	}
	public CommuteDBean() {
		super();
	}
	public CommuteDBean(String date, String start, String end, String late, String early, String sick, String overwork,
			String oStart, String oEnd) {
		super();
		this.date = date;
		this.start = start;
		this.end = end;
		this.late = late;
		this.early = early;
		this.sick = sick;
		this.overwork = overwork;
		this.oStart = oStart;
		this.oEnd = oEnd;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getLate() {
		return late;
	}
	public void setLate(String late) {
		this.late = late;
	}
	public String getEarly() {
		return early;
	}
	public void setEarly(String early) {
		this.early = early;
	}
	public String getSick() {
		return sick;
	}
	public void setSick(String sick) {
		this.sick = sick;
	}
	public String getOverwork() {
		return overwork;
	}
	public void setOverwork(String overwork) {
		this.overwork = overwork;
	}
	public String getoStart() {
		return oStart;
	}
	public void setoStart(String oStart) {
		this.oStart = oStart;
	}
	public String getoEnd() {
		return oEnd;
	}
	public void setoEnd(String oEnd) {
		this.oEnd = oEnd;
	}
	
	
	
	//날짜	정상출근	출근시간	퇴근시간	초과시간	외근시간	복귀시간	병가여부	조퇴여부
}
