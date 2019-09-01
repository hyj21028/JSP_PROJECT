package memberservice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Member;
import service.Service;

public class loginSession implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String msg ="";
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String mail = request.getParameter("mail");
		String pwd = request.getParameter("pwd");
		System.out.println("mail: "+mail);
		System.out.println("pwd: "+pwd);
		
		System.out.println("DB로그인 전");
		// DB에서 검사
		MemberDAO dao = MemberDAO.getInstance();
		int result =dao.login(mail, pwd);
		System.out.println("DB로그인 지나감: "+result);
		
		if(result == 1) {
			// 유저의 모든 정보 가져오기
			Member member = dao.getMember(mail);
			session.setAttribute("UserInfo", member);
			//request.setAttribute("mail", member);
			msg="로그인 되셨습니다.";
//			request.getRequestDispatcher("/main_board/main_itemList.jsp").forward(request, response);
//			request.getRequestDispatcher("/main_board/main_itemList.jsp").forward(request, response);
//			response.sendRedirect("main.jsp");
			response.sendRedirect("Start.do");
		}else if (result ==0) {
			msg="비밀번호가 맞지않습니다.";
			response.sendRedirect("Start.do");
		}else if ( result ==-1) {
			msg="아이디가 존재하지 않습니다.";
			response.sendRedirect("Start.do");
		}
		
	}

}
