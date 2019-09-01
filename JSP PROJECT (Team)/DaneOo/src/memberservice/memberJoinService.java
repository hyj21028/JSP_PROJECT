package memberservice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.Member;
import service.Service;

public class memberJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member member = new Member();
		member.setMail(request.getParameter("email"));
		member.setPwd(request.getParameter("pwd"));
		member.setGender(request.getParameter("gender"));
		member.setFavorite(request.getParameterValues("favorite"));
		MemberDAO dao = MemberDAO.getInstance();
		
		System.out.println("성별: "+member.getGender());
		System.out.println("지나가나요?");
		// DB에 회원가입저장
		dao.insertMember(member);
		
		// 바로 로그인 되게끔
		response.sendRedirect("Start.do");
	}

}
