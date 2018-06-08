package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Board;

public class FileDAOOracle implements FileDAOO {

	@Override
	public List<Board> selectByAll(int page) throws Exception {
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String selectAllSQL = 
				"select X.rnum, X.board_seq, X.board_subject, X.board_contents, X.board_date\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"from ( \r\n" + 
				"\r\n" + 
				"    select rownum as rnum, A.board_seq, A.board_subject, A.board_contents, A.board_date\r\n" + 
				"\r\n" + 
				"    from (\r\n" + 
				"\r\n" + 
				"        select a.board_subject, a.board_contents, a.board_date, a.board_seq\r\n" + 
				"\r\n" + 
				"        from repboard a\r\n" + 
				"\r\n" + 
				"        order by board_seq) A\r\n" + 
				"\r\n" + 
				"    where rownum <= ?) X\r\n" + 
				"\r\n" + 
				"where X.rnum >= ?";
		List<Board> list = new ArrayList<>();
		try {
		con = MyConnection.getConnection();
		pstmt = con.prepareStatement(selectAllSQL);
		int cntPerPage = 6; //1페이지별 6건씩 보여준다
		int endRow = cntPerPage * page;
		int startRow = endRow-cntPerPage+1;
/*		String page = request.getParameter("page");	//페이지값 가져오기
		int intPage=1;
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		int startPage = (intPage - 1) * cntPerPage + 1;
		int endPage = intPage * cntPerPage;*/
		pstmt.setInt(1, endRow);
		pstmt.setInt(2, startRow);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			list.add(new Board(
					rs.getInt("board_seq"), rs.getString("board_subject"), 
					rs.getString("board_contents"), rs.getString("board_date")));

		}
			return list;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		
	}

	//제목검색
	@Override
	public List<Board> selectBySubject(String searchSubject) throws Exception {
		List<Board> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("제목 : " + searchSubject);
		try {
			con = MyConnection.getConnection();
			String selectBySubjectSQL = "select board_seq, BOARD_SUBJECT, BOARD_CONTENTS, BOARD_DATE\r\n" + 
					"from REPBOARD\r\n" + 
					"where BOARD_SUBJECT=?";
			pstmt = con.prepareStatement(selectBySubjectSQL);
			pstmt.setString(1, searchSubject);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Board(rs.getInt("board_seq"), rs.getString("board_subject"), 
						rs.getString("board_contents"), rs.getString("board_date")));
			System.out.println(rs.getInt("board_seq"));
			System.out.println(rs.getString("board_subject"));
			System.out.println(rs.getString("board_contents"));
			System.out.println(rs.getString("board_date"));
			}
			
		}finally {
			MyConnection.close(rs,pstmt, con);
		}
		
		return list;
	}

	@Override
	public List<Board> selectByCalendar(String searchCalendar) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCount() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectCountSQL = "SELECT COUNT(*) totalcnt FROM repboard";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectCountSQL);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalcnt");
			System.out.println(totalCount);
			return totalCount;
			
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public void insertFileBoard(Board board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String insertFileBoardSQL = "INSERT INTO repboard (board_subject, board_contents, board_date, board_seq) values (?, ?, sysdate, board_seq.nextval)";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(insertFileBoardSQL);
			pstmt.setString(1, board.getBoard_subject());
			pstmt.setString(2, board.getBoard_contents());
			pstmt.executeQuery();
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public List<Board> selectByAll() throws Exception {
		List<Board> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		con = sql.MyConnection.getConnection();
		String selectAllSQL = "select board_seq, BOARD_SUBJECT, BOARD_CONTENTS, BOARD_DATE\r\n" + 
				"from REPBOARD";
		pstmt = con.prepareStatement(selectAllSQL);
		rs = pstmt.executeQuery();
			while(rs.next()) {
			System.out.println("파일 전체 검색");
			list.add(new Board(
					rs.getInt("board_seq"), rs.getString("board_subject"), 
					rs.getString("board_contents"), rs.getString("board_date")));
			System.out.println(rs.getInt("board_seq"));
			System.out.println(rs.getString("board_subject"));
			System.out.println(rs.getString("board_contents"));
			System.out.println(rs.getString("board_date"));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

}
