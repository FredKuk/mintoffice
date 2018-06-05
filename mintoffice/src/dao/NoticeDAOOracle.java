package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.NReply;
import vo.Notice;

public class NoticeDAOOracle implements Dao {

	private static  volatile NoticeDAOOracle noticeDAOOracle;
	
	private NoticeDAOOracle(){
	}
	
	public static NoticeDAOOracle getInstance(){
		if(noticeDAOOracle==null){
			synchronized (NoticeDAOOracle.class){
				if(noticeDAOOracle==null){
					noticeDAOOracle=new NoticeDAOOracle();
				}
			}
		}
		return noticeDAOOracle;
	}

	public void insert(Notice n) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		try {
			con = MyConnection.getConnection();
			String insertSQL = "INSERT INTO NOTICE (noti_no,emp_no,noti_title,noti_contents,noti_date,noti_clicks)\r\n" + 
								"VALUES(NOTI_SEQ.nextval,?,?,?,SYSDATE,0)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, n.getEmp_no());
			pstmt.setString(2, n.getNoti_title());
			pstmt.setString(3, n.getNoti_contents());
			System.out.println("here");
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				System.out.println("notice insert error");
				throw new Exception("Error! insert Notice");
			}else {
				System.out.println("notice insert error");
				throw e;
			}
		}finally {
			MyConnection.close(pstmt, con);
		}
	}
	
	public void modify(Notice n) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String modSQL="UPDATE notice\r\n" + 
				"SET\r\n" + 
				"noti_title = ?,\r\n"+ 
				"noti_contents = ?\r\n"+ 
				"WHERE noti_no=?";
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(modSQL);
			pstmt.setString(1, n.getNoti_title());
			pstmt.setString(2, n.getNoti_contents());
			pstmt.setString(3, n.getNoti_no());
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);
		}
	}
	
	public void delete(String no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String delSQL="DELETE FROM notice\r\n" + 
					  "WHERE noti_no = ?";
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(delSQL);
			pstmt.setString(1, no);
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);
		}
	}
	
	public int count() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectCountSQL = 
				"SELECT COUNT(*) totalcnt\r\n" + 
				"FROM    notice";
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(selectCountSQL);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalcnt");
			return totalCount;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}
	
	public int searchCount(String search) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectCountSQL = 
				"SELECT COUNT(*) totalcnt\r\n" + 
				"FROM    notice\r\n" + 
				"WHERE   noti_title LIKE '%'||?||'%'";
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(selectCountSQL);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalcnt");
			return totalCount;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}
	
	public Notice findByNo(String noti_no) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectCountSQL = 
				"SELECT *\r\n" + 
				"FROM    notice\r\n"+
				"WHERE	noti_no=?";
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(selectCountSQL);	
			pstmt.setString(1, noti_no);	
			rs = pstmt.executeQuery();	
			rs.next();	
			Notice n = new Notice(
					rs.getString("noti_no"),
					rs.getString("emp_no"),
					rs.getString("noti_title"),
					rs.getString("noti_contents"),
					rs.getString("noti_date"),
					rs.getInt("noti_clicks")
					);
			pstmt.close();
			rs.close();
			String countUpSQL="UPDATE notice\r\n" + 
								"SET\r\n" + 
								"noti_clicks = noti_clicks+1\r\n"+ 
								"WHERE noti_no=?";
			pstmt = con.prepareStatement(countUpSQL);
			pstmt.setString(1, noti_no);
			pstmt.executeUpdate();
			return n;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}
	public List<Notice> findAll(int intPage) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String selectAllSQL=
				"SELECT  b.*\r\n" + 
				"FROM (SELECT ROWNUM r, a.* \r\n" + 
				"      FROM (SELECT n.noti_no,e.id, n.noti_title, n.noti_contents, to_char(n.noti_date,'YYYY-MM-DD') noti_date, n.noti_clicks \r\n" + 
				"            FROM notice n, employee e\r\n" + 
				"            WHERE n.emp_no=e.emp_no\r\n" + 
				"		    ORDER BY n.noti_date desc) a \r\n" + 
				"      ) b \r\n" + 
				"WHERE r BETWEEN  ? AND ?";
		
		List<Notice> list = new ArrayList<>();
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(selectAllSQL);
			int cntPerPage=13;//1페이지별 3건씩 보여준다
			int endRow=cntPerPage * intPage;
			int startRow=endRow-cntPerPage+1; 	
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString("noti_title");
				title = title.length()>40? title.substring(0,38)+"..." : title;
				list.add(new Notice(
						rs.getString("noti_no"),
						rs.getString("id"),
						title,
						null,
						rs.getString("noti_date"),
						rs.getInt("noti_clicks")
						));
			}
			return list;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}	
	public List<Notice> searchFindAll(int intPage,String search) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String selectAllSQL=
				"SELECT  b.*\r\n" + 
				"FROM (SELECT ROWNUM r, a.* \r\n" + 
				"      FROM (SELECT n.noti_no,e.id, n.noti_title, n.noti_contents, to_char(n.noti_date,'YYYY-MM-DD') noti_date, n.noti_clicks \r\n" + 
				"            FROM notice n, employee e\r\n" + 
				"            WHERE n.emp_no=e.emp_no\r\n" + 
				"            AND   noti_title LIKE '%'||?||'%'\r\n" + 
				"		    ORDER BY n.noti_date desc) a \r\n" + 
				"      ) b \r\n" + 
				"WHERE r BETWEEN  ? AND ?";
		
		List<Notice> list = new ArrayList<>();
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(selectAllSQL);
			int cntPerPage=13;//1페이지별 3건씩 보여준다
			int endRow=cntPerPage * intPage;
			int startRow=endRow-cntPerPage+1; 	
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString("noti_title");
				title = title.length()>40? title.substring(0,38)+"..." : title;
				list.add(new Notice(
						rs.getString("noti_no"),
						rs.getString("id"),
						title,
						null,
						rs.getString("noti_date"),
						rs.getInt("noti_clicks")
						));
			}
			return list;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}	
	public List<NReply> findAllReply(String noti_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String allReplySQL=
				"SELECT n.nr_no,n.noti_no,e.id,n.nr_contents,to_char(n.nr_date, 'YYYY-MM-DD HH24:MI:SS') nr_date\r\n" + 
				"FROM nreply n, employee e\r\n" + 
				"WHERE n.emp_no=e.emp_no\r\n" + 
				"AND n.noti_no=?\r\n" + 
				"ORDER BY n.nr_date";		
		List<NReply> list = new ArrayList<>();
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(allReplySQL);
			pstmt.setString(1, noti_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new NReply(
						rs.getString("nr_no"),
						rs.getString("noti_no"),
						rs.getString("id"),
						rs.getString("nr_contents"),
						rs.getString("nr_date")));				
			}
			return list;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}
	public void newReply(String noti_no, String emp_no,String contents) throws Exception{
		/*2)DB와 연결 */
		Connection con = null;
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		try {
			con = MyConnection.getConnection();
			String insertSQL = 
					"INSERT INTO nreply\r\n" + 
					"(nr_no,noti_no,emp_no,nr_contents,nr_date)\r\n" + 
					"VALUES\r\n" + 
					"(NR_SEQ.nextval,?,?,?,SYSDATE)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, noti_no);
			pstmt.setString(2, emp_no);
			pstmt.setString(3, contents);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				System.out.println("notice reply insert error");
				throw new Exception("Error! reply insert Notice");
			}else {
				System.out.println("notice reply insert error");
				throw e;
			}
		}finally {
			MyConnection.close(pstmt, con);
		}
	}
	public void delReply(String nr_no) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String delSQL="DELETE FROM nreply\r\n" + 
					  "WHERE nr_no = ?";
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(delSQL);
			pstmt.setString(1, nr_no);
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);
		}
	}
	
	public void modReply(String nr_no, String contents) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String modSQL="UPDATE nreply\r\n" + 
				"SET\r\n" + 
				"nr_contents = ?\r\n"+ 
				"WHERE nr_no=?";
		try {
			con = MyConnection.getConnection();
			pstmt = con.prepareStatement(modSQL);
			pstmt.setString(1, contents);
			pstmt.setString(2, nr_no);
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);
		}
	}
}
