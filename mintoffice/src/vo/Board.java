package vo;

public class Board {
	private int board_seq;
	private int parent_seq;
	private String board_subject;
	private String board_writer;
	private String board_contents;
	private String board_date;
	private String board_password;
	private int board_viewcount;
	
	public Board(){
		super();
	}
	
	// 개인파일함
	public Board(int board_seq, int parent_seq, String board_subject, String board_writer, String board_contents, String board_date) {
		super();
		this.board_seq = board_seq;
		this.parent_seq = parent_seq;
		this.board_subject = board_subject;
		this.board_writer = board_writer;
		this.board_contents = board_contents;
		this.board_date = board_date;
	}
	
	// 검색
	public Board(int board_seq, String board_subject, String board_contents, String board_date) {
		super();
		this.board_seq = board_seq;
		this.board_subject = board_subject;
		this.board_contents = board_contents;
		this.board_date = board_date;
	}
	
	
	public Board(int board_seq, int parent_seq, String board_subject, String board_writer, String board_contents,
			String board_date, String board_password, int board_viewcount) {
		super();
		this.board_seq = board_seq;
		this.parent_seq = parent_seq;
		this.board_subject = board_subject;
		this.board_writer = board_writer;
		this.board_contents = board_contents;
		this.board_date = board_date;
		this.board_password = board_password;
		this.board_viewcount = board_viewcount;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_password() {
		return board_password;
	}
	public void setBoard_password(String board_password) {
		this.board_password = board_password;
	}
	public int getBoard_viewcount() {
		return board_viewcount;
	}
	public void setBoard_viewcount(int board_viewcount) {
		this.board_viewcount = board_viewcount;
	}
	
	
	

}
