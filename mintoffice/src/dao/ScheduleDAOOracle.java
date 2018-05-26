package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Schedule;

public class ScheduleDAOOracle implements ScheduleDAO {

	@Override
	public void insert(Schedule s) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "INSERT INTO SCHEDULE(schedule_no,emp_no,schedule_title,schedule_place,schedule_start,schedule_end,schedule_contents,schedule_kind)"
					+ " VALUES (SCHEDULE_SEQ.nextval,?,?,?,to_date(?,'YYYY-MM-DD HH24:MI'),to_date(?,'YYYY-MM-DD HH24:MI'),?,?)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, s.getEmp_no());
			pstmt.setString(2, s.getSchedule_title());
			pstmt.setString(3, s.getSchedule_place());
			pstmt.setString(4, s.getSchedule_start());
			pstmt.setString(5, s.getSchedule_end());
			pstmt.setString(6, s.getSchedule_contents());
			pstmt.setString(7, s.getSchedule_kind());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! insert Schedule");
			}else {
				throw e;
			}
		}finally {
			sql.MyConnection.close(pstmt, con);
		}
	}

	@Override
	public List<Schedule> showps(String emp_no) throws Exception{
		List<Schedule> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String showpsSQL ="SELECT  schedule_no,emp_no,schedule_title,schedule_place,to_char(schedule_start,'YYYY-MM-DD') stdate,to_char(schedule_start,'HH24:MI:SS') sthour,to_char(schedule_end,'YYYY-MM-DD') enddate,to_char(schedule_end,'HH24:MI:SS') endhour,schedule_contents,schedule_kind\r\n" + 
								"FROM    SCHEDULE\r\n" + 
								"WHERE   EMP_NO=?";
			pstmt = con.prepareStatement(showpsSQL);
			pstmt.setString(1, emp_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String schedule_start=rs.getString("stdate")+"T"+rs.getString("sthour");
				String schedule_end=rs.getString("enddate")+"T"+rs.getString("endhour");
				list.add(new Schedule(
						rs.getString("schedule_no"),
						rs.getString("emp_no"),
						rs.getString("schedule_title"),
						rs.getString("schedule_place"),
						schedule_start,
						schedule_end,
						rs.getString("schedule_contents"),
						rs.getString("schedule_kind")
				));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public List<Schedule> showts(String emp_no) throws Exception{
		List<Schedule> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String showtsSQL ="SELECT  s.schedule_no, s.emp_no, s.schedule_title, s.schedule_place ,to_char(s.schedule_start,'YYYY-MM-DD') stdate, to_char(s.schedule_start,'HH24:MI:SS') sthour, to_char(s.schedule_end,'YYYY-MM-DD') enddate, to_char(s.schedule_end,'HH24:MI:SS') endhour, s.schedule_contents, s.schedule_kind\r\n" + 
					"FROM    SCHEDULE s, EMPLOYEE e\r\n" + 
					"WHERE   s.emp_no=e.emp_no\r\n" + 
					"AND     s.schedule_kind=1\r\n" + 
					"AND     e.dep_no=(SELECT dep_no FROM EMPLOYEE WHERE emp_no=?)";
			pstmt = con.prepareStatement(showtsSQL);
			pstmt.setString(1, emp_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String schedule_start=rs.getString("stdate")+"T"+rs.getString("sthour");
				String schedule_end=rs.getString("enddate")+"T"+rs.getString("endhour");
				list.add(new Schedule(
						rs.getString("schedule_no"),
						rs.getString("emp_no"),
						rs.getString("schedule_title"),
						rs.getString("schedule_place"),
						schedule_start,
						schedule_end,
						rs.getString("schedule_contents"),
						rs.getString("schedule_kind")
				));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public List<Schedule> showcs() throws Exception{
		List<Schedule> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String showcsSQL ="SELECT  schedule_no, emp_no, schedule_title, schedule_place ,to_char(schedule_start,'YYYY-MM-DD') stdate, to_char(schedule_start,'HH24:MI:SS') sthour, to_char(schedule_end,'YYYY-MM-DD') enddate, to_char(schedule_end,'HH24:MI:SS') endhour, schedule_contents, schedule_kind\r\n" + 
								"FROM    SCHEDULE\r\n" + 
								"WHERE   schedule_kind=2";
			pstmt = con.prepareStatement(showcsSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String schedule_start=rs.getString("stdate")+"T"+rs.getString("sthour");
				String schedule_end=rs.getString("enddate")+"T"+rs.getString("endhour");
				list.add(new Schedule(
						rs.getString("schedule_no"),
						rs.getString("emp_no"),
						rs.getString("schedule_title"),
						rs.getString("schedule_place"),
						schedule_start,
						schedule_end,
						rs.getString("schedule_contents"),
						rs.getString("schedule_kind")
				));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public void modify(Schedule s) throws Exception{
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "UPDATE SCHEDULE\r\n" + 
					"SET \r\n" + 
					"SCHEDULE_START = to_date(?,'YYYY-MM-DD HH24:MI'),\r\n" + 
					"SCHEDULE_END =to_date(?,'YYYY-MM-DD HH24:MI'),\r\n" + 
					"SCHEDULE_CONTENTS=?,\r\n" + 
					"SCHEDULE_TITLE=?,\r\n" + 
					"SCHEDULE_PLACE=?\r\n" + 
					"WHERE schedule_no= ?";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, s.getSchedule_start());
			pstmt.setString(2, s.getSchedule_end());
			pstmt.setString(3, s.getSchedule_contents());
			pstmt.setString(4, s.getSchedule_title());
			pstmt.setString(5, s.getSchedule_place());
			pstmt.setString(6, s.getSchedule_no());
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! Modify Schedule");
			}else {
				throw e;
			}
		}finally {
			sql.MyConnection.close(pstmt, con);
		}
	}

	@Override
	public void delete(String schedule_no) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		try {
			con = sql.MyConnection.getConnection();
			String deleteSQL = "DELETE FROM SCHEDULE\r\n" + 
								"WHERE schedule_no = ?";
			pstmt = con.prepareStatement(deleteSQL);
			pstmt.setString(1, schedule_no);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			if(e.getErrorCode()==1) { 
				throw new Exception("Error! Delete Schedule");
			}else {
				throw e;
			}
		}finally {
			sql.MyConnection.close(pstmt, con);
		}
	}

}
