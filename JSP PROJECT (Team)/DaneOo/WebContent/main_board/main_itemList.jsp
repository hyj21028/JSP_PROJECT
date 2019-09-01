<%@page import="dto.Item"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<title>DaneOo</title>
<!-- 링크모음 시작 -->
   <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <!-- 폰트오썸 -->
    <!-- 아이콘 변환 -->
    <script src="js/all.js"></script>
    <script src="js/mainExec.js"></script>
    <script src="js/exec.js"></script>
    <script src="js/favorite.js"></script>
    <script src="js/info_exec.js"></script>
    <script src="js/topic.js"></script>
    <!-- 구글폰트 링크 -->
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
      rel="stylesheet"
    />
    <!-- CSS 링크 -->
  <link rel="stylesheet" href="css/main.css" />
<!--   <link rel="short icon" href="img/Logo.png" type="image/x-icon"> -->
  <link rel="stylesheet" href="css/logout.css" />
  <link rel="stylesheet" href="css/favorite.css" />
  <link rel="stylesheet" href="css/gender.css" />
  <link rel="stylesheet" href="css/sign_up1.css" />
<!-- 링크모음 끝 -->
<script>

// 드랍다운 목록 클릭 시 제일 위로 보이게하기
$(document).on("click", ".dropdown-menu li", function() {
	  
	  var dropdownMenu = $(this).closest("div").prev().attr("id");
	$("#"+dropdownMenu+":first-child").text($(this).text());
	$("#"+dropdownMenu+":first-child").val($(this).text());

});

// function btn(){ alert('버튼이 클릭되었습니다'); }
$(document).on("click", ".pinSave1", function(){
	alert("sdfasf");
    var source = event.target || event.srcElement;
    console.log("sdfasdf");
    console.log(source);
});


// Pin 저장 클릭시 동작 : Pin 데이터 가져오기
$(document).on("click", ".pinSave", function(){

	var pinSave = $(this).prev().prev().attr("id");	
	var ListID = $(this).attr("id");
	
	if($("#"+pinSave).text() != "보드 선택")
	{
		// 패션,.. 값 : pinTitle
		var PinTitle = $("#"+pinSave).val();
		// List Data
		// Item [bno=390, title=포켓몬스터 몬스터콜렉션EX 피규어 <b>파이리</b>, link=https://search.shopping.naver.com/gate.nhn?id=19754034733, image=https://shopping-phinf.pstatic.net/main_1975403/19754034733.jpg, lprice=7090, hprice=0, mallName=CHmall, productId=19754034733, productType=2, category=파이리, count=0]
		var List = $("#"+ListID).data("value");
		var bno = $("#"+ListID).data("bno");
		var title = $("#"+ListID).data("title");
		var link = $("#"+ListID).data("link");
		var image = $("#"+ListID).data("image");
		var lprice = $("#"+ListID).data("lprice");
		var hprice = $("#"+ListID).data("hprice");
		var mallName = $("#"+ListID).data("mallname");
		var productId = $("#"+ListID).data("productid");
		var productType = $("#"+ListID).data("producttype");
		var category = $("#"+ListID).data("category");
		var count = $("#"+ListID).data("count");
	
		// Json 에 넣기위해서 배열 객체 생성
        var ListArr = new Array() ;
        
        // 객체 생성
        var data = new Object() ;
         
        // 각각에 가져온 값 넣기
        data.bno = bno;
        data.title = title;
        data.link = link;
        data.image = image;
        data.lprice = lprice;
        data.hprice = hprice;
        data.mallName = mallName;
        data.productId = productId;
        data.productType = productType;
        data.category = category;
        data.count = count;
        data.pintitle = PinTitle;
        
        // json 형태로 만들기
		var jsonObj = JSON.stringify(data);
// 		alert(jsonObj);
// 		console.log(jsonObj);
		
		// 값 보내기
		$.ajax({
		    url: "PinSave.do",
		    type: "POST",
		    data: JSON.stringify(jsonObj),
		    contentType: "application/json; charset=utf-8",
// 		    dataType: "json",
		    error : function(request,status,error) {
		    	alert("code = "+ request.status + " ,message = " + request.responseText + " ,error = " + error);
		    	// code = 200 message =  error = SyntaxError: Unexpected end of JSON input
		    },
		    success : function(data) {
		        alert("success!");
// 		        alert("success 밑");
// 		        window.location.href="topic.do";
// 		        window.location.href="Start.do";
		        window.location.reload();
		    },
		    complete : function() {
		        alert("complete!");
		    }
		});

	}
// 	else
// 	{
// 		// 아무것도 안함. '보드 선택' 일때
// 	}
});

