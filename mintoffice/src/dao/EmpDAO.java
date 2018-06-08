package dao;

import java.util.List;

import vo.Emp;


public interface EmpDAO {
	/*public List<Emp> selectAll() throws Exception;*/		//전체검색
	public List<Emp> selectBy(String searchName, String searchNum, String searchGrade, String searchDepart) throws Exception;  //조건별 검색
	public List<Emp> selectByAll() throws Exception;
	public List<Emp> selectByName(String searchName) throws Exception;
	public List<Emp> selectByNum(String searchNum) throws Exception;
	public List<Emp> selectByPosition(String searchGrade) throws Exception;
	public List<Emp> selectByDepart(String searchDepart) throws Exception;

}
