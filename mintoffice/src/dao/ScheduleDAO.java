package dao;

import java.util.List;

import vo.Schedule;

public interface ScheduleDAO {
	void insert(Schedule s) throws Exception;

	List<Schedule> showps(String emp_no) throws Exception;

	List<Schedule> showts(String emp_no) throws Exception;

	List<Schedule> showcs() throws Exception;

	void modify(Schedule s) throws Exception;

	void delete(String schedule_no) throws Exception;
}
