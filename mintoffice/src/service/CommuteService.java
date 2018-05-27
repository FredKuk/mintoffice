package service;

import java.util.List;

import dao.CommuteDAO;
import dao.CommuteDAOOracle;
import vo.Commute;
import vo.CommuteDBean;
import vo.CommuteM;

public class CommuteService {
	private CommuteDAO dao = new CommuteDAOOracle();

	public String isWork(String emp_no) throws Exception {
		return dao.isWork(emp_no);
	}

	public void arrive(String emp_no) throws Exception {
		dao.arrive(emp_no);
	}

	public void gohome(String com_no) throws Exception {
		dao.gohome(com_no);
	}

	public void goout(String emp_no) throws Exception {
		dao.goout(emp_no);
	}

	public String isOut(String emp_no) throws Exception {
		return dao.isOut(emp_no);
	}

	public void comeback(String out_no) throws Exception {
		dao.comeback(out_no);
	}

	public void illness(String com_no) throws Exception {
		dao.illness(com_no);
	}

	public List<Commute> showCommute(String emp_no) throws Exception {
		return dao.showCommute(emp_no);
	}

	public List<CommuteM> showMonthCommute(String emp_no,String year) throws Exception{
		return dao.showCommuteM(emp_no,year);
	}

	public int getDayCCount(String ldDate, String rdDate, String emp_no) throws Exception{
		return dao.getDayCCount(ldDate,rdDate,emp_no);
	}

	public List<CommuteDBean> findAll(String ldDate, String rdDate, String emp_no, int intPage) throws Exception{
		return dao.findAll(ldDate,rdDate,emp_no,intPage);
	}

}
