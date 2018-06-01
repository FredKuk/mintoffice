package service;

import dao.Dao;
import dao.NoticeDAOOracle;

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
	
	public static  NoticeService getInstance(){
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
	

}
