<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("Cache-Control", "no-store");//name 헤더 값을 value로 지정
	response.setHeader("pragma", "no-chahe");
	response.setDateHeader("Expires", 0);// name 헤더 값을 date로 지정
%>

<!doctype html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="bookInfo.css">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0 , maximum-scale=1.0">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="short icon" href="images/book.ico" type="image/x-icon">
</head>
<body>
	<!-- 회원가입-->
	<div id="join-popup" class="join-popup">
		<div class="join-window">
			<div class="close-button">
				<button onclick="join_close()">
					<img src="images/close.svg" width="16px" alt="">
				</button>
			</div>
			<div class="fbook-login form">
				<div class="logo">
					<img src="images/facebook.svg" width="18px" alt="">
				</div>
				<div>페이스북 계정으로 가입</div>
			</div>
			<div class="google-login form">
				<div class="logo">
					<img src="images/google.svg" width="18px" alt="">
				</div>
				<div>구글 계정으로 가입</div>
			</div>
			<div class="line-combo">
				<div class="line-left"></div>
				<span>또는</span>
				<div class="line-right"></div>
			</div>
			<div class="mail-login form">
				<div class="logo">
					<img src="images/mail.svg" width="18px" alt="">
				</div>
				<div class="join_mail">
					<a href="#" onclick="email_open();">이메일로 회원가입</a>
				</div>
			</div>
			<div class="line-combo">
				<div class="line"></div>
			</div>
			<div class="text-bottom">
				<span> 계정이 있나요?</span> <a href="#"
					onclick="login_open();"> 로그인</a>
			</div>
		</div>
	</div>
	<!-- 회원 정보 기입 및 가입 -->
	<div id="member-join-popup" class="member-join-popup">
		<div class="member-join-window">
			<div class="close-button">
				<button onClick="javascript:member_join_close();">
					<img src="images/close.svg" width="16px" alt="" />
				</button>
			</div>
			<form id="form_MemInsert" name="form_MemInsert" onSubmit="javascript:return false;">
				<div class="form-row">
					<div class="form-group col-lg-12 col-md-12 col-sm-12">
						<label for="inputFirstName">FirstName</label> 
						<input type="text" class="form-control" id="inputFirstName" name="inputFirstName" placeholder="이름" value="" required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="form-group col-lg-12 col-md-12 col-sm-12">
						<label for="inputLastName">LastName</label> 
						<input type="text" class="form-control" id="inputLastName" name="inputLastName" placeholder="성" value="" required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="form-group col-lg-12 col-md-12 col-sm-12">
						<label for="inputMemId">MEMBER ID</label> 
						<input type="text"class="form-control" id="inputMemId" name="inputMemId" placeholder="관리자아이디" value="" required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="form-group col-lg-12 col-md-12 col-sm-12">
						<label for="inputPassword">Password</label>
						<div class="lock_logo">
							<img src="images/lock.svg" width="20px" alt="" />
						</div>
						<input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" />
					</div>
					<div class="form-group col-lg-12 col-md-12 col-sm-12">
						<label for="inputEmail">Email</label>
						<div class="mail_logo">
							<img src="images/mail.svg" width="20px" alt="" />
						</div>
						<input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="Email" />
					</div>
					<a href="#" type="button" class="btn btn-danger" onClick='javascript:memInsertData();'>회원가입</a>
					<a href="#" type="button" class="btn btn-primary" onClick='javascript:memberUpdate();'>정보수정</a>
					<a href="#" type="button" class="btn btn-info" onClick='javascript:memberDelete();'>정보삭제</a>
					<div id="memInsert_msg"></div>
				</div>
			</form>
		</div>
	</div>
	<!-- 회원 정보 기입 끝 -->
	<!-- 회원 정보 수정 -->
	<div id="member-update-popup" class="member-update-popup">
		<div class="member-update-window">
			<div class="close-button">
				<button onclick="javascript:memberUpdate_close();">
					<img src="images/close.svg" width="16px" alt="" />
				</button>
			</div>
			<form name="form_MemUpdate" name="form_MemUpdate" onSubmit="javascript:return false;">
				<div class="form-row">
					<div class="form-group col-lg-12 col-md-12 col-sm-12">
						<label for="UpId">MEMBER ID</label> <input
							type="text" class="form-control" id="updateMemId" name="updateMemId"
							placeholder="관리자아이디" value="" required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="form-group col-lg-6 col-md-6 col-sm-6  ">
						<label for="upFirstName">FirstName</label> <input type="text"
							class="form-control" id="updateFirstName" name="updateFirstName" placeholder="이름"
							value="" required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="form-group col-lg-6 col-md-6 col-sm-6">
						<label for="UpLastName">LastName</label> 
						<input type="text" class="form-control" id="updateLastName" name="updateLastName"placeholder="성" value="" required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="form-group col-lg-12">
						<label for="UpEmail">Email</label>
						<div class="mail_logo">
							<img src="images/mail_login.svg" width="20px" alt="" />
						</div>
						<input type="email" class="form-control" id="updateEmail" name="updateEmail"
							placeholder="Email" />
					</div>
					<div class="form-group col-lg-12">
						<label for="UpPassword">Password</label>
						<div class="lock_logo">
							<img src="images/lock_login.svg" width="20px" alt="" />
						</div>
						<input type="password" class="form-control" id="updatePassword" name="updatePassword" placeholder="Password" />
					</div>
				</div>
				<a href="#" type="button" class="btn btn-primary mx-5" onclick='javascript:memUpData();'>수정</a>
				<div id="memUpdate_msg"></div>
			</form>
		</div>
	</div>
	<!-- 회원 정보 수정팝업 끝 -->
	<!-- 회원 정보 삭제팝업 끝 -->
	<div id="member-delete-popup" class="member-delete-popup">
		<div class="member-delete-window">
			<div class="close-button">
				<button onclick="javascript:memberDelete_close()">
					<img src="images/close.svg" width="16px" alt="" />
				</button>
			</div>
			<form name="form_MemDelete" name="form_MemDelete" onSubmit="javascript:return false;">
				<div class="form-row">
					<div class="form-group col-lg-4 col-md-4 col-sm-4">
						<label for="DelMemId">MEMBER ID</label> 
						<input type="text" class="form-control" id="deleteMemId" name="deleteMemId"style="width:200px" placeholder="관리자아이디" value="" required />
						<div class="valid-feedback">Looks good!</div>
						<a href="#" type="button" class="btn btn-warning text-light mx-5" onclick='javascript:memDelData();'>삭제</a>
						<div id="memDelete_msg"></div>
					</div>
				</div>			
			</form>
		</div>
	</div>
	<!-- 삭제팝업 끝 -->
	<!-- 로그인  -->
	<div id="login-popup" class="login-popup">
		<div class="login-window">
			<div class="close-button">
				<button onclick="javascript:login_close()">
					<img src="images/close.svg" width="16px" alt="">
				</button>
			</div>
			<div class="fbook-login form">
				<div class="logo">
					<img src="images/facebook.svg" width="18px" alt="">
				</div>
				<div>페이스북 계정으로 로그인</div>
			</div>
			<div class="google-login form">
				<div class="logo">
					<img src="images/google.svg" width="18px" alt="">
				</div>
				<div>구글 계정으로 로그인</div>
			</div>
			<div class="line-combo">
				<div class="line-left"></div>
				<span>또는</span>
				<div class="line-right"></div>
			</div>
			<div class="login-text">
				<div class="mail">
					<div class="mail_logo">
						<img src="images/email.svg" width="20px" alt="">
					</div>
					<input type="text" name="LoginEmail" class="email_input" id="LoginEmail"
						placeholder="이메일주소">
				</div>
				<div class="lock">
					<div class="lock_logo">
						<img src="images/lock.svg" width="20px" alt="">
					</div>
					<input type="password" name="LoginPwd" class="pw_input" id="LoginPwd"
						placeholder="비밀번호">
				</div>
				<div class="check">
					<input type="checkbox" id="ck1" checked="checked" name="pw_save"
						style="margin-bottom: 15px"> <label for="ck1">
						비밀번호 저장</label> <a href=" "> 비밀번호 보기</a>
				</div>
				<div class="tellog">
					<a href="">전화번호로 로그인</a> &#183; <a href="">비밀번호가 생각나지 않으세요?</a>
				</div>
				<div class="login form">
					<div>
						<a href="#" onclick='javascript:member_login();'>로그인</a>
					</div>
				</div>
			</div>
			<div class="line-combo">
				<div class="line"></div>
			</div>
			<div class="text-bottom">
				<span>계정이 없으세요?</span> <a href="#"
					onclick='javascript:join_login_open();'>회원가입</a>
			</div>
		</div>
	</div>
	<!-- 로그인 화면 끝 -->
	<header id="main-page" class="main-page">
		<nav id="main-navi" class="navbar navbar-expand-lg navbar-dark  ">
			<a href="#" class="navbar-brand mr-auto"><img
				src="images/bookLINK.svg"></a>

			<button class="navbar-toggler ml-auto" type="button"
				data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item" id="navi-item"><div id="admin_signup">
							<a class="nav-link active" href="javascript:void(0)"
								onclick="javascript:join_open();">관리자가입</a>
						</div></li>
					<li class="nav-item" id="navi-item"><div id="admin_login">
							<a class="nav-link active" href="javascript:void(0)"
								onclick="javascript:login_open();">로그인</a>
						</div></li>
					<li class="nav-item" id="navi-item"><div id="admin_logout">
							<a href="logout_session.jsp" class="nav-link active"
								href="javascript:void(0)" onclick="javascript:member_logout();">로그아웃</a>
						</div></li>
					<li class="nav-item" id="navi-item"><div id="data_insert">
							<a class="nav-link active" href="javascript:void(0)"
								onclick="javascript:insert_open();">자료추가</a>
						</div></li>
					<li class="nav-item" id="navi-item"><div id="data_update">
							<a class="nav-link active" href="javascript:void(0)"
								onclick="javascript:update_open();">자료수정</a>
						</div></li>
					<li class="nav-item" id="navi-item"><div id="data_delete">
							<a class="nav-link active" href="javascript:void(0)"
								onclick="javascript:delete_open();">자료삭제</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- 네비게이터 끝 -->
	<!-- 도서관 책로고 -->
	<section>
		<div class="box">
			<a href="#"><img src="images/bookLINK.svg"> <span>NNG도서관</span>
			</a>
			<div id="firstId" class="title-underline bg-white"></div>
		</div>

		<!-- 기타  -->
		<div class="selectMenu">
			<ul id="menuNavi">
				<li id="manulink"><a href="">
						<div class="bookSEARCH">
							<em><img src="images/magnifier.svg" alt=""></em><br> <span>소장자료검색</span>
							<div class="bookSe">Book Search</div>
						</div>
				</a></li>
				<li id="manulink"><a href="">
						<div class="newBOOK">
							<em><img src="images/books.svg" alt=""></em><br> <span>신착도서</span>
							<div class="newBook">New Book</div>
						</div>
				</a></li>
				<li id="manulink"><a href="">
						<div class="bookAPP">
							<em><img src="images/monitor.svg" alt=""></em><br> <span>희망도서신청</span>
							<div class="bookApp ">Book Application</div>
						</div>
				</a></li>
				<li id="manulink"><a href="">
						<div class="bookBUSAN">
							<em><img src="images/busan.svg" alt=""></em><br> <span>부산시통합검색</span>
							<div class="bookBusan">Busan Integrated Search</div>
						</div>
				</a></li>
			</ul>
		</div>
	</section>
	<!--정보 삽입 팝업  -->
	<aside>
		<div id="insert-popup" class="insert-popup">
			<div class="insert-window">
				<div class="close-button">
					<button onclick="insert_close()">
						<img src="images/close.svg" width="16px" alt="">
					</button>
				</div>
				<form id="form_insert" name="form_insert"
					onSubmit="javascript:return false;">
					<fieldset style="width: 300px;">
						<legend>INSERT</legend>
						<label>청구번호: <input type='text' name='txt_insert_symbol'
							id='txt_insert_symbol' size='10' value='' maxlength='10'
							style='width: 140px; font-size: 50; text-align: left;'></label><br>
						<label>책이름: <input type='text' name='txt_insert_name'
							id='txt_insert_name' size='10' value='' maxlength='10'
							style='width: 140px; font-size: 50; text-align: left;'></label><br>
						<label>저자명: <input type='text' name='txt_insert_author'
							id='txt_insert_author' size='25' value='' maxlength='25'
							style='width: 140px; font-size: 50; text-align: left;'></label><br>
						<label>출판사: <input type='text' name='txt_insert_publisher'
							id='txt_insert_publisher' size='10' value='' maxlength='10'
							style='width: 140px; font-size: 50; text-align: left;'></label>
						<div id="insert_msg"></div>
						<div style="position: absolute; left: 280px; top: 130px;">
							<button id="insertBtn">
								<img src='images/input.jpg' width='20' height='20'
									onClick='javascript:InsertData();'>
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<!-- 삽입 팝업 끝 -->
		<!-- 수정 팝업 시작-->
		<div id="update-popup" class="update-popup">
			<div class="update-window">
				<div class="close-button">
					<button onclick="update_close()">
						<img src="images/close.svg" width="16px" alt="">
					</button>
				</div>
				<form name="form_update" onSubmit="javascript:return false;">
					<fieldset style="width: 300px;">
						<legend>책정보수정</legend>
						<label>청구번호: <input type='text' name='txt_update_symbol'
							id='txt_update_symbol' size='10' value='' maxlength='10'
							style='width: 140px; font-size: 50; text-align: left; background-color: #ccc'
							disabled></label><br> <label>도서명: <input type='text'
							name='txt_update_name' id='txt_update_name' size='10' value=''
							maxlength='10'
							style='width: 140px; font-size: 50; text-align: left;'></label><br>
						<label>저자명: <input type='text' name='txt_update_author'
							id='txt_update_author' size='10' value='' maxlength='25'
							style='width: 140px; font-size: 50; text-align: left;'></label><br>
						<label>출판사명: <input type='text'
							name='txt_update_publisher' id='txt_update_publisher' size='10'
							value='' maxlength='10'
							style='width: 140px; font-size: 50; text-align: left;'></label>
						<div id="update_msg"></div>
						<div style="position: absolute; left: 280px; top: 130px;">
							<button id="updateBtn">
								<img src='images/input.jpg' width='20' height='20'
									onClick='javascript:UpdateData();'>
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<!-- 수정팝업 끝 -->
		<!-- 삭제팝업 끝 -->
		<div id="delete-popup" class="delete-popup">
			<div class="delete-window">
				<div class="close-button">
					<button onclick="delete_close()">
						<img src="images/close.svg" width="16px" alt="">
					</button>
				</div>
				<form name="form_delete" onSubmit="javascript:return false;">
					<fieldset style="width: 300px;">
						<legend>DELETE</legend>
						<label>도서명: <input type='text' name='txt_delete_name'
							id='txt_delete_name' size='10' value='' maxlength='10'
							style='width: 140px; font-size: 50; text-align: left; background-color: #ccc;'
							disabled></label>
						<div id="delete_msg"></div>
						<div style="position: absolute; left: 280px; top: 75px;">
							<button id=deleteBtn>
								<img src='images/input.jpg' width='20' height='20'
									onClick='javascript:DeleteData();'>
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</aside>
	<!-- 삭제팝업 끝 -->
	<!-- subpage 시작 -->
	<!-- 검색창시작 -->
	<main class="sub-page" id="sub-page">
	<div class="container">
		<form name="form_search" onSubmit="javascript:return false;">
			<div class="input-form">
				<div class="form-title">어떤 도서를 찾고 싶으신가요?</div>
				<input class="form form-1" name='txt_book_name' type="text"
					placeholder="검색어를 입력하세요">
				<div class="button">
					<button id="searchBtn" onClick='javascript:searchData();'>검색</button>
				</div>
			</div>
			<div id='div_res'>
				<table border='0' cellpadding='10' cellspacing='0'>

				</table>
			</div>
		</form>
	</div>
	</main>
	<footer class="container text-info ml-auto ">
		<p>&copy; Copyright 2019-2021</p>
	</footer>
	<!--  관리자 정보 관련 자바스크립트-->
	<script src="./member_info.js"></script>
		<!-- 책정보 자바스크립트 -->
	<script src="./book_info.js"></script>
	<!-- <!--  관리자 정보 관련 자바스크립트
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>