// function successCall(){
//     alert("전송성공");
    
// }

// function errorCall(){
//     alert("전송실패");
//     window.location.href("topic.do");
// }
</script>
</head>
<body>
	<header id="mainHeader" class="mainHeader">
		<nav id="main-navi" class="navbar navbar-expand-lg navbar-dark ">
			<a class="dangerouslyDisableFocusStyle apoint " href="#"
				class="navbar-brand mr-auto"> <img src="img/logo.png"
				style="width: 109px; margin: -31px -14px 0px -25px;"></a>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item" id="navi-item"
						style="margin: -10px -23px 25px -17px;">
						<div role="combobox" aria-haspopup="listbox"
							aria-owns="SuggestiosMenu" aria-expanded="false"
							class="searchMenu">
							<div class="searchForm gap disp siz ali jtc">
								<div class="searchImg">
									<img src="img/magnifier.svg" />
								</div>
								<div class="searchTxt" style="display: flex">
									<input type="text" class="form-control" id="inputSearch"
										placeholder="검색" />
									<button id="Btn" class="btn-default"
										onClick="javascript:Enter_Check(); return false;">검색</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse apoint " id="collapsibleNavbar" style="margin:-20px 0px 13px 29px;">
				<ul class="navbar-nav apoint">
				
					<li class="nav-item">
					
						<div class="home  gap disp siz ali jtc">
							<a class="toHome" href="main_board/main_itemList.jsp">홈</a>
						</div>
					</li>
					<li class="nav-item ">
						<div class="following gap disp siz ali jtc">
							<a class="toFollowing " href="#">팔로잉</a>
						</div>
					</li>

					<c:if test="${not empty UserInfo }">
						<li class="nav-item " id="userMail">
							<div class="memId  gap disp siz ali jtc">
								<a class="toId " href="topic.do"> <img src="img/id.svg">${UserInfo.mail }</a>
							</div>
						</li>
					</c:if>

					<div class="right-line gap disp siz jtc">
						<div class="right"></div>
					</div>
					<li class="nav-item">
						<div class="mailBox  gap disp siz ali jtc">
							<a class="toMail" href="#"><img src="img/mailInfo.svg" /></a>
						</div>
					</li>
					<li class="nav-item">
						<div class="bell  gap disp siz ali jtc">
							<a class="toBell" href="#"><img src="img/bell.svg" /></a>
						</div>
					</li>
					<li class="nav-item">
						<div class="alarm  gap disp siz ali jtc">
							<a class="toAlarm" id="toAlarm" href="#"><img
								src="img/alarm.svg" /></a>
						</div>
					</li>

					<c:if test="${empty UserInfo }">
						<li class="nav-item">
							<div id="toJoins" class="Join  gap disp siz ali jtc">
								<a class="toJoins" href="#" onclick="javascript:join_open(); return false;"><img
									src="img/joinUser.svg" /></a>
							</div>
						</li>
						<li class="nav-item">
							<div id="toLogin" class="Login  gap disp siz ali jtc">
								<a class="toLogin " href="#" onclick="javascript:login_open(); return false;"><img
									src="img/loginuser.svg" /></a>
							</div>
						</li>
					</c:if>

				</ul>
				<div class="bottomline">
					<div class="bottom"></div>
				</div>
			</div>
		</nav>
	</header>

	<section>
		<!-- 로그아웃 창 -->
		<div class="logoutForm" style="display: none;">
			<div class="container">
				<!-- '홈피드 수정' 폼 -->
				<div class="BTNout" OnClick="window.location.href='';">
					<div class="BTNSet">
						<strong>홈피드 수정</strong>
					</div>
				</div>
				<div class="subLine"></div>
				<!-- '설정 수정' 폼 : info.jsp -->
				<div class="BTNout" OnClick="window.location.href='memUpdateForm.do';">
					<div class="BTNSet">
						<strong>설정 수정</strong>
					</div>
				</div>
				<div class="subLine"></div>
				<!-- '무료 비즈니스 프로필 추가' 폼 -->
				<div class="BTNout" OnClick="window.location.href='';">
					<div class="BTNSet">
						<strong>무료 비즈니스 프로필 추가</strong>
					</div>
				</div>
				<div class="subLine"></div>
				<!--'기능 요청' 폼 -->
				<div class="BTNout" OnClick="window.location.href='';">
					<div class="BTNSet">
						<strong>기능 요청</strong>
					</div>
				</div>
				<div class="subLine"></div>
				<!-- '도움 받기' 폼 -->
				<div class=" BTNout" OnClick="window.location.href='';">
					<div class="BTNSet">
						<strong>도움 받기</strong>
					</div>
				</div>
				<div class="subLine"></div>
				<!-- '약관 및 개인정보 보기' 폼 -->
				<div class="BTNout" OnClick="window.location.href='';">
					<div class="BTNSet">
						<strong>약관 및 개인정보 보기</strong>
					</div>
				</div>
				<div class="subLine"></div>
				<!-- '계정 추가' 폼 -->
				<div class="BTNout" OnClick="window.location.href='';">
					<div class="BTNSet">
						<strong>계정 추가</strong>
					</div>
				</div>
				<div class="subLine"></div>
				<!-- '로그 아웃' 폼 -->
				<div class="BTNout"
					OnClick="window.location.href='logoutSession.jsp';">
					<div class="BTNSet">
						<strong>로그 아웃</strong>
						<div class="log-out-text">로그아웃을 하면 아이디어를 저장하거나 맞춤형 홈피드를 둘러볼
							수 없게 됩니다.</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 로그아웃 창 끝 -->
	</section>
    
		<!-- 회원가입 창 -->
		<!-- 회원가입 팝업 시작 -->

		<!-- 회원가입 창 -->
		<form action="memJoin.do" method="POST">
		
		<section>
			<div class="join-popup" id="join-popup">
				<button class="sign_up_button siz sib" type="button" id="sin-btn">로그인</button>
				<div class="join-window">
					<div class="close-button">
						<button onclick='javascript:join_close(); return false;'>
							<img src="img/close.svg" width="16px" alt="" />
						</button>
					</div>
						<!-- Pinterest에 오신 것을 환영합니다 -->
						<div class="greeting">
							<h3>BAAM에 가입해서 더 많은 내용을 확인해 보세요.</h3>
						</div>

						<div class="greeting-2">
							<h5>통장이 텅장이 되어보자!!</h5>
						</div>
						<!-- Email & Password 입력 폼 -->
						<div class="mail">
							<div class="mail_logo">
								<img src="img/mail.svg" width="20px" alt="">
							</div>
							<input type="text" name="email" class="email_input" placeholder="이메일주소">
						</div>
						<div class="lock">
							<div class="lock_logo">
								<img src="img/lock.svg" width="20px" alt="">
							</div>
							<input type="password" name="pwd" class="pw_input" placeholder="비밀번호">
						</div>
						<br>
						<!-- Button Form -->
						<div class="joinBtn txtAli" id="joinBtn-txtAli">계속하기</div>
						<!-- 약관 동의 -->
						<div class="note txtAli">
							<span>계속하면 BAMM <strong>서비스 약관</strong> 및 <strong>개인정보
									보호정책</strong>에
								<div>동의하는 것으로 간주됩니다.</div>
							</span>
						</div>
						<!-- Login link -->
						<div class="recheck txtAli">
							이미 회원이신가요? <a href="#" class="login-move">로그인</a>
						</div>
				</div>
			</div>
			<!-- 회원가입창 끝 -->
		</section>
    
		<!--sign_up#1 환영 페이지-->
		<div class="start-sign-popup" id="start-sign-popup">
			<div class="sign-popup" id="sign-popup">
				<!-- 회원가입 data_top_item -->
				<div class="close-button">
						<button onclick='javascript:start_sign_close(); return false;'>
							<img src="img/close.svg" width="16px" alt="" />
						</button>
					</div>
				<div id="dtt"
					style="display: block; display: flex; align-items: center; justify-content: center;">
					<!-- 도트 -->
					<div id="data_test">
						<div id="data_test_id_1"></div>
					</div>
					<div id="data_test">
						<div id="data_test_id_2"></div>
					</div>

					<div id="data_test">
						<div id="data_test_id_2"></div>
					</div>
				</div>

				<!-- 라인 -->
				<hr class="line" />
				<!--프로필 사진  -->
				<div class="data_bottom">
					<div
						style="display: flex; align-items: center; justify-content: center;">
						<div id="picture">
							<img src="img/member.png" />
						</div>
					</div>
					<!-- 프로필 환영내용 -->
					<div id="open_font">
						<h1 style="text-align: center; font-size: 40px;">
							BAMM에 오신 것을 환영합니다,
							<!-- db데이터 아이디 -->
							님
						</h1>
						<br />
						<h1 style="text-align: center; font-size: 20px; font-weight: 500;">
							다음 몇 가지 질문에 대한 답변은 회원님에게 꼭 맞는 상품을 찾는 데 도움이 됩니다</h1>
					</div>

					<!-- red 다음 button  -->
