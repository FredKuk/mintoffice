package service;

import java.util.List;

import dao.MemoDAO;
import dao.MemoDAOOracle;
import vo.Memo;

public class MemoService {
	private MemoDAO dao = new MemoDAOOracle();
	
	public int findCount(String emp_no) throws Exception{
		return dao.selectCount(emp_no);
	}
	public List<Memo> findAll(String emp_no, int page) throws Exception{
		return dao.selectAll(emp_no, page);
	}
	public void insert(Memo m) throws Exception{
		dao.insert(m);
	}
	public void modify(Memo m) throws Exception{
		dao.modify(m);
	}
	public void delete(String memo_no) throws Exception{
		dao.delete(memo_no);
	}

}
