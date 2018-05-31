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
import vo.CommuteD;
import vo.CommuteDBean;
import vo.CommuteM;
import vo.OutWorkD;

public class CommuteDAOOracle implements Dao {
	private static  volatile CommuteDAOOracle commuteDAOOracle;
		
	private CommuteDAOOracle(){
	}
	
	public static CommuteDAOOracle getInstance(){
		if(commuteDAOOracle==null){
			synchronized (CommuteDAOOracle.class){
				if(commuteDAOOracle==null){
					commuteDAOOracle=new CommuteDAOOracle();
				}
			}
		}
		return commuteDAOOracle;
	}
	
	//@Override
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

	//@Override
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

	//@Override
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

	//@Override
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
	
	//@Override
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

	//@Override
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

	//@Override
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
	
	//@Override
	public List<Commute> showCommute(String emp_no) throws Exception {
		List<Commute> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String showcSQL ="SELECT  com_no,emp_no,com_start,com_end,com_late,com_sick,TO_CHAR(com_start,'HH24:MI:SS') com_sTime, TO_CHAR(com_end,'HH24:MI:SS') com_eTime,(TO_CHAR(com_start,'YYMMDD')||'1759') com_isET,(TO_CHAR(com_end,'YYMMDDHH24MI')) com_endD\r\n" + 
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
	
	//@Override
	public List<CommuteM> showCommuteM(String emp_no,String year) throws Exception {
		List<CommuteM> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int month=0;
		int workDay=0;
		int goodDay=0;
		int lateDay=0;
		int earlyDay=0;
		int sickDay=0;
		int overWork=0;
		
		CommuteM cm=null;
		
		try {
			con = sql.MyConnection.getConnection();
			String showcmSQL ="SELECT  to_char(com_start,'MM') month, com_late,com_sick,(com_end-com_start)*24-9 overWork,TO_CHAR(com_end,'HH24:MI:SS') com_eTime,(TO_CHAR(com_start,'YYMMDD')||'1759') com_isET,(TO_CHAR(com_end,'YYMMDDHH24MI')) com_endD\r\n" + 
								"FROM    COMMUTE \r\n" + 
								"WHERE   com_start>=?||'01-01' AND com_start<?||'-12-31'\r\n" + 
								"AND     emp_no=?"+
								"ORDER BY month";
			pstmt = con.prepareStatement(showcmSQL);
			pstmt.setString(1, year);
			pstmt.setString(2, year);
			pstmt.setString(3, emp_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(!(Integer.parseInt(rs.getString("month"))==month)) {
					month=Integer.parseInt(rs.getString("month"));
					if(cm!=null) {
						cm.setWorkDay(workDay);
						cm.setGoodDay(goodDay);
						cm.setLateDay(lateDay);
						cm.setEarlyDay(earlyDay);
						cm.setSickDay(sickDay);
						cm.setOverWork(overWork);
						list.add(cm);
					}
					cm=new CommuteM(Integer.parseInt(rs.getString("month")));
					workDay=0;
					goodDay=0;
					lateDay=0;
					earlyDay=0;
					sickDay=0;
					overWork=0;
				}
				workDay++;
				
				if(rs.getString("com_late").equals("0")) {
					goodDay++;
				}else {
					lateDay++;
				}
				if(!rs.getString("com_sick").equals("0")) {
					sickDay++;
				}
				if(Integer.parseInt(rs.getString("com_isET"))>Integer.parseInt(rs.getString("com_endD"))) {
					earlyDay++;
				}
				int ow=(int)Double.parseDouble((rs.getString("overWork")));
				if(ow>0) {
					overWork+=ow;
				}
			}
			cm.setWorkDay(workDay);
			cm.setGoodDay(goodDay);
			cm.setLateDay(lateDay);
			cm.setEarlyDay(earlyDay);
			cm.setSickDay(sickDay);
			cm.setOverWork(overWork);
			list.add(cm);
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	//@Override
	public int getDayCCount(String ldDate, String rdDate, String emp_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectCountSQL = 
				"SELECT COUNT(*) totalcnt\r\n" + 
				"FROM    commute\r\n" + 
				"WHERE   com_start>=to_date(?,'YYYY-MM-DD')\r\n" + 
				"AND     com_end<=to_date(?||'235959','YYYY-MM-DDHH24MISS')\r\n" + 
				"AND     emp_no=?";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectCountSQL);
			pstmt.setString(1, ldDate);
			pstmt.setString(2, rdDate);
			pstmt.setString(3, emp_no);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalcnt");
			return totalCount;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}

	//@Override
	public List<CommuteDBean> findAll(String ldDate, String rdDate, String emp_no, int intPage) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String selectAllSQL=
				"SELECT  b.*\r\n" + 
				"FROM (SELECT ROWNUM r, a.*\r\n" + 
				"        FROM (SELECT to_number(c.com_no,'9999') no, c.emp_no, to_char(c.com_start,'HH24:MI:SS') com_start, to_char(c.com_end,'HH24:MI:SS') com_end, c.com_late,c.com_sick,(com_end-com_start)*24-9 overwork,(TO_CHAR(com_start,'YYMMDD')||'1759') com_isET,(TO_CHAR(com_end,'YYMMDDHH24MI')) com_endD,to_char(c.com_start,'YYYYMMDD') dStart,to_char(c.com_start,'YYYYMMDD') dEnd, to_char(c.com_start,'YYYY-MM-DD') compare\r\n" + 
				"               FROM Commute c\r\n" + 
				"               WHERE  c.emp_no=?\r\n" + 
				"               AND    com_start>=to_date(?,'YYYY-MM-DD')\r\n" + 
				"               AND    com_end<=to_date(?||'235959','YYYY-MM-DDHH24MISS')\r\n" + 
				"               ORDER BY c.com_start desc) a\r\n" + 
				"               ) b\r\n" + 
				"WHERE r BETWEEN  ? AND ?";
		
		List<CommuteD> list = new ArrayList<>();
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectAllSQL);
			int cntPerPage=20;//1페이지별 3건씩 보여준다
			int endRow=cntPerPage * intPage;
			int startRow=endRow-cntPerPage+1; 			
			pstmt.setString(1, emp_no);
			pstmt.setString(2, ldDate);
			pstmt.setString(3, rdDate);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Double ow=Double.parseDouble(rs.getString("overwork"));
				String owt="";
				if(ow>0)
					owt=ow+"";
				else
					owt="0";
				int isET=Integer.parseInt(rs.getString("com_isET"));
				int endD=Integer.parseInt(rs.getString("com_endD"));
				String com_early="";
				if(isET<endD) {
					com_early="0";
				}else {
					com_early="1";
				}
				list.add(new CommuteD(
						rs.getString("no"),
						rs.getString("emp_no"),
						rs.getString("com_start"),
						rs.getString("com_end"),
						rs.getString("com_late"),
						rs.getString("com_sick"),
						com_early,
						owt,
						rs.getString("dStart"),
						rs.getString("dEnd"),
						rs.getString("compare")
						));
			}
			pstmt.close();
			rs.close();
			