<!-- 					<button class="redNextButton" id="rnb" > -->
						<div class="redNextButton" id="rnb">다음</div>
<!-- 					</button> -->
				</div>
			</div>
		</div>

		<!-- 성별선택 팝업창 -->
		<div class="start-gender-popup" id="start-gender-popup">
			<div class="gender-popup">
			<div class="close-button">
						<button onclick='javascript:gender_close(); return false;'>
							<img src="img/close.svg" width="16px" alt="" />
						</button>
					</div>
				<div id="gdr-dtt"
					style="display: block; display: flex; align-items: center; justify-content: center;">
					<!-- 도트 -->
					<div id="data_test">
						<div id="data_test_id_1"></div>
					</div>

					<div id="data_test">
						<div id="data_test_id_1"></div>
					</div>

					<div id="data_test">
						<div id="data_test_id_2"></div>
					</div>
				</div>

				<!-- 도트 끝 -->

				<!-- 라인 -->
				<hr class="line-2" />
				<!-- 라인끝 -->

				<!-- 성별 시작 -->
				<div id="gen-check">
					<div class="checks">
						<h1 id="font-cdgr">성별이 어떻게 되세요?</h1>
						<!-- 라인 -->
						<hr class="line-2" />
						<div id="font-2">
							<input id="radio1" name="gender" type="radio" class="radio" value="1"
								checked="checked" /> <label for="radio1">남성</label>
						</div>
						<!-- 라인 -->
						<hr class="line-2" />

						<div id="font-2">
							<input id="radio2" name="gender" type="radio" class="radio" value="2"/> <label
								for="radio2">여성</label>
						</div>
						<!-- 라인 -->
						<hr class="line-2" />

						<div id="font-2">
							<input id="radio3" name="gender" type="radio" class="radio" value="3"/> <label
								for="radio3">사용자지정</label>
						</div>

						<!-- 라인 -->
						<hr class="line-2" />
						<!-- 이전,다음 버튼 -->
						<div id="pre-next-button" style="display: flex">
