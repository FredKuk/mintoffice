package service;

import java.util.List;

import dao.MemoDAO;
import dao.MemoDAOOracle;
import vo.Memo;

public class MemoService {
	private MemoDAO dao = new MemoDAOOracle();
	public int findCount() throws Exception{
		return dao.selectCount();
	}
	public List<Memo> findAll(int page) throws Exception{
		return dao.selectAll(page);
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
