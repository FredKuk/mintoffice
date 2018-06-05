package service;

import java.lang.reflect.Method;
import java.util.List;

import dao.Dao;
import dao.NoticeDAOOracle;
import vo.NReply;
import vo.Notice;

public class NoticeService implements Service {
	private Dao dao =null;
	private static  volatile NoticeService noticeService;
	Class clazz=null;
	
	private NoticeService(){
		dao = NoticeDAOOracle.getInstance();
		try {
			clazz=Class.forName("dao.NoticeDAOOracle");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static NoticeService getInstance(){
		if(noticeService==null){
			synchronized (NoticeService.class){
				if(noticeService==null){
					System.out.println("Hello4");
					noticeService=new NoticeService();
				}
			}
		}
		return noticeService;
	}

	public void insert(Notice n) throws Exception{
		Method m=clazz.getDeclaredMethod("insert", Notice.class);
		m.invoke(dao, n);
	}

	public int count() throws Exception{
		Method m=clazz.getDeclaredMethod("count");
		return (int)m.invoke(dao);
	}

	public List<Notice> findAll(int intPage) throws Exception{
		Method m=clazz.getDeclaredMethod("findAll",int.class);
		return (List<Notice>)m.invoke(dao,intPage);
	}

	public Notice findByNo(String noti_no) throws Exception{
		Method m=clazz.getDeclaredMethod("findByNo",String.class);
		return (Notice)m.invoke(dao,noti_no);
	}

	public void modify(Notice n) throws Exception{
		Method m=clazz.getDeclaredMethod("modify",Notice.class);
		m.invoke(dao, n);
	}

	public void delete(String no) throws Exception {
		Method m=clazz.getDeclaredMethod("delete",String.class);
		m.invoke(dao, no);
	}

	public int searchCount(String search) throws Exception {
		Method m=clazz.getDeclaredMethod("searchCount",String.class);
		return (int)m.invoke(dao,search);
	}

	public List<Notice> searchFindAll(int intPage, String search) throws Exception {
		Method m=clazz.getDeclaredMethod("searchFindAll",int.class,String.class);
		return (List<Notice>)m.invoke(dao,intPage,search);
	}

	public List<NReply> findAllReply(String noti_no) throws Exception {
		Method m=clazz.getDeclaredMethod("findAllReply",String.class);
		return (List<NReply>)m.invoke(dao,noti_no);
	}

	public void newReply(String noti_no, String emp_no,String contents) throws Exception {
		Method m=clazz.getDeclaredMethod("newReply",String.class,String.class,String.class);
		m.invoke(dao,noti_no,emp_no,contents);
	}

	public void delReply(String nr_no) throws Exception {
		Method m=clazz.getDeclaredMethod("delReply",String.class);
		m.invoke(dao,nr_no);
	}

	public void modReply(String nr_no, String contents) throws Exception {
		Method m=clazz.getDeclaredMethod("modReply",String.class,String.class);
		m.invoke(dao,nr_no,contents);
	}
}