<!-- 							<button class="prev-red-button" id="prev-rb"> -->
								<div class="prev-red-button" id="prev-rb">이전</div>
<!-- 							</button> -->

<!-- 							<button class="next-red-button" id="g-rb"> -->
								<div class="next-red-button" id="g-rb">다음</div>
<!-- 							</button> -->
						</div>

						<!-- 이전, 다음 버튼 -->
					</div>
				</div>
			</div>
		</div>
		<!-- 성별선택 팝업창 끝 -->


		<!--관심사 선택 -->
		<section>
			<div class="start-favorite-popup" id="start-favorite-popup">
				<div class="favorite-popup">
				<div class="close-button">
						<button onclick='javascript:favorite_close() ; return false;'>
							<img src="img/close.svg" width="16px" alt="" />
						</button>
					</div>
					<!-- 관심사 data_top_item -->
					<div id="dtt">
						<!-- 도트 -->
						<div id="data_test">
							<div id="data_test_id_1"></div>
						</div>
						<div id="data_test">
							<div id="data_test_id_1"></div>
						</div>

						<div id="data_test">
							<div id="data_test_id_1"></div>
						</div>

					</div>

					<!-- 라인 -->
					<hr class="line" />

					<div id="close_font">
						<div>마지막 단계입니다! 관심사를 알려주세요!</div>
					</div>
					<div id="scl">
						<div id="grd">
						
						<!-- ForEach 관심사 시작 -->
						<c:forEach items="${favoriteList }" var="favList" varStatus="status">
								<figure class="snip" data-num="${status.index}" id="sp${status.index }">
								<div class="check">
									<div id="chc">
										<img src="img/button.svg" id="btn${status.index}" />
										<input type="checkbox" name="favorite" class="iCheck" id="chk${status.index}" style="display: none" value="${favList.favorite }"/>
									</div>
								</div>
								<div>
									<img
										src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample36.jpg"
										alt="sample36" id="fvo-img" />
								</div>

								<figcaption>
									<div>
										<h3></h3>
										<h3>선택</h3>
									</div>
									<div>
										<h2>
											${favList.favorite }
										</h2>
									</div>
								</figcaption>
								<a href="#"></a>
							</figure>					
						</c:forEach>
						<!-- ForEach 관심사 끝 -->
							
						</div>
					</div>
					<div id="asd"></div>
					<div id="next-btn">
						<button class="grayNextButton" id="gnb" type="submit"
							style="margin: 10px 30px 10px 30px;" >
							<div>다음</div>
						</button>
					</div>
				</div>
			</div>
		</section>
		<!--관심사 선택 끝-->
		</form>


		<!-- 회원가입끝 -->

		<!-- 로그인 창 시작 -->
		<section>
			<!-- 로그인 창 시작 -->

			<!--로그인 화면 구현 -->
			<div class="login_popup" id="login_popup">
				<button class="login_up_button siz sib" type="button" id="log-btn">가입</button>
				<div class="join-window">
	
					<!-- 닫기버튼 -->
					<div class="close-button">
						<button onclick='javascript:login_close(); return false;s'>
							<img src="img/close.svg" width="16px" alt="" />
						</button>
					</div>
					<form action="loginSession.do" method="POST">
						<div id="login_margin">
							<!-- _logo -->
							<div class="login_logo"
								style="display: block; height: 45px; margin: 5px auto; width: 45px;">
								<img src="img/mainlogo.png" id="log-logo" />
							</div>
							<!--환영글귀-->
							<div class="open_font txtAli">
								<h2>BAAM에 오신 것을 환영합니다</h2>
							</div>
							<!--로그인 email ,pw 입력 -->
							<div class="mail">
								<div class="mail_logo">
									<img src="img/mail.svg" width="20px" alt="">
								</div>
								<input type="text" name="mail" class="login_mail" placeholder="이메일주소">
							</div>
							<div class="lock">
								<div class="lock_logo">
									<img src="img/lock.svg" width="20px" alt="">
								</div>
								<input type="password" name="pwd" class="login_pwd" placeholder="비밀번호">
							</div>
							<!-- red 로그인 button  -->
							<button class="redSignupButton siz" type="submit">
								<div>로그인</div>
							</button>
							<!-- 비밀번호 찾기 a href -->
							<div class="pw_lose txtAli">
								<a href="/password/reset/">비밀번호를 잊으셨나요?</a>
							</div>
							<!-- 라인 -->
							<div class="middle-Line"></div>
							<!-- 라인 -->
							<!-- 가입하기 a href -->
							<div class="pw_lose txtAli">
								<a href="/password/reset/">아직 Pinterest를 사용하고 있지 않으신가요? 가입하기</a>
							</div>

						</div>
					</form>
				</div>
			</div>
		</section>

		<!-- 회원가입 로그인 팝업 끝 -->
		<!-- 버튼클릭시 메시지 전송 창 -->
		<aside>
			<form action="" method="POST">
				<div class="recMail siz" id="sendMail" style="display: none;">
					<!-- 텍스트 '받은 편지함' -->
					<div class="msg">
						<strong>받은 편지함</strong>
						<div class="draw">
							<img src="img/write.svg" alt="">
						</div>
					</div>
					<!-- 텍스트 '친구들과 아이디어를 공유하세요' -->
					<div class="text_btn">
						<h4 class="text_share">친구들과 아이디어를 공유하세요</h4>
						<!-- 버튼 폼 /메시지 창으로 이동하는 버튼 -->
						<div class="msgBtn">
							<button type="button" class="btn btn-danger">새메시지</button>
							<!-- End msgBtn -->
						</div>
					</div>
				</div>
			</form>
		</aside>
		<!-- 메시지 전송 창끝 -->

 <!-- 제품 섹션 시작 -->
    <section id="team" class="py-5 bg-light">
      <div class="container" style="display : flex">
        <div class="row">
          <!-- Item forEach Start -->
          <c:forEach items="${itemList }" var="List" varStatus="status">
          <div class="col-md-4 col-lg-3 col-sm-6 my-3">
            <div class="card">
