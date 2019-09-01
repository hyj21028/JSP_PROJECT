//회원가입 창 호출 및 닫기
function join_close() {
  document.getElementById("join-popup").style.display = "none";
//  document.querySelector(".button_logo").style.position = "fixed";
}
function join_open() {
  document.getElementById("join-popup").style.display = "block";
//  document.querySelector(".button_logo").style.position = "static";
}
//로그인 창 호출 및 닫기
function login_close() {
  document.getElementById("login-popup").style.display = "none";
//  document.querySelector(".button_logo").style.position = "fixed"; //close 버튼 클릭시 버튼 fixed
}

function login_open() {
  document.getElementById("login-popup").style.display = "block";
//  document.querySelector(".button_logo").style.position = "static"; //로그인 버튼 클릭시 fixed 해제
}
//이메일 가입 호출 및 닫기
function member_join_open() {
  document.getElementById("member-join-popup").style.display = "block";
}
function member_join_close() {
  document.getElementById("member-join-popup").style.display = "none";
}

function email_open() {
  member_join_open();
  join_close();
}

function login_join_open() {
  // 회원가입 내 로그인 클릭시 회원가입 창 close
  login_open();
  join_close();
}

function join_login_open() {
  // 로그인 내 회원가입  클릭시 로그인 창 close
  login_close();
  join_open();
}


function member_login() { //로그인시
  join_close();
  document.getElementById("LoginEmail").value = "";
  document.getElementById("LoginPwd").value = "";
  location.herf = "login_session.jsp";
  document.getElementById("admin_signup").style.display = "none";
  document.getElementById("admin_login").style.display = "none";
  document.getElementById("admin_logout").style.display = "block";
  document.getElementById("data_insert").style.display = "block";
  document.getElementById("data_update").style.display = "block";
  document.getElementById("data_delete").style.display = "block";
   
}

function member_logout() {//로그아웃시
	  document.getElementById("admin_signup").style.display = "block;";
	  document.getElementById("admin_login").style.display = "blcok;";
	  document.getElementById("admin_logout").style.display = "none";
	  document.getElementById("data_insert").style.display = "none";
	  document.getElementById("data_update").style.display = "none";
	  document.getElementById("data_delete").style.display = "none";
}
// 관리자 수정창 열기 & 닫기
function memberUpdate() {
  member_join_close();
  document.getElementById("member-update-popup").style.display = "block";
//  docume
  nt.querySelector(".button_logo").style.position = "static";
}
function memberUpdate_close() {
  document.getElementById("member-update-popup").style.display = "none";
//  document.querySelector(".button_logo").style.position = "fixed";
}

// 관리자 삭제창 열기 & 닫기
function memberDelete() {
  member_join_close();
  document.getElementById("member-delete-popup").style.display = "block";
//  document.querySelector(".button_logo").style.position = "static";
}
function memberDelete_close() {
  document.getElementById("member-delete-popup").style.display = "none";
//  document.querySelector(".button_logo").style.position = "fixed";
}

var xhrObject;

function createXHR() {
  if (window.ActiveXObject) {
	  alert("asdfdg");
    xhrObject = new ActiveXObject("Microsoft.XMLHTTP");
  } else if (window.XMLHttpRequest) {
	  alert("asdfdg12344");
    xhrObject = new XMLHttpRequest();
    
  }
}

function memGetData() {
  var form_name = "form_MemSearch";
  var m_id = document.forms[form_name].elements["SearchMemId"].value;

  createXHR();

  var url = "./memberDB.jsp";
  var reqparam = "m_id=" + m_id;
  xhrObject.onreadystatechange = resMemGetData;
  xhrObject.open("post", url, "true");
  xhrObject.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=utf-8");
  xhrObject.send(reqparam);
}

