package service;

import java.util.List;

import dao.EmployeeDAO;
import dao.EmployeeDAOOracle;
import vo.Employee;


public class EmployeeService {
private EmployeeDAO dao = new EmployeeDAOOracle();
	
	public void signup(Employee e) throws Exception{
		dao.insert(e);
	}
	public String login(String id, String pwd) throws Exception{
		Employee e =  dao.selectById(id);
		if(e !=null) { //아이디가 있는 경우
			if(e.getPwd().equals(pwd)) {//비밀번호일치
				//return e.getEmp_no()+"@"+e.getDep_no();
				return e.getEmp_no();
			}
		}
		return "-1";
	}
	public String dupChk(String id) throws Exception{
		Employee e =  dao.selectById(id);
		if(e==null) {
			return "1"; //아이디가 없는경우
		}else {
			return "-1";
		}
	}
	public List<Employee> findAll() throws Exception{
		return null;
	}
	
}
