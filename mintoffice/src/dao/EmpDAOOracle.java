package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Department;
import vo.Emp;
import vo.Position;

public class EmpDAOOracle implements EmpDAO {
	// 조건검색
	@Override
	public List<Emp> selectBy(String searchName, String searchNum, String searchGrade, String searchDepart)
			throws Exception {
		List<Emp> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("name : " + searchName);
		System.out.println("num : " + searchNum);
		System.out.println("grade : " + searchGrade);
		System.out.println("searchDepart : " + searchDepart);
		try {
			con = MyConnection.getConnection();
			String selectBySQL = "select e.name,e.id,e.email,e.join_date,e.retire_date,e.msg, e.emp_no, p.position_name, d.dep_name\r\n"
					+ "from employee e, department d, position p\r\n" + "where e.dep_no = d.dep_no "
					+ "and e.position_no = p.position_no " + "and e.name=? " + "and e.emp_no=? "
					+ "and p.position_name=? " + "and d.dep_name=?";
			pstmt = con.prepareStatement(selectBySQL);
			pstmt.setString(1, searchName);
			pstmt.setString(2, searchNum);
			pstmt.setString(3, searchGrade);
			pstmt.setString(4, searchDepart);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("hmmmm");
				list.add(new Emp(rs.getString("emp_no"), rs.getString("id"), rs.getString("name"),
						new Position(rs.getString("position_name")), new Department(rs.getString("dep_name")), rs.getString("email"), rs.getString("join_date"),
						rs.getString("retire_date"), rs.getString("msg")));
				System.out.println("hererereer");
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;

	}
	//전체검색
	@Override
	public List<Emp> selectByAll() throws Exception {
		List<Emp> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("전체 oracle");
		try {
			con = MyConnection.getConnection();
			String selectAllSQL = "select e.name,e.id,e.email,e.join_date,e.retire_date,e.msg, e.emp_no, d.dep_name, p.position_name\r\n" + 
					"from employee e, department d, position p\r\n" + 
					"where e.dep_no = d.dep_no and e.position_no = p.position_no ";
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("전체검색");
				list.add(new Emp(rs.getString("emp_no"), rs.getString("id"), rs.getString("name"),
						new Position(rs.getString("position_name")), new Department(rs.getString("dep_name")),rs.getString("email"), rs.getString("join_date"),
						rs.getString("retire_date"), rs.getString("msg")));
				System.out.println("전체검색here");
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;

	}
	//이름검색
	@Override
	public List<Emp> selectByName(String searchName) throws Exception {
		List<Emp> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = MyConnection.getConnection();
			String selectBySQL = "select e.name,e.id,e.email,e.join_date,e.retire_date,e.msg, e.emp_no, p.position_name, d.dep_name\r\n"
					+ "from employee e, department d, position p\r\n" + "where e.dep_no = d.dep_no "
					+ "and e.position_no = p.position_no " + "and e.name=? ";
			pstmt = con.prepareStatement(selectBySQL);
			pstmt.setString(1, searchName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Emp(rs.getString("emp_no"), rs.getString("id"), rs.getString("name"),
						new Position(rs.getString("position_name")), new Department(rs.getString("dep_name")), rs.getString("email"), rs.getString("join_date"),
						rs.getString("retire_date"), rs.getString("msg")));
				System.out.println("hererereer");
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;

	}

	@Override
	public List<Emp> selectByNum(String searchNum) throws Exception {
		List<Emp> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = MyConnection.getConnection();
			String selectBySQL = "select e.name,e.id,e.email,e.join_date,e.retire_date,e.msg, e.emp_no, p.position_name, d.dep_name\r\n"
					+ "from employee e, department d, position p\r\n" + "where e.dep_no = d.dep_no "
					+ "and e.position_no = p.position_no " + "and e.emp_no=? ";
			pstmt = con.prepareStatement(selectBySQL);
			pstmt.setString(1, searchNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Emp(rs.getString("emp_no"), rs.getString("id"), rs.getString("name"),
						new Position(rs.getString("position_name")), new Department(rs.getString("dep_name")), rs.getString("email"), rs.getString("join_date"),
						rs.getString("retire_date"), rs.getString("msg")));
				System.out.println("hererereer");
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public List<Emp> selectByPosition(String searchGrade) throws Exception {
		List<Emp> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = MyConnection.getConnection();
			String selectBySQL = "select e.name,e.id,e.email,e.join_date,e.retire_date,e.msg, e.emp_no, p.position_name, d.dep_name\r\n"
					+ "from employee e, department d, position p\r\n" + "where e.dep_no = d.dep_no "
					+ "and e.position_no = p.position_no " + "and p.position_name=? ";
			pstmt = con.prepareStatement(selectBySQL);
			pstmt.setString(1, searchGrade);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Emp(rs.getString("emp_no"), rs.getString("id"), rs.getString("name"),
						new Position(rs.getString("position_name")), new Department(rs.getString("dep_name")), rs.getString("email"), rs.getString("join_date"),
						rs.getString("retire_date"), rs.getString("msg")));
				System.out.println("hererereer");
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public List<Emp> selectByDepart(String searchDepart) throws Exception {
		List<Emp> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = MyConnection.getConnection();
			String selectBySQL = "select e.name,e.id,e.email,e.join_date,e.retire_date,e.msg, e.emp_no, p.position_name, d.dep_name\r\n"
					+ "from employee e, department d, position p\r\n" + "where e.dep_no = d.dep_no "
					+ "and e.position_no = p.position_no " + "and d.dep_";
			pstmt = con.prepareStatement(selectBySQL);
			pstmt.setString(1, searchDepart);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Emp(rs.getString("emp_no"), rs.getString("id"), rs.getString("name"),
						new Position(rs.getString("position_name")), new Department(rs.getString("dep_name")), rs.getString("email"), rs.getString("join_date"),
						rs.getString("retire_date"), rs.getString("msg")));
				System.out.println("hererereer");
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

}
