package service;

import java.lang.reflect.Method;
import java.util.List;

import dao.Dao;
import dao.EmployeeDAOOracle;
import vo.Employee;


public class EmployeeService implements Service {
	private Dao dao =null;
	private static  volatile EmployeeService employeeService;
	Class clazz=null;
	
	private EmployeeService(){
		dao=EmployeeDAOOracle.getInstance();
		try {
			clazz=Class.forName("dao.EmployeeDAOOracle");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static  EmployeeService getInstance(){
		if(employeeService==null){
			synchronized (EmployeeService.class){
				if(employeeService==null){
					System.out.println("Hello2");
					employeeService=new EmployeeService();
				}
			}
		}
		return employeeService;
	}

	public void signup(Employee e) throws Exception{
		Method m=clazz.getDeclaredMethod("insert", Employee.class);
		m.invoke(dao, e);
	}
	public Employee login(String id, String pwd) throws Exception{
		System.out.println("***ACCESS***");
		System.out.println("ID : "+id);
		System.out.println("PWD : "+pwd);
		System.out.println("************");
		Method m=clazz.getDeclaredMethod("selectById", String.class);
		Employee e =(Employee)m.invoke(dao, id);
		if(e==null) {
			System.out.println("****SERVER RESPONSE****");
			System.out.println("LOGIN NULL!");
			System.out.println("***********************");
		}
		if(e !=null) { //아이디가 있는 경우
			if(e.getPwd().equals(pwd)) {//비밀번호일치
				//return e.getEmp_no()+"@"+e.getDep_no();
				return e;
			}
		}
		return null;
	}
	public String dupChk(String id) throws Exception{
		Method m=clazz.getDeclaredMethod("selectById", String.class);
		Employee e =(Employee)m.invoke(dao, id);
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
