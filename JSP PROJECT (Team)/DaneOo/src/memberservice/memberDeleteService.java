package memberservice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import service.Service;

public class memberDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mail = request.getParameter("mail");
		MemberDAO dao = MemberDAO.getInstance();
		dao.deleteMember(mail);
		response.sendRedirect("member?cmd=main");
	}

}
