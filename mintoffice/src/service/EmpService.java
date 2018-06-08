package service;

import java.util.List;

import dao.EmpDAO;
import dao.EmpDAOOracle;
import vo.Emp;

public class EmpService {
	private EmpDAO dao = new EmpDAOOracle();
	
	//조건별 검색
	public List<Emp> findBy(String name, String emp_no, String position_name, String dep_name) throws Exception {
		List<Emp> list = dao.selectBy(name, emp_no, position_name, dep_name);
		return list;
	}  
	//전체검색
	public List<Emp> findAll() throws Exception{
		List<Emp> list = dao.selectByAll();
		return list;
		
	}
	//이름만 검색
	public List<Emp> findName(String name) throws Exception{
		List<Emp> list = dao.selectByName(name);
		return list;
	}
	//사번만 검색
	public List<Emp> findNum(String emp_no) throws Exception{
		List<Emp> list = dao.selectByNum(emp_no);
		return list;
	}
	
	//직급만 검색
	public List<Emp> findPosition(String position_name)	throws Exception{
		List<Emp> list = dao.selectByPosition(position_name);
		return list;
		
	}
	//부서만 검색
	public List<Emp> findDepartment(String dep_name) throws Exception{
		List<Emp> list = dao.selectByDepart(dep_name);
		return list;
	}
	



}
