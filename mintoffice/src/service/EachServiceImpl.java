package service;

import dao.EachDao;
import dao.EachDaoImpl;
import vo.Emp;

public class EachServiceImpl implements EachService {
	
	private EachDao dao;
	
	public EachServiceImpl() {
		dao = new EachDaoImpl();
	}
	@Override
	public void join(Emp e) {
		// TODO Auto-generated method stub
		dao.insert(e);
		
	}

}
