package boardservice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Favorite;
import dto.Member;
import service.Service;

public class topicService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member UserInfo = (Member) session.getAttribute("UserInfo");
		System.out.println("member: "+UserInfo);
		
		MemberDAO mDao = MemberDAO.getInstance();
		List<Favorite> flist = mDao.selectMemberFavorite(UserInfo.getMail());
		
		// 관심사 타이틀 / 저장중인 관심사 정보 / 유저 정보
		request.setAttribute("flist", flist);
		request.setAttribute("UserInfo", UserInfo);

		request.getRequestDispatcher("/topic/topic.jsp").forward(request, response);
	}

}
