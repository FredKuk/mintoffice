package dao;

import java.util.List;

import vo.Employee;

public interface EmployeeDAO {
	void insert(Employee c) throws Exception;
	Employee selectById(String id) throws Exception;
	List<Employee> selectAll() throws Exception;
	void update(Employee c) throws Exception;
	void delete(String id)  throws Exception;
}