			selectAllSQL=
					"SELECT  b.*\r\n" + 
					"FROM (SELECT ROWNUM r, a.*\r\n" + 
					"        FROM (SELECT to_number(c.com_no,'9999') no, c.emp_no, c.com_start, c.com_end, c.com_late,c.com_sick,o.out_no,o.OUT_START, o.out_end, to_char(o.out_start,'HH24:MI:SS') odStart,to_char(o.out_end,'HH24:MI:SS') odEnd,to_char(o.out_start,'YYYY-MM-DD') compare\r\n" + 
					"               FROM Commute c, Outwork o\r\n" + 
					"               WHERE  c.emp_no=o.emp_no\r\n" + 
					"               AND    c.emp_no=?\r\n" + 
					"               AND    com_start>=to_date(?,'YYYY-MM-DD')\r\n" + 
					"               AND    com_end<=to_date(?||'235959','YYYY-MM-DDHH24MISS')\r\n" + 
					"               AND    to_char(c.COM_START,'YYYYMMDD')=to_char(o.out_start,'YYYYMMDD')\r\n" + 
					"               ORDER BY c.com_start desc) a\r\n" + 
					"               ) b\r\n" + 
					"WHERE r BETWEEN  ? AND ?";
			List<OutWorkD> olist= new ArrayList<>();
			pstmt = con.prepareStatement(selectAllSQL);
			cntPerPage=50;//1페이지별 3건씩 보여준다
			endRow=cntPerPage * intPage;
			startRow=endRow-cntPerPage+1; 			
			pstmt.setString(1, emp_no);
			pstmt.setString(2, ldDate);
			pstmt.setString(3, rdDate);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs = pstmt.executeQuery();		
			while(rs.next()) {
				olist.add(new OutWorkD(
						rs.getString("out_no"),
						rs.getString("emp_no"),
						rs.getString("out_start"),
						rs.getString("out_end"),
						rs.getString("odStart"),
						rs.getString("odEnd"),
						rs.getString("compare")
						));
			}

			List<CommuteDBean> beanlist = new ArrayList<>();
			int x=0;
			int y=0;
			boolean find=false;
			CommuteD cd=null;
			OutWorkD od=null;
			CommuteDBean cdb=null;
			while(true) {
				cd=null;
				od=null;
				if(x<list.size())
					cd= list.get(x);
				if(y<olist.size())
					od= olist.get(y);
				if(od==null){
					cdb=new CommuteDBean(cd.getCompare(),cd.getCom_start(),cd.getCom_end(),cd.getCom_late(),cd.getCom_early(),cd.getCom_sick(),cd.getOverwork(),"-","-");
					x++;
					beanlist.add(cdb);
				}else {
					if(!cd.getCompare().equals(od.getCompare())){
						cdb=new CommuteDBean(cd.getCompare(),cd.getCom_start(),cd.getCom_end(),cd.getCom_late(),cd.getCom_early(),cd.getCom_sick(),cd.getOverwork(),"-","-");
						find=false;
						x++;
						beanlist.add(cdb);
					}else {
						if(!find) {
							cdb=new CommuteDBean(cd.getCompare(),cd.getCom_start(),cd.getCom_end(),cd.getCom_late(),cd.getCom_early(),cd.getCom_sick(),cd.getOverwork(),od.getOdStart(),od.getOdEnd());
							y++;
							beanlist.add(cdb);
							find=true;
						}else {
							cdb=new CommuteDBean("","","","","","","",od.getOdStart(),od.getOdEnd());
							beanlist.add(cdb);
							y++;
						}
					}
				}
				if(x==list.size()&&y==olist.size())
					break;
			}			
			return beanlist;
		}finally {
			MyConnection.close(rs, pstmt, con);			
		}
	}

}
