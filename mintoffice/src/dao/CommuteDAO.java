package dao;

import java.util.List;

import vo.Commute;
import vo.CommuteM;

public interface CommuteDAO {

	String isWork(String emp_no) throws Exception;

	void arrive(String emp_no) throws Exception;

	void gohome(String com_no) throws Exception;

	void goout(String emp_no) throws Exception;

	String isOut(String emp_no) throws Exception;

	void comeback(String out_no) throws Exception;

	void illness(String com_no) throws Exception ;

	List<Commute> showCommute(String emp_no) throws Exception;

	List<CommuteM> showCommuteM(String emp_no,String year) throws Exception;

}
