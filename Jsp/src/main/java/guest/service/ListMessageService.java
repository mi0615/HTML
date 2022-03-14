package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	public List <Message> getMessageList(String pNum) throws MessageException
	{
		int pageNum = 1;
		if(pNum != null)pageNum = Integer.parseInt(pNum);
		/*
		 * pageNum		startRow		endRow
		 *	1				1				3
		 *	2				4				6	
		 *	3				7				9
		 */
		int startRow =  pageNum * countPerPage -(countPerPage-1);
		/* int startRow = pageNum != 1 ? ((pageNum-1)*countPerPage)+1 : 1; */

		int endRow = pageNum * countPerPage;
		
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList(startRow, endRow);			
		return mList;
	}
	
	//전체 메세지 테이블에서 레코드 수에 맞는 페이지 수 얻기
	public int getTotalPage() throws MessageException{
		//전체 레코드 수를 얻어옴
		totalRecCount = MessageDao.getInstance().getTotalCount();
		/*
		 * 전체 레코드 수  -  페이지 수
		 * 		9			3
		 * 		10			4
		 *		11			4
		 *		12			4
		 *		13			5 
		 */
		/* pageTotalCount = (int)Math.ceil(totalRecCount/3.0); */
		/*int a = 0;
		if(totalRecCount%countPerPage != 0) {
			a = 1;
		}*/
		//pageTotalCount = (totalRecCount / countPerPage) + a;
		if(totalRecCount%countPerPage>0) {
			pageTotalCount = (totalRecCount/countPerPage) + 1;
		}
		else {
			pageTotalCount = (totalRecCount/countPerPage);
		}
		
		return pageTotalCount;
	}
	
}
