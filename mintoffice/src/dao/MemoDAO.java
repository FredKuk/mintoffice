package dao;

import java.util.List;

import vo.Memo;

public interface MemoDAO {

	int selectCount() throws Exception;

	List<Memo> selectAll(int page) throws Exception;

	void insert(Memo board) throws Exception;

	void modify(Memo m) throws Exception;

	void delete(String memo_no) throws Exception;

}
