package service;

import java.lang.reflect.Method;
import java.util.List;

import dao.CommuteDAOOracle;
import dao.Dao;
import vo.Commute;
import vo.CommuteDBean;
import vo.CommuteM;

public class CommuteService implements Service{
	private Dao dao =null;
	private static  volatile CommuteService commuteService;
	Class clazz=null;
	
	private CommuteService(){
		 dao = CommuteDAOOracle.getInstance();
		 try {
				clazz=Class.forName("dao.CommuteDAOOracle");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static  CommuteService getInstance(){
		if(commuteService==null){
			synchronized (CommuteService.class){
				if(commuteService==null){
					System.out.println("Hello1");
					commuteService=new CommuteService();
				}
			}
		}
		return commuteService;
	}
	
	public String isWork(String emp_no) throws Exception {
		Method m=clazz.getDeclaredMethod("isWork", String.class);
		return (String)m.invoke(dao, emp_no);
	}

	public void arrive(String emp_no) throws Exception {
		Method m=clazz.getDeclaredMethod("arrive", String.class);
		m.invoke(dao, emp_no);
	}

	public void gohome(String com_no) throws Exception {
		Method m=clazz.getDeclaredMethod("gohome", String.class);
		m.invoke(dao, com_no);
	}

	public void goout(String emp_no) throws Exception {
		Method m=clazz.getDeclaredMethod("goout", String.class);
		m.invoke(dao, emp_no);
	}

	public String isOut(String emp_no) throws Exception {
		Method m=clazz.getDeclaredMethod("isOut", String.class);
		return (String)m.invoke(dao, emp_no);
	}

	public void comeback(String out_no) throws Exception {
		Method m=clazz.getDeclaredMethod("comeback", String.class);
		m.invoke(dao, out_no);
	}

	public void illness(String com_no) throws Exception {
		Method m=clazz.getDeclaredMethod("illness", String.class);
		m.invoke(dao, com_no);
	}

	public List<Commute> showCommute(String emp_no) throws Exception {
		Method m=clazz.getDeclaredMethod("showCommute", String.class);
		return (List<Commute>)m.invoke(dao, emp_no);
	}

	public List<CommuteM> showMonthCommute(String emp_no,String year) throws Exception{
		Method m=clazz.getDeclaredMethod("showCommuteM", String.class, String.class);
		return (List<CommuteM>)m.invoke(dao,emp_no,year);
	}

	public int getDayCCount(String ldDate, String rdDate, String emp_no) throws Exception{
		Method m=clazz.getDeclaredMethod("getDayCCount", String.class, String.class, String.class);
		return (int)m.invoke(dao,ldDate,rdDate,emp_no);
	}

	public List<CommuteDBean> findAll(String ldDate, String rdDate, String emp_no, int intPage) throws Exception{
		Method m=clazz.getDeclaredMethod("findAll", String.class, String.class, String.class, int.class);
		return (List<CommuteDBean>)m.invoke(dao,ldDate,rdDate,emp_no,intPage);
	}

}
