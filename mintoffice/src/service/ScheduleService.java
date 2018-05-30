package service;

import java.lang.reflect.Method;
import java.util.List;

import dao.Dao;
import dao.ScheduleDAOOracle;
import vo.Schedule;


public class ScheduleService implements Service{
	private Dao dao =null;
	private static  volatile ScheduleService scheduleService;
	Class clazz=null;
	
	private ScheduleService(){
		dao = ScheduleDAOOracle.getInstance();
		try {
			clazz=Class.forName("dao.ScheduleDAOOracle");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static  ScheduleService getInstance(){
		if(scheduleService==null){
			synchronized (ScheduleService.class){
				if(scheduleService==null){
					System.out.println("Hello4");
					scheduleService=new ScheduleService();
				}
			}
		}
		return new ScheduleService();
	}
	
	public void insert(Schedule s) throws Exception{
		Method m=clazz.getDeclaredMethod("insert", Schedule.class);
		m.invoke(dao, s);
	}

	public List<Schedule> showps(String emp_no) throws Exception{
		Method m=clazz.getDeclaredMethod("showps", String.class);
		return (List<Schedule>)m.invoke(dao, emp_no);
	}
	
	public List<Schedule> showts(String emp_no) throws Exception{
		Method m=clazz.getDeclaredMethod("showts", String.class);
		return (List<Schedule>)m.invoke(dao, emp_no);
	}
	
	public List<Schedule> showcs() throws Exception{
		Method m=clazz.getDeclaredMethod("showcs");
		return (List<Schedule>)m.invoke(dao);
	}

	public void modify(Schedule s) throws Exception{
		Method m=clazz.getDeclaredMethod("modify", Schedule.class);
		m.invoke(dao, s);
	}

	public void delete(String schedule_no) throws Exception{
		Method m=clazz.getDeclaredMethod("delete", String.class);
		m.invoke(dao, schedule_no);
	}
}
