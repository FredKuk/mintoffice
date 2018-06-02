package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import sql.MyConnection;
import vo.Employee;

public class EmployeeDAOOracle implements Dao {
	private static volatile EmployeeDAOOracle employeeDAOOracle;
	
	private EmployeeDAOOracle(){
	}
	
	public static EmployeeDAOOracle getInstance(){
		if(employeeDAOOracle==null){
			synchronized (EmployeeDAOOracle.class){
				if(employeeDAOOracle==null){
					employeeDAOOracle=new EmployeeDAOOracle();
				}
			}
		}
		return employeeDAOOracle;
	}
	
	//@Override
	public void insert(Employee c) throws Exception {
		// TODO Auto-generated method stub

	}

	//@Override
	public Employee selectById(String id) throws Exception {
		/*2)DB와 연결 */
		Connection con = null;
		/*3)SQL문장을 DB서버로 송신*/
		PreparedStatement pstmt=null;
		/*4)DB서버로 부터 결과 수신*/
		ResultSet rs=null;
		System.out.println("TOMCAT TRYING TO FIND EMPLOYEE WHOSE ID : "+id);
		try {
			System.out.println("TOMCAT GET TRYING TO ACCESS ORACLE DB");
			con = MyConnection.getConnection();
			System.out.println("TOMCAT SUCCESSFULLY ACCESS");
			String loginSQL = 
					"SELECT * FROM employee WHERE id=?";
			pstmt = con.prepareStatement(loginSQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) { //아이디가 없는경우
				System.out.println("THERE IS NO EMPLOYEE WHOSE ID IS "+ id);
				return null;
			}else {
				System.out.println(rs.getString("EMP_NO"));
				return new Employee(
						rs.getString("EMP_NO"),
						id,
						rs.getString("PWD"),
						rs.getString("NAME"),
						rs.getString("DEP_NO"),
						rs.getString("POSITION_NO"),
						rs.getString("ADDRESS"),
						rs.getString("EMAIL"),
						null,//rs.getString("PROFILE_PIC"),
						null,//rs.getString("SIGNATURE"),
						rs.getString("JOIN_DATE"),
						rs.getString("RETIRE_DATE"),
						rs.getInt("IS_RETIRE"),
						rs.getString("MSG"),
						rs.getInt("IS_MANAGER"),
						rs.getInt("HOLIDAY_ALL"),
						rs.getInt("HOLIDAY_USE")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace(); //톰캣콘솔
			throw e;			
		} finally {	
			MyConnection.close(rs, pstmt, con);			
		}
	}

	//@Override
	public List<Employee> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//@Override
	public void update(Employee c) throws Exception {
		// TODO Auto-generated method stub

	}

	//@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub

	}

}
