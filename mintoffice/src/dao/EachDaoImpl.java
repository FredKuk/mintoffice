package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.Emp;

public class EachDaoImpl implements EachDao{
	public Connection conn = null;
	public PreparedStatement pstmt = null;
	public String jdbc_driver;
	public String jdbc_url;
	public ResultSet rs = null;
	
	public EachDaoImpl() {
		jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		jdbc_url = "jdbc:oracle:thin:@localhost:1521:orcl";
	}
	
	public void con() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "kitri", "kitri");
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void discon() {
		try {
			if (rs != null) {
				rs.close();
			}
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	
	@Override
	public void insert(Emp e) {
		con();
		System.out.println("eachtest");
		try {
			String sql = "update employee set address= ? , email= ? , msg= ? where id=? and name=? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getAddress());
			pstmt.setString(2, e.getEmail());
			pstmt.setString(3, e.getMsg());
			pstmt.setString(4, e.getId());
			pstmt.setString(5, e.getName());
			pstmt.executeUpdate();
			pstmt.close();
			System.out.println("주소 :" +  e.getAddress());

			
			discon();
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
	}
	
	
}
