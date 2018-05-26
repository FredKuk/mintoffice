package service;

import java.util.List;

import dao.ScheduleDAO;
import dao.ScheduleDAOOracle;
import vo.Schedule;


public class ScheduleService {
private ScheduleDAO dao = new ScheduleDAOOracle();
	
	public void insert(Schedule s) throws Exception{
		dao.insert(s);
	}

	public List<Schedule> showps(String emp_no) throws Exception{
		return dao.showps(emp_no);
	}
	
	public List<Schedule> showts(String emp_no) throws Exception{
		return dao.showts(emp_no);
	}
	
	public List<Schedule> showcs() throws Exception{
		return dao.showcs();
	}

	public void modify(Schedule s) throws Exception{
		dao.modify(s);
	}

	public void delete(String schedule_no) throws Exception{
		dao.delete(schedule_no);
	}
}
