package boardservice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoriteListDAO;
import dao.ItemDAO;
import dao.MemberDAO;
import dto.FavoriteList;
import dto.Item;
import dto.PageMaker;
import service.Service;

public class StartMainItemList implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기본 관심사 카테고리 40개정도씩 가져오기

		String spage = request.getParameter("page");
//		String session = request.getParameter("UserInfo");
//		System.out.println("Session: "+session);
		
		if(spage == null)
		{
			spage = "1";
		}
		
//		if(session == null)
//		{// 처음부터는 로그인없음
//			session = "";
//		}
		
		int page = Integer.parseInt(spage);
		ItemDAO iDao = ItemDAO.getInstance();
		int totalCount = iDao.getTotalCount();
		
		PageMaker pageMaker = new PageMaker(page, totalCount);
		
//		System.out.println("totalCount: "+totalCount);
//		System.out.println("getStart: "+pageMaker.getStart());
//		System.out.println("getStartPage: "+pageMaker.getStartPage());
//		System.out.println("getEndPage: "+pageMaker.getEndPage());
//		System.out.println("getCurrPage: "+pageMaker.getCurrPage());
//		System.out.println("getPageSize: "+pageMaker.getPageSize());
		
		// 검색 아이템들 가져오기
		List<Item> itemList = iDao.getBoardPage(pageMaker.getStart(), pageMaker.getPageSize());
		request.setAttribute("itemList", itemList);
		request.setAttribute("pageMaker", pageMaker);
		
		// 회원가입선택에 필요한 전체 관심사 리스트 가져오기
		FavoriteListDAO fDao = FavoriteListDAO.getInstance();
		List<FavoriteList> favoriteList = fDao.getFavList();
//		System.out.println(favoriteList.toString());
		
		request.setAttribute("favoriteList", favoriteList);
		
		MemberDAO mDao =MemberDAO.getInstance();
//		Member userFavorite = mDao.getMember(session);
		
//		request.setAttribute("mail", session);
		
		request.getRequestDispatcher("/main_board/main_itemList.jsp").forward(request, response);
	}
	
}