<!--       <img src="https://shopping-phinf.pstatic.net/main_1164266/11642661041.20170614110340.jpg" alt="member" class="card-img-top" /> -->
			<img src="${List.image }" alt="member" class="card-img-top"/>
              <div class="card-body">
                <h5 class="card-title text-capitalize">${List.title }</h5>
                <p class="card-text">
                  쇼핑몰 : ${List.mallName }
                  최저가 : ${List.lprice }원
                </p>
         	</div>
         		<a href="${List.link }" class="btn btn-outline-warning text-uppercase">press here</a>
         		<c:if test="${not empty UserInfo }"> 

         		  <div class="dropdown" style="width:100%; display : flex;">
                  
                  <button id="btn${status.index}" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown">보드 선택</button> 
                 
                  <div id="down-menu${status.index}" class="dropdown-menu">
                  		<!-- 유저당 카테고리 forEach Start : 시작시 가지고 있어야함 Start.do-->
						<c:forEach begin="0" end="15" var="i">
						<c:if test="${not empty UserInfo.favorite[i]}">
                        <li class="dropdown-item">${UserInfo.favorite[i] }</li> 
                        <!-- 유저당 카테고리 forEach End -->
                        </c:if> 
                        </c:forEach>
                  </div>
					<button id="pinSave${status.index}" type="button" data-value="${List }"
					data-bno="${List.bno }" data-title="${List.title }" data-link="${List.link }" data-image="${List.image }" 
					data-lprice="${List.lprice }" data-hprice="${List.hprice }" data-mallname="${List.mallName }" data-productid="${List.productId }" 
					data-producttype="${List.productType }" data-category="${List.category }" data-count="${List.count }" class="pinSave btn btn-outline-primary" style="width:100%">Pin 저장</button>
         		</div> 
				</c:if>
              <div
                class="card-footer bg-secondary d-flex justify-content-around"
              >
                <a href=""><i class="fab fa-facebook fa-2x text-dark"></i></a>
                <a href=""><i class="fab fa-twitter fa-2x text-dark"></i></a>
                <a href=""><i class="fab fa-youtube fa-2x text-dark"></i></a>
                <a href=""><i class="fab fa-google fa-2x text-dark"></i></a>
              </div>
              </div>
            </div>
          </c:forEach>
          <!-- Item forEach End -->
          </div>
          </div>
    </section>
    <!-- 제품 섹션 끝 -->

	<!-- add Pin 80%size Modal at Center Start -->
	<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-80size modal-center" role="document">
	    <div class="modal-content modal-80size">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">보드선택</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body" style="display: inline-flex">
	        <div id="left-body" style="width:100%; height:100%;">
	        <img  id="pinImg" style="max-width:100%; height:auto;" src="">
	        </div>
	        <div id="right-body" style="width:100%; height:100%;">
	       <button type="button" class="btn btn-outline-white text-dark" style="width:100%; height:100%;" onClick="javascript:addBoard();">
	        <img src="img/addPin.svg">&nbsp;보드 만들기
	       </button>
	       </div>
	       <div id="write-addboard" style="display : none; width:100%; height:100%;">
	       이름<br>
	       <input type="text" class="form-control" id="inputPinName" placeholder="예: '가고 싶은 곳' 또는 '조리법'"/>
	       </div>
	      </div>
	      <div class="modal-footer">
	        <button id="closeBoard" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button id="cancelBoard" type="button" class="btn btn-default" style="display : none" onClick="javascript:cancelBoard();">취소</button>
	        <button id="addBoard" type="button" class="btn btn-default" style="display : none" onClick="javascript:addBoard();">만들기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- add Pin 80%size Modal at Center End -->

		<!--검색어가 없는 페이징 부트스트랩 시작 -->
		<c:if test="${empty sch }">
		<section id="paging" class="py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="col">
					<ul class="pagination">
						
						<c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link" href="Start.do?page=${pageMaker.startPage-pageMaker.pageSize }">Previous</a></li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="page">
						<c:choose>
						<c:when test="${page==pageMaker.currPage }"><li class="page-item active"><a class="page-link" href="#">${page }</a></li></c:when>
						<c:otherwise><a class="page-link" href="Start.do?page=${page }">${page }</a></c:otherwise>
						</c:choose>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
						<li class="page-item">
						<a class="page-link" href="Start.do?page=${pageMaker.endPage+1 }">Next</a>
						</li>
						</c:if>
						
					</ul>
				</div>
			</div>
		</div>
		</section>
		</c:if>
		<!-- 검색어가 없는 페이징 부트스트랩 시작 -->

		<!--검색어가 있는 페이징 부트스트랩 시작 -->
		<c:if test="${not empty sch }">
		<section id="paging" class="py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="col">
					<ul class="pagination">
						
						<c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link" href="ItemSearch.do?page=${pageMaker.startPage-pageMaker.pageSize }">Previous</a></li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="page">
						<c:choose>
						<c:when test="${page==pageMaker.currPage }"><li class="page-item active"><a class="page-link" href="#">${page }</a></li></c:when>
						<c:otherwise><a class="page-link" href="ItemSearch.do?sch=${sch }&page=${page }">${page }</a></c:otherwise>
						</c:choose>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
						<li class="page-item">
						<a class="page-link" href="ItemSearch.do?page=${pageMaker.endPage+1 }">Next</a>
						</li>
						</c:if>
						
					</ul>
				</div>
			</div>
		</div>
		</section>
		</c:if>
		<!-- 검색어가 있는 페이징 부트스트랩 시작 -->

  <footer class="container text-secondary ml-auto ">
    <p>&copy; Copyright 2019, YOUDIED Co.Ltd,.</p>
  </footer>
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
</body>
</html>