function resMemGetData() {
  if (xhrObjects.readyState == 4) {
    if (xhrObjects.status == 200) {
      var result = xhrObjects.responseText;
      var objRes = eval("(" + result + ")");
            var num = objRes.memberInfo.length;
            			var res = "<table cellpadding='3' cellspacing='0' border='1' width='850'>";
            			var resDiv = document.getElementById("div_res");
      
            			if (num < 1) {
            				res += "<tr><td width='850' height='100' align='center'" +
            						" style='font-size:50;'>검색 결과가 없습니다.</td></tr>";
      
            			} else {
            				for (var i = 0; i < num; i++) {
      
            					var m_fname= objRes.memberInfo[i].FIRST_NAME;
            					var m_lname= objRes.memberInfo[i].LAST_NAME;
            					var m_id = objRes.memberInfo[i].MEMBERID;
            					var m_pwd = objRes.memberInfo[i].PASSWORD;
            					var m_mail = objRes.memberInfo[i].MAIL;
      
            					res += "<tr>";
      
            					res += "<td  align='center' bgcolor='#C0C0C0'>"+ m_fname + "</td>";
            					res += "<td align='center' bgcolor='#d9ffb3'>" + m_lname + "</td>";
            					res += "<td align='center' bgcolor='#FFFF33'>" + m_id + "<br></td>";
            					res += "<td align='center'bgcolor='#d5ff80'>" + m_pwd + "<br></td>";
            					res += "<td align='center'bgcolor='#d5ff80'>" + m_mail + "<br></td>";
            					res += "</tr>";
      
            				}
            			}
            			res += "</table>"
            			resDiv.innerHTML = res;
          
    }
  }
}

function searchMemData() {
  var form_name = "form_MemSearch";
  var m_id = document.forms[form_name].elements["SearchMemId"].value;

  memGetData();
} // 검색

function memInsertDB() {
  var form_name = "form_MemInsert";
  var m_fname = document.forms[form_name].elements["inputFirstName"].value;
  var m_lname = document.forms[form_name].elements["inputLastName"].value;
  var m_id = document.forms[form_name].elements["inputMemId"].value;
  var m_pwd = document.forms[form_name].elements["inputPassword"].value;
  var m_mail = document.forms[form_name].elements["inputEmail"].value;

  createXHR();

  var url = "./memInsertDB.jsp";
  var reqparam ="m_fname=" +m_fname + "&m_lname=" +m_lname + "&m_id=" +m_id + "&m_pwd=" +m_pwd + "&m_mail=" +m_mail;
  //alert("ddd");
  
  xhrObject.onreadystatechange = resMemInsertDB; // 함수를 변수로 씀
  xhrObject.open("post", url, "true");
  xhrObject.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=utf-8");
  xhrObject.send(reqparam);
}

function resMemInsertDB() {
  var resMEmInsMsg = " ";
  var resDiv = document.getElementById("memInsert_msg");
  if (xhrObjects.readyState == 4) {
    if (xhrObjects.status == 200) {
      var result = xhrObjects.responseText;
      var objRes = eval("(" + result + ")");

      var n = objRes.ResultOK;
      if (n == 1) {
        resMEmInsMsg = "입력을 완료했습니다.";
        memGetData();
        ReInsertMemData();
      }
    }
  }
  resDiv.innerHTML = resInsMsg;
}

function memInsertData() {
	
  var form_name ="form_MemInsert";
  var m_fname = document.forms[form_name].elements["inputFirstName"].value;
  var m_lname = document.forms[form_name].elements["inputLastName"].value;
  var m_id = document.forms[form_name].elements["inputMemId"].value;
  var m_pwd = document.forms[form_name].elements["inputPassword"].value;
  var m_mail = document.forms[form_name].elements["inputEmail"].value;

  if (m_fname == " ") {
    alert("이름 입력해주세요 :(");
    document.forms[form_name].elements["inputFirstName"].focus();
  } else if (m_lname == " ") {
    alert("성을 입력해주세요 :(");
    document.forms[form_name].elements["inputLastName"].focus();
  } else if (m_id == " ") {
    alert("관리자 아이를 입력해주세요 :(");
    document.forms[form_name].elements["inputMemId"].focus();
  } else if (m_pwd == " ") {
    alert("비밀번호를 입력해주세요 :(");
    document.forms[form_name].elements["inputPassword"].focus();
  } else if (m_mail == " ") {
    alert("이메일 입력해주세요 :(");
    document.forms[form_name].elements["inputEmail"].focus();
  } else {
	  memInsertDB();
  }
} // 입력

function updateMemDB() {
  // 수정
  var form_name = "form_MemUpdate";
  var m_fname = document.forms[form_name].elements["updateFirstName"].value;
  var m_lname = document.forms[form_name].elements["updateLastName"].value;
  var m_id = document.forms[form_name].elements["inputMemId"].value;
  var m_pwd = document.forms[form_name].elements["updatePassword"].value;
  var m_mail = document.forms[form_name].elements["updateEmail"].value;

  createXHR();

  var url = "./memUpdateDB.jsp";
  var reqparam = "m_fname=" + m_fname +"&m_lname=" +m_lname +"&m_id=" +m_id +"&m_pwd=" +m_pwd +"&m_mail=" +m_mail;

  xhrObject.onreadystatechange = resUpMemDB; // 함수를 변수로 씀
  xhrObject.open("post", url, "true");
  xhrObject.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=utf-8");
  xhrObject.send(reqparam);
}

