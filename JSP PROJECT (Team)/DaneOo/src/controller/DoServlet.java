package controller;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardservice.ItemSearchService;
import boardservice.PinSaveService;
import boardservice.StartMainItemList;
import boardservice.topicService;
import memberservice.loginSession;
import memberservice.memberDeleteService;
import memberservice.memberJoinFormService;
import memberservice.memberJoinService;
import memberservice.memberUpdateFormService;
import memberservice.memberUpdateService;
import service.Service;

/**
 * Servlet implementation class BoardServlet
 */
/* 어떠한 작업에도 .do 만 붙이면 된다 */
@WebServlet("*.do")
public class DoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Service service = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("requestURI: "+request.getRequestURI());
		System.out.println("asdfasd");
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestURI = request.getRequestURI();	// 실제 파일이 있는 경로 전체 'URI'를 다 가져온다. , URL 은 프로토콜 + 도메인이 합쳐진것 
		System.out.println("requestURI: "+requestURI);
		System.out.println("post1234124");
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();	// 실제 파일이 있는 경로 전체 'URI'를 다 가져온다. , URL 은 프로토콜 + 도메인이 합쳐진것 
		String contextPath = request.getContextPath();	// 현재 프로젝트 path만 얻어온다. 
		String command = requestURI.substring(contextPath.length());	// BoardSystem/URI.do
																								// BoardSystem/list.do , /list.do 만 잘라서 command 에 넣어줌
		
//		request.getContextPath()는 프로젝트 path만 얻어온다.
//
//		요청 : http://localhost/ZESTINE/test.jsp 경우
//
//		→ /ZESTINE 경로만 얻는다
//
//
//		request.getRequestURI()는 프로젝트와 파일 경로까지 얻어온다.
//
//		요청 : http://localhost/ZESTINE/test.jsp 경우
//
//		→ /ZESTINE/test.jsp 까지 얻어온다.


		if(command.equals("/Start.do")) 
		{
			System.out.println("메인페이지");
			service = new StartMainItemList();
		}
		else if(command.equals("/ItemSearch.do")) 
		{
			service = new ItemSearchService();
		}
		else if(command.equals("/topic.do")) 
		{
			System.out.println("topic 입니당1234");
			service = new topicService();
		}
		else if(command.equals("/memJoin.do")){
			System.out.println("여기는 memJoin.do");
			service = new memberJoinService();
		}
		else if(command.equals("/memJoinForm.do")){
			
			service = new memberJoinFormService();
		}
		else if(command.equals("/memUpdate.do")){
			
			service = new memberUpdateService();
		}
		else if(command.equals("/memDelete.do")){
			service=new memberDeleteService();
		}
		else if(command.equals("/loginSession.do")) {
//			System.out.println("왔나요 로그인님");
			service=new loginSession();
		}
		else if(command.equals("/PinSave.do")) 
		{
			System.out.println("1231151515");
			service = new PinSaveService();
		}
		else if(command.equals("/memUpdateForm.do")) 
		{
			service = new memberUpdateFormService();
		}
		else if(command.equals("/memUpdateService.do")) 
		{
			service = new memberUpdateService();
		}
//		else if(command.equals("/boardDelete.do")) 
//		{
//			service = new BoardDeleteService();
//		}
//		else if(command.equals("/replyWrite.do")) 
//		{
//			service = new ReplyWriteService();
//		}
//		else if(command.equals("/replyDelete.do")) 
//		{
//			service = new ReplyDeleteService();
//		}
		service.execute(request, response);
	}
	
}
