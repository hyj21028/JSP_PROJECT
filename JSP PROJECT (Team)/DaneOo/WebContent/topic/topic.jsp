<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="css/topic.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Topic</title>
</head>
<body>
    <header id="mainHeader" class="mainHeader">
        <nav id="main-navi" class="navbar navbar-expand-lg navbar-dark ">
            <a class="dangerouslyDisableFocusStyle " href="#" class="navbar-brand mr-auto">
                <img src="" /></a>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item" id="navi-item">
                        <div role="combobox" aria-haspopup="listbox" aria-owns="SuggestiosMenu" aria-expanded="false"
                            class="searchMenu">
                            <div class="searchForm gap disp siz ali jtc">
                                <div class="searchImg">
                                    <img src="img/magnifier.svg" /></div>
                                <div class="searchTxt">
                                    <input type="text" class="form-control" id="inputSearch" placeholder="검색" />
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item" id="navi-item">
                        <div class="gap disp siz ali jtc">
                            <a class="dangerouslyDisableFocusStyle" id="a" href="#">홈</a></div>
                    </li>
                    <li class="nav-item" id="navi-item">
                        <div class="gap disp siz ali jtc"><a class="dangerouslyDisableFocusStyle" id="a"
                                href="#">팔로잉</a>
                        </div>
                    </li>
                    <li class="nav-item" id="navi-item">
                        <div class="gap disp siz ali jtc"><a class="dangerouslyDisableFocusStyle" id="a" href="#">
                                <img src="img/id.svg"></a>
                        </div>
                    </li>
                    <div class="right-line gap disp siz jtc">
                        <div class="right"></div>
                    </div>
                    <li class="nav-item" id="navi-item">
                        <div class="gap disp siz ali jtc">
                            <a class="dangerouslyDisableFocusStyle" id="a" href="#"><img src="img/mailInfo.svg" /></a>
                        </div>
                    </li>
                    <li class="nav-item" id="navi-item">
                        <div class="gap disp siz ali jtc">
                            <a class="dangerouslyDisableFocusStyle" id="a" href="#"><img src="img/bell.svg" /></a>
                        </div>
                    </li>
                    <li class="nav-item" id="navi-item">
                        <div class="gap disp siz ali jtc">
                            <a class="dangerouslyDisableFocusStyle" id="a" href="#"><img src="img/alarm.svg" /></a>
                        </div>
                    </li>
                </ul>
                <div class="bottom-line">
                    <div class="bottom"></div>
                </div>
        </nav>
    </header>
    <section>
        <div class="profile disp">
            <div class="make"><a href="" id="a"><img src="img/make.svg" alt=""></a></div>
            <div class="profUp"><a href="" id="a"><img src="img/profileUpdate.svg" alt=""></a></div>
            <div class="sharesns"><a href="" id="a"><img src="img/shareSNS.svg" alt=""></a></div>
        </div>
        <div class="personInfo">
            <div class="fol">
                <h2>${UserInfo.mail }</h2>
                팔로워 명 &#183; 팔로잉 명
            </div>
        </div>
        <div class="userPhoto">
            <img src="img/member.png" alt="">
        </div>
        <div class="selectLink">
            <a href="">보드</a>
            <a href="">핀</a>
            <a href="">시도</a>
            <a href="">주제</a>
        </div>
    </section>

 	<!-- 제품 섹션 시작 -->
    <section id="team" class="py-5 bg-light">
      <div class="container-fluid" style="display : flex">
        <div class="row">
		<!-- Item forEach Start -->
          <c:forEach items="${flist }" var="List" varStatus="status">
          <div class="col-md-2 col-lg-2 col-sm-2 my-3">
            <div class="card">
<!--       <img src="https://shopping-phinf.pstatic.net/main_1164266/11642661041.20170614110340.jpg" alt="member" class="card-img-top" /> -->
			<img src="${List.image }" alt="member" class="card-img-top"/>
              <div class="card-body">
                <h5 class="card-title text-capitalize">${List.title }</h5>
                <p class="card-text">
                  넘버 : ${List.bno }
                  쇼핑몰 : ${List.mallName }
                  최저가 : ${List.lprice }원
                  최저가 : ${List.hprice }원
                  ID : ${List.productId }
                  Type : ${List.productType }
                  Tag : ${List.favorite }
                </p>
         	</div>
         		<a href="${List.link }" class="btn btn-outline-warning text-uppercase">press here</a>
<%--          		<c:if test="${not empty UserInfo }">  --%>
<!--          		  <div class="dropdown" style="width:100%; display : flex;"> -->
                  
<%--                   <button id="btn${status.index}" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown">보드 선택</button>  --%>
                 
<%--                   <div id="down-menu${status.index}" class="dropdown-menu"> --%>

<%-- 						<c:forEach begin="0" end="15" var="i"> --%>
<%--         				<c:if test="${UserInfo.favorite[i] ne '0'}">  --%>
<%--                         <li><a class="dropdown-item"  href="#">${UserInfo.favorite[i] }</a></li>  --%>

<%--                         </c:if>  --%>
<%--                         </c:forEach> --%>
<!--                   </div> -->
<%-- 					<button id="pinSave${status.index}" type="button" data-value="${List }" --%>
<%-- 					data-bno="${List.bno }" data-title="${List.title }" data-link="${List.link }" data-image="${List.image }"  --%>
<%-- 					data-lprice="${List.lprice }" data-hprice="${List.hprice }" data-mallname="${List.mallName }" data-productid="${List.productId }"  --%>
<%-- 					data-producttype="${List.productType }" class="pinSave btn btn-outline-primary" style="width:100%">Pin 저장</button> --%>
<!--          		</div>  -->
<%-- 				</c:if> --%>
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
    제품 섹션 끝
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
</body>
</html>