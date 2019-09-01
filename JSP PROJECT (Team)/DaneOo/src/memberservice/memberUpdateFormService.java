package memberservice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Member;
import service.Service;

public class memberUpdateFormService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
//		session.getAttribute("UserInfo");
		
		MemberDAO dao = MemberDAO.getInstance();
		Member user = (Member) session.getAttribute("UserInfo"); 
//		String mail = request.getParameter("mail");
//		System.out.println("메일"+mail);
		Member member = dao.getMemberProfile(user.getMail());
		System.out.println("유저프로필: "+member.toString());
		request.setAttribute("member", member);
		request.getRequestDispatcher("/memberinfo/info.jsp").forward(request, response);
		
	}

}
