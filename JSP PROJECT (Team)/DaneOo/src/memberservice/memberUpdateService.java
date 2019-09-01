package memberservice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.Member;
import service.Service;

public class memberUpdateService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member member = new Member();
		
		member.setPwd(request.getParameter("svdpassword"));
		member.setMail(request.getParameter("mail"));
		member.setContent(request.getParameter("content"));
		member.setLoc(request.getParameter("loc"));
		MemberDAO dao = MemberDAO.getInstance();
		dao.updateMember(member);	// favorite, gender 없음 수정해야함
		
		response.sendRedirect("memUpdateForm.do");
	}

}
