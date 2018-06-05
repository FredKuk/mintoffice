package vo;

public class NReply {
	private String nr_no; 
	private String noti_no;
	private String idValue;
	private String nr_contents;
	private String nr_date;
	
	public NReply() {
		super();
	}
	public NReply(String nr_no, String noti_no, String idValue, String nr_contents, String nr_date) {
		super();
		this.nr_no = nr_no;
		this.noti_no = noti_no;
		this.idValue = idValue;
		this.nr_contents = nr_contents;
		this.nr_date = nr_date;
	}
	@Override
	public String toString() {
		return "NReply [nr_no=" + nr_no + ", noti_no=" + noti_no + ", idValue=" + idValue + ", nr_contents=" + nr_contents
				+ ", nr_date=" + nr_date + "]";
	}
	public String getNr_no() {
		return nr_no;
	}
	public void setNr_no(String nr_no) {
		this.nr_no = nr_no;
	}
	public String getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(String noti_no) {
		this.noti_no = noti_no;
	}
	public String getIdValue() {
		return idValue;
	}
	public void setIdValue(String idValue) {
		this.idValue = idValue;
	}
	public String getNr_contents() {
		return nr_contents;
	}
	public void setNr_contents(String nr_contents) {
		this.nr_contents = nr_contents;
	}
	public String getNr_date() {
		return nr_date;
	}
	public void setNr_date(String nr_date) {
		this.nr_date = nr_date;
	}
	
	
}
