package sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyConnection {
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="kitri";
		String password="kitri";
		Connection con=null;
		try {
			con=DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(PreparedStatement pstmt, Connection con) {
		if(pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
		if(con != null)
			try {
				con.close();
			} catch (SQLException e) {
			}
	}

	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}
}
