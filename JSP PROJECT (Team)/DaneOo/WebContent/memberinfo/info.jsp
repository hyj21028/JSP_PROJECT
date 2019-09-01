<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 head 태그의 처음에 와야합니다 -->
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap"
	rel="stylesheet" />
<link rel="short icon" href="img/mainlogo.png" type="image/x-icon">
<link rel="stylesheet" href="css/info.css" />
<link rel="stylesheet" href="css/logout.css" />
<script src="js/all.js"></script>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/info_exec.js"></script>
<!-- 위 3개의 메타 태그는 head 태그의 처음에 와야합니다 -->
<title>DaneOO</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />

</head>

<body>
	<header id="mainHeader" class="mainHeader">
    <nav id="main-navi" class="navbar navbar-expand-lg navbar-dark ">
      <a class="dangerouslyDisableFocusStyle apoint " href="#" class="navbar-brand mr-auto">
        <img src="img/mainlogo.png" style="width: 50px;"></a>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
          <li class="nav-item" id="navi-item">
            <div role="combobox" aria-haspopup="listbox" aria-owns="SuggestiosMenu" aria-expanded="false"
              class="searchMenu">
              <div class="searchForm gap disp siz ali jtc">
                <div class="searchImg">
                  <img src="img/magnifier.svg" /></div>
                <div class="searchTxt" style="display:flex">
                  <input type="text" class="form-control" id="inputSearch" placeholder="검색" >
		  		<button id="Btn" class="btn-default" onClick="javascript:Enter_Check(); return false;">검색</button>			
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <div class="collapse navbar-collapse apoint " id="collapsibleNavbar">
        <ul class="navbar-nav apoint">
          <li class="nav-item">
            <div class="home  gap disp siz ali jtc">
              <a class="toHome" href="main_board/main_itemList.jsp">홈</a></div>
          </li>
          <li class="nav-item ">
            <div class="following gap disp siz ali jtc">
              <a class="toFollowing " href="#">팔로잉</a>
            </div>
          </li>

          <c:if test="${not empty UserInfo }">
          <li class="nav-item " id="userMail">
            <div class="memId  gap disp siz ali jtc">
              <a class="toId " href="topic.do">
                <img src="img/id.svg">${UserInfo.mail }</a>
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
              <a class="toAlarm" id="toAlarm" href="#"><img src="img/alarm.svg" /></a>
            </div>
          </li>
        </ul>
        <div class="bottomline">
          <div class="bottom"></div>
        </div>
      </div>
    </nav>
  </header>
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
	<!-- 로그아웃 창 -->
	<div class="logoutForm" style="display: none; z-index: 1;">
		<div class="container">
			<!-- '홈피드 수정' 폼 -->
			<div class="BTNout" OnClick="window.location.href='';">
				<div class="BTNSet">
					<strong>홈피드 수정</strong>
				</div>
			</div>
			<div class="subLine"></div>
			<!-- '설정 수정' 폼 -->
			<div class="BTNout" OnClick="window.location.href='';">
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
			<div class="BTNout" OnClick="window.location.href='로그아웃세션';">
				<div class="BTNSet">
					<strong>로그 아웃</strong>
					<div class="log-out-text">로그아웃을 하면 아이디어를 저장하거나 맞춤형 홈피드를 둘러볼 수
						없게 됩니다.</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그아웃 창 끝 -->
	<aside class="side">
		<div class="sideMenu apoint">
			<!-- 프로필 수정 -->
			<div class="profup">
				<img src="img/pen.svg" alt="">
				<a href="#" onClick="javascript:update_open(); return false;">프로필 수정</a>
			</div>
			<!--계정 설정 -->
			<div class="userset">
				<img src="img/user.svg" alt="">
				<a href="#" onClick="javascript:user_open(); return false;">계정 설정</a>
			</div>
			<!-- 알림  -->
			<div class="alam">
				<img src="img/alam.svg" alt="">
				<a href="#" onClick="javascript:postit_open(); return false;">알림</a>
			</div>
			<!-- 개인정보 보호  -->
			<div class=" private">
				<img src="img/private.svg" alt="">
				<a href="#" onClick="javascript:personal_open(); return false;">개인정보 보호 및 데이터</a>
			</div>
			<!-- 보안  -->
			<div class="security">
				<img src="img/security.svg" alt="">
				<a href="#" onClick="javascript:sec_open(); return false;">보안</a>
			</div>
		</div>
	</aside>
	<section>
		<form class="profile" method="post" action="memUpdateService.do">
			<div class="memberUpdate siz" id="memberUpdate">
				<!-- 프로필 수정 -->
				<div class="select">
					<h1>프로필 수정</h1>
					<label for="info">사용자들이 아래의 정보로 회원님을 파악하게 됩니다.</label>
					<button type="button" class="btn btn-secondary " onclick="javascript:update_close(); return false;">취소</button>
					<button type="submit" class="btn btn-secondary " onclick="" >완료</button>
				</div>
				<div class="profphoto">
					<label for="photo">사진</label> <img src="img/member.png" alt="">
					<button type="button" class="btn btn-secondary" onclick="">변경</button>
				</div>
				<div class="form-row">
					<div class="form-group col-md-5">
						  <label for="inputFirst">비밀번호</label>
                        <input type="password" name="svdpassword" class="form-control" value="${member.pwd}" placeholder="password">
                    </div>
                    <div class="form-group col-md-5">
                        <label for="inputLast">비밀번호 중복확인</label>
                        <input type="password" name="ckpassword" class="form-control" placeholder="중복확인" >
                    </div>
					<div class=" form-group col-md-5">
						<label for="userName">사용자 이름</label>
						<div class="homp">
							www.baam.co.kr/ <input type="text" name="mail" class="form-control"
								value="${member.mail}" readonly>
						</div>
					</div>
					<div class="form-group col-md-10">
						<label for="profileInfo">프로필 정보</label>
						<textarea class="form-control" id="profileInfo" rows="5" name="content" >${member.content}</textarea>
					</div>
					<div class="form-group col-md-10">
						<label for="location">위치</label> <input class="form-control"
							type="text" placeholder="예:Busan,bu" value="${member.loc}" name="loc" >
					</div>
				</div>
			</div>
		</form>
	</section>
	<!-- 회원수정 끝 -->
	<!-- 계정설정 시작 -->
	<section>
		<form class="userInfom" action="memDelete.do" method="post">
			<div class="user apoint" id="user">
				<div class="select">
					<h1>계정 설정</h1>
					<label for="info">로그인 환경을 설정하면 맞춤형 서비스를 제공하는데 도움이 됩니다.<br>
						여기에서 계정을 크게 달라지게 할 수 있습니다.
					</label>
					<button type="button" class="btn btn-secondary " onclick="javascript:user_close(); return false;">취소</button>
					<button type="submit" class="btn btn-secondary " onclick="">완료</button>
				</div>
				<div class="bas form-row">
					<div class="form-group col-md-8">
						<h3>기본 정보</h3>
						<label for="inputFirst">이메일 주소</label> <input type="email"
							class="form-control" value="${member.mail}"
							placeholder="example@example.com">
						<button type="button" class="btn btn-secondary pwdChange"
							onclick="">번호변경</button>
					</div>
				</div>
				<div class="checks">
					<h4>성별</h4>
					<input id="radio1" name="radio" type="radio" class="radio"
						checked="checked"> <label for="radio1">남성</label> <input
						id="radio2" name="radio" type="radio" class="radio"> <label
						for="radio2">여성</label> <input id="radio3" name="radio"
						type="radio" class="radio"> <label for="radio3">사용자지정</label>
				</div>
				<div class="bottom-line"></div>
				<div class="userDelete">
					<h3>계정 변경</h3>
					<label for="info">계정 및 계정 데이터 삭제</label>
					<button type="submit" class="btn btn-secondary ">계정해지</button>
				</div>
			</div>
		</form>
	</section>
	<!-- 계정설정  끝 -->
	<!-- 알림 시작 -->
	<section>
		<form class="notice" method="post">
			<div class="postit apoint" id="postit">
				<div class="not">
					<h1>알림</h1>
					<label for="info">중요한 변경사항에 대해서는 항상 알려드립니다.<br> 이외에도
						무엇에 대해 소식을 받고 싶은지 선택하세요.<a id="a" class="detail" href="">자세히
							알아보기</a></label>
					<button type="button" class="btn btn-secondary " onclick="javascript:postit_close(); return false;">취소</button>
					<button type="submit" class="btn btn-secondary " onclick="">완료</button>

					<div class="bottom-line"></div>
					<div class="fromSite">
						<h3>BAAM에서</h3>
						<label for="info">앱 또는 사이트에 표시할 알림을 선택하시오.<a id="a"
							class="detail" href="">자세히 알아보기</a></label>
						<button type="button" class="btn btn-secondary " onclick="">수정</button>
					</div>
					<div class="bottom-line"></div>
					<div class="toMail">
						<h3>이메일로</h3>
						<label for="info">이메일로 받을 알림을 선택하세요<a id="a"
							class="detail" href="">자세히 알아보기</a></label>
						<button type="button" class="btn btn-secondary " onclick="">수정</button>
					</div>
					<div class="bottom-line"></div>
					<div class="toPush">
						<h3>푸시알림으로</h3>
						<label for="info">휴대폰 또는 컴퓨터에서 받을 알림을 선택하시오<a id="a"
							class="detail" href="">자세히 알아보기</a></label>
						<button type="button" class="btn btn-secondary " onclick="">수정</button>
					</div>
				</div>
			</div>
		</form>
	</section>
	<!-- 알림 끝 -->
	<!-- 개인 정보 보호 시작 -->
	<section>
		<form class="personalInfo" action="" method="post">
			<div class="personal apoint" id="personal">
				<div class="protect">
					<h1>개인정보 보호 및 데이터</h1>
					<label for="info">BAAM 프로필을 검색 엔진에서 숨길지 여부와 표시되는<br>
						광고 및 추천에 사용될 수 있는 데이터 종류를 결정해주세요<a id="a" class="detail" href="">자세히
							알아보기</a></label>
					<button type="button" class="btn btn-secondary " onclick="javascript:personal_close(); return false;">취소</button>
					<button type="submit" class="btn btn-secondary " onclick="">완료</button>
				</div>
				<div class="searchProtect">
					<h3>검색 개인정보 보호</h3>
					<label for="info">검색 엔진에서 프로필 숨기기(예:Google)<a id="a"
						class="detail" href="">자세히 알아보기</a></label>
					<div class="checks">
						<input type="checkbox" id="ex_chk"> <label for="ex_chk"></label>
					</div>
					<div class="bottom-line"></div>
				</div>
			</div>
		</form>
	</section>
	<!-- 개인 정보 보호 끝 -->
	<!-- 보안 시작 -->
	<section>
		<form class="scan" action="">
			<div class="sec" id="sec">
				<div class="secur apoint">
					<h1>보안</h1>
					<label for="info" class="info">이중 인증을 켜고 연결된 기기 목록을 확인하여
						계정,핀, 보드를 안전하게 지키세요 <a  class="detail" href="">자세히알아보기</a>
					</label><br>
					<br> <label for="info" class="info">이중 인증을 사용하려면 먼저<a
						 class="mailCheck" href="">이메일 주소를 확인</a>해야합니다.
					</label>
					<div class="bottom-line"></div>
				</div>
				<div class="contactMuchine">
					<label for="info" class="info">회원님의 계정에 로그인한 기기목록입니다. 회원님이
						로그인하지 않은 세션을 종료하세요</label>
				</div>
			</div>
		</form>
	</section>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</body>


</html>