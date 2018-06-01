package dao;

public class NoticeDAOOracle implements Dao {

	private static  volatile NoticeDAOOracle noticeDAOOracle;
	
	private NoticeDAOOracle(){
	}
	
	public static NoticeDAOOracle getInstance(){
		if(noticeDAOOracle==null){
			synchronized (NoticeDAOOracle.class){
				if(noticeDAOOracle==null){
					noticeDAOOracle=new NoticeDAOOracle();
				}
			}
		}
		return noticeDAOOracle;
	}
	
	
}
