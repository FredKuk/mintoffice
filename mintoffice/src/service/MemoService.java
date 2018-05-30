package service;

import java.lang.reflect.Method;
import java.util.List;

import dao.Dao;
import dao.MemoDAOOracle;
import vo.Employee;
import vo.Memo;

public class MemoService implements Service{
	private Dao dao = null;
	private static  volatile MemoService memoService;
	Class clazz=null;	
	
	private MemoService(){
		dao = MemoDAOOracle.getInstance();
		try {
				clazz=Class.forName("dao.MemoDAOOracle");
		} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}
	
	public static  MemoService getInstance(){
		if(memoService==null){
			synchronized (MemoService.class){
				if(memoService==null){
					System.out.println("Hello3");
					memoService=new MemoService();
				}
			}
		}
		return new MemoService();
	}
	
	public int findCount(String emp_no) throws Exception{
		Method m=clazz.getDeclaredMethod("selectCount", String.class);
		return (int)m.invoke(dao, emp_no);
	}
	public List<Memo> findAll(String emp_no, int page) throws Exception{
		Method m=clazz.getDeclaredMethod("selectAll", String.class, int.class);
		return (List<Memo>)m.invoke(dao, emp_no,page);
	}
	public void insert(Memo m) throws Exception{
		Method mm=clazz.getDeclaredMethod("insert", Memo.class);
		mm.invoke(dao, m);
	}
	public void modify(Memo m) throws Exception{
		Method mm=clazz.getDeclaredMethod("modify", Memo.class);
		mm.invoke(dao, m);
	}
	public void delete(String memo_no) throws Exception{
		Method mm=clazz.getDeclaredMethod("delete", String.class);
		mm.invoke(dao, memo_no);
	}

}
