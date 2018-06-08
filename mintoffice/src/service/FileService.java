package service;

import java.util.List;

import dao.FileDAOO;
import dao.FileDAOOracle;
import vo.Board;

public class FileService {
	private FileDAOO dao = new FileDAOOracle();
	
	//전체검색
	public List<Board> findByAll() throws Exception{
		List<Board> list = dao.selectByAll();
		return list;
	}
	
	//전체 검색(조건)
	public List<Board> findByAll(int page) throws Exception{
		List<Board> list = dao.selectByAll(page);
		return list;
	}
	//제목검색
	public List<Board> findBySubject(String subject) throws Exception{
		List<Board> list = dao.selectBySubject(subject);
		return list;
	}
	//총페이지 검색
	public int findCount() throws Exception{
		return dao.selectCount();
	}
	//글쓰기
	public void write(Board board) throws Exception{
		dao.insertFileBoard(board);
	}
	
	
	

}
