package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import sql.MyConnection;
import vo.Commute;

public class CommuteDAOOracle implements CommuteDAO {

	@Override
	public String isWork(String emp_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		/*4)DB서버로 부터 결과 수신*/
		ResultSet rs=null;
		
		try {
			con = MyConnection.getConnection();
			String isWorkSQL = "SELECT  com_no\r\n" + 
								"FROM    COMMUTE\r\n" + 
								"WHERE   emp_no=?\r\n" + 
								"AND     TO_CHAR(com_start,'YYYYMMDD')=TO_CHAR(SYSDATE,'YYYYMMDD')\r\n" + 
								"AND     com_end IS NULL";
			pstmt = con.prepareStatement(isWorkSQL);
			pstmt.setString(1, emp_no);
			rs = pstmt.executeQuery();
			if(!rs.next()) { //no commute data 
				return null;
			}else {
				return rs.getString("com_no");
			}
		} catch (SQLException e) {
			e.printStackTrace(); //톰캣콘솔
			throw e;			
		} finally {	
			MyConnection.close(rs, pstmt, con);			
		}
	}

	@Override
	public void arrive(String emp_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		
		/*4)is Late? */
	    int nowTime=Integer.parseInt(new SimpleDateFormat("kkmmss").format(new Date()));
	    String isLate= nowTime>91000? "1":"0";
	    
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "INSERT INTO COMMUTE(com_no,emp_no,com_start,com_end,com_late,com_sick)\r\n" + 
								"VALUES(COM_SEQ.nextval,?,sysdate,NULL,?,'0')";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, emp_no);
			pstmt.setString(2, isLate);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! insert arrive");
			}else {
				throw e;
			}
		}finally {
			MyConnection.close(pstmt, con);
		}
	}

	@Override
	public void gohome(String com_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
	    
		try {
			con = MyConnection.getConnection();
			String modSQL = "UPDATE COMMUTE\r\n" + 
					"SET\r\n" + 
					"com_end = sysdate\r\n" + 
					"WHERE com_no=?";
			pstmt = con.prepareStatement(modSQL);
			pstmt.setString(1, com_no);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! gohome");
			}else {
				throw e;
			}
		}finally {
			MyConnection.close(pstmt, con);
		}
	}

	@Override
	public String isOut(String emp_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		/*4)DB서버로 부터 결과 수신*/
		ResultSet rs=null;
		
		try {
			con = MyConnection.getConnection();
			String isOutSQL = "SELECT  out_no\r\n" + 
								"FROM    OUTWORK\r\n" + 
								"WHERE   emp_no=?\r\n" + 
								"AND     TO_CHAR(out_start,'YYYYMMDD')=TO_CHAR(SYSDATE,'YYYYMMDD')\r\n" + 
								"AND     out_end IS NULL";
			pstmt = con.prepareStatement(isOutSQL);
			pstmt.setString(1, emp_no);
			rs = pstmt.executeQuery();
			if(!rs.next()) { //no commute data 
				return null;
			}else {
				return rs.getString("out_no");
			}
		} catch (SQLException e) {
			e.printStackTrace(); //톰캣콘솔
			throw e;			
		} finally {	
			MyConnection.close(rs, pstmt, con);			
		}
	}
	
	@Override
	public void goout(String emp_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
			    
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "INSERT INTO OUTWORK(out_no,emp_no,out_start,out_end)\r\n" + 
								"VALUES(OUT_SEQ.nextval,?,sysdate,NULL)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, emp_no);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! goOut");
			}else {
				throw e;
			}
		}finally {
			MyConnection.close(pstmt, con);
		}
	}

	@Override
	public void comeback(String out_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
	    
		try {
			con = MyConnection.getConnection();
			String modSQL = "UPDATE OUTWORK\r\n" + 
							"SET\r\n" + 
							"out_end = sysdate\r\n" + 
							"WHERE out_no=?";
			pstmt = con.prepareStatement(modSQL);
			pstmt.setString(1, out_no);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! gohome");
			}else {
				throw e;
			}
		}finally {
			MyConnection.close(pstmt, con);
		}
	}

	@Override
	public void illness(String com_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
	    
		try {
			con = MyConnection.getConnection();
			String modSQL = "UPDATE COMMUTE\r\n" + 
							"SET\r\n" + 
							"com_end = sysdate,\r\n" + 
							"com_sick='1'\r\n" + 
							"WHERE com_no=?";
			pstmt = con.prepareStatement(modSQL);
			pstmt.setString(1, com_no);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! illness");
			}else {
				throw e;
			}
		}finally {
			MyConnection.close(pstmt, con);
		}
	}
	@Override
	public List<Commute> showCommute(String emp_no) throws Exception {
		List<Commute> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String showcSQL ="SELECT  com_no,emp_no,com_start,com_end,com_late,com_sick,TO_CHAR(com_start,'HH24:MI:SS') com_sTime, TO_CHAR(com_end,'HH24:MI:SS') com_eTime,(TO_CHAR(com_start,'YYMMDD')||'1759') com_isET,(TO_CHAR(SYSDATE,'YYMMDDHH24MI')) com_endD\r\n" + 
							"FROM    COMMUTE \r\n" + 
							"WHERE   emp_no=?";
			pstmt = con.prepareStatement(showcSQL);
			pstmt.setString(1, emp_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int isET=Integer.parseInt(rs.getString("com_isET"));
				int endD=Integer.parseInt(rs.getString("com_endD"));
				String com_early="";
				if(isET<endD) {
					com_early="0";
				}else {
					com_early="1";
				}
				list.add(new Commute(
						rs.getString("com_no"),
						rs.getString("emp_no"),
						rs.getString("com_start"),
						rs.getString("com_end"),
						rs.getString("com_late"),
						rs.getString("com_sick"),
						rs.getString("com_sTime"),
						rs.getString("com_eTime"),
						com_early
				));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}
	/*@Override
	public List<Commute> showCommute(String emp_no) throws Exception {
		List<Commute> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String showcSQL ="SELECT  com_no,emp_no,com_start,com_end,com_late,com_sick\r\n" + 
							 "FROM    COMMUTE\r\n" + 
							 "WHERE   emp_no=?";
			pstmt = con.prepareStatement(showcSQL);
			pstmt.setString(1, emp_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Commute(
						rs.getString("com_no"),
						rs.getString("emp_no"),
						rs.getString("com_start"),
						rs.getString("com_end"),
						rs.getString("com_late"),
						rs.getString("com_sick")
				));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}*/

}