function resUpMemDB() {
  var resMemUpMsg = " ";
  var resDiv = document.getElementById("memUpdate_msg");
  if (xhrObjects.readyState == 4) {
    if (xhrObjects.status == 200) {
      var result = xhrObjects.responseText;
      var objRes = eval("(" + result + ")");

      var n = objRes.ResultOK;
      if (n == 1) {
        resUpMsg = "수정을 완료했습니다.";
        memGetData();
        ReMemUpdate();
      } else if (n > 1) {
        resUpMemMsg = num + "개 이상이 수정되었습니다";
        memGetData();
        ReMemUpdate();
      }
    }
  }
  resDiv.innerHTML = resUpMsg;
}

function memUpData() {
  var form_name = "form_MemUpdate";
  var m_fname = document.forms[form_name].elements["updateFirstName"].value;
  var m_lname = document.forms[form_name].elements["updateLastName"].value;
  var m_id = document.forms[form_name].elements["updateMemId"].value;
  var m_pwd = document.forms[form_name].elements["updatePassword"].value;
  var m_mail = document.forms[form_name].elements["updateEmail"].value;

  if (m_fname == " ") {
    alert("이름 입력해주세요 :(");
    document.forms[form_name].elements["updateFirstName"].focus();
  } else if (m_lname == " ") {
    alert("성을 입력해주세요 :(");
    document.forms[form_name].elements["updateLastName"].focus();
  } else if (m_id == " ") {
    alert("관리자 아이를 입력해주세요 :(");
    document.forms[form_name].elements["updateMemId"].focus();
  } else if (mem_pwd == " ") {
    alert("비밀번호를 입력해주세요 :(");
    ocument.forms[form_name].elements["updatePassword"].focus();
  } else if (m_mail == " ") {
    alert("이메일 입력해주세요 :(");
    document.forms[form_name].elements["updateEmail"].focus();
  } else {
    updateMemDB();
  }
} // 수정

function delMemData() {
  var form_name = "form_MemDelete";
  var m_id = document.forms[form_name].elements["deleteMemId"].value;

  createXHR();

  var url = "./memDeleteDB.jsp";
  var reqparam = "m_id=" + m_id;
  xhrObjects.onreadystatechange = resMemDelData; // 함수를 변수로 씀
  xhrObjects.open("post", url, "true");
  xhrObjects.setRequestHeader( "Content-type", "application/x-www-form-urlencoded; charset=utf-8");
  xhrObjects.send(reqparam);
}

function resMemDelData() {
  var resMemDelMsg = " ";
  var resDiv = document.getElementById("memDelete_msg");
  if (xhrObjects.readyState == 4) {
    if (xhrObjects.status == 200) {
      var result = xhrObjects.responseText;
      var objRes = eval("(" + result + ")");

      var n = objRes.ResultOK;

      if (n >= 1) {
        resMemDelMsg = "삭제가 완료되었습니다.";
        memGetData();
        ReMemDelete();
      }
    }
  }
  resDiv.innerHTML = resMemDelMsg;
}

function memDelData() {
  var form_name = "form_MemDelete";
  var mem_id = document.forms[form_name].elements["DeleteMemId"].value;

  delMemData();
} // 삭제

function ReInsertMemData() {
  document.getElementById("inputFirstName").value = "";
  document.getElementById("inputLastName").value = "";
  document.getElementById("inputMemId").value = "";
  document.getElementById("inputPassword").value = "";
  document.getElementById("inputEmail").value = "";
} // 버튼 클릭시 팝업창 텍스트 리셋

function ReMemDelete() {
  document.getElementById("deleteMemId").value = "";
} // 버튼 클릭시 팝업창 텍스트 리셋

function ReMemUpdate() {
  document.getElementById("updateMemId").value = "";
  document.getElementById("updateFirstName").value = "";
  document.getElementById("updateLastName").value = "";
  document.getElementById("updateEmail").value = "";
  document.getElementById("updatePassword").value = "";
} // 버튼 클릭시 팝업창 텍스트 리셋
