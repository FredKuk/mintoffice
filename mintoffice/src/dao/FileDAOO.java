package dao;

import java.util.List;

import vo.Board;

public interface FileDAOO {
	//전체검색
	public List<Board> selectByAll() throws Exception;
	//페이지별검생
	public List<Board> selectByAll(int page) throws Exception;
	//제목검색
	public List<Board> selectBySubject(String searchSubject) throws Exception;
	//날짜검색
	public List<Board> selectByCalendar(String searchCalendar) throws Exception;
	//페이지수
	public int selectCount() throws Exception;
	//글삽입
	void insertFileBoard(Board board) throws Exception;
}
