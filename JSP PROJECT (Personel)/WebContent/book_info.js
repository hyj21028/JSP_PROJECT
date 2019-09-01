function insert_open() {
  document.getElementById("insert-popup").style.display = "block";
}
function insert_close() {
  document.getElementById("insert-popup").style.display = "none";
}
function delete_open() {
  document.getElementById("delete-popup").style.display = "block";
}
function delete_close() {
  document.getElementById("delete-popup").style.display = "none";
}
function update_open() {
  document.getElementById("update-popup").style.display = "block";
}
function update_close() {
  document.getElementById("update-popup").style.display = "none";
}

var xhrObject;

function createXHR() {

	if (window.ActiveXObject) {
		xhrObject = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {

		xhrObject = new XMLHttpRequest();
	}
}
function getData() {
	var form_name = "form_search";
	var book_name = document.forms[form_name].elements["txt_book_name"].value;

	createXHR();

	var url = "./bookDB.jsp";
	var reqparam = "book_name=" + book_name;
	xhrObject.onreadystatechange = resGetData;
	xhrObject.open("post", url, "true");
	xhrObject.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded; charset=utf-8");
	xhrObject.send(reqparam);
}
function resGetData() {
	if (xhrObject.readyState == 4) {
		if (xhrObject.status == 200) {
			var result = xhrObject.responseText;
			// alert(result);
			var objRes = eval("(" + result + ")");
			// alert("kim ok");

			var num = objRes.bookInfo.length;
			// alert(num);
			var res = "<table border='1'>";// cellpadding='3' cellspacing='0' border='1' width='850'
			var resDiv = document.getElementById("div_res");

			if (num < 1) {
				res += "<tr><td'>검색 결과가 없습니다.</td></tr>";
				// width='850' height='100' align='center' style='font-size:50;
			} else {
				for (var i = 0; i < num; i++) {

					var book_symbol = objRes.bookInfo[i].SYMBOL;
					// alert(book_symbol);
					var book_name = objRes.bookInfo[i].NAME;
					var book_author = objRes.bookInfo[i].AUTHOR;
					var book_publisher = objRes.bookInfo[i].PUBLISHER;

					res += "<tr>";
		
					res += "<td bgcolor='#FFFF99'>"
							+ book_symbol + "</td>";
					res += "<td bgcolor='#FFE6E6'>"
							+ book_name + "</td>";
					res += "<td bgcolor='#FFD2D2'>"
							+ book_author + "<br></td>";
					res += "<td bgcolor='#FFE5CB'>"
							+ book_publisher + "<br></td>";
					res += "<td  bgcolor='#FFF0F0'>"+ 
					       "<button id='updateBtn'><img src='images/update.svg' width='20'height='20' onClick='button_update(\""+ book_symbol+ "\",\""+ book_name+ "\",\""+ book_author+ "\",\""+ book_publisher+ "\")'>수정</button>"+ 
					       "<button id='deleteBtn'><img src='images/delete.svg' width='20'height='20' onClick='button_delete(\""+ book_name + "\")'>삭제</button>" + "<br></td>";
					res += "</tr>";

				}
			}
			res += "</table>"
			resDiv.innerHTML = res;
		}
	}
}
function searchData() {
	var form_name = "form_search";
	var book_name = document.forms[form_name].elements["txt_book_name"].value;

	getData();

} // 검색

function insertDB() {

	var form_name = "form_insert";
	var book_symbol = document.forms[form_name].elements["txt_insert_symbol"].value;
	var book_name = document.forms[form_name].elements["txt_insert_name"].value;
	var book_author = document.forms[form_name].elements["txt_insert_author"].value;
	var book_publisher = document.forms[form_name].elements["txt_insert_publisher"].value;

	createXHR();

	var url = "./bookInsertDB.jsp";
	var reqparam = "book_symbol=" + book_symbol + "&book_name=" + book_name
			+ "&book_author=" + book_author + "&book_publisher="
			+ book_publisher;

	xhrObject.onreadystatechange = resInsertDB; // 함수를 변수로 씀
	xhrObject.open("post", url, "true");
	xhrObject.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=utf-8");
	xhrObject.send(reqparam);
}

function resInsertDB() {
	var resInsMsg = " ";
	var resDiv = document.getElementById("insert_msg");
	if (xhrObject.readyState == 4) {
		if (xhrObject.status == 200) {
			var result = xhrObject.responseText;
			var objRes = eval("(" + result + ")");

			var n = objRes.ResultOK;
			if (n == 1) {
				resInsMsg = "입력을 완료했습니다.";
				getData();
				resetInsertData();
			}
		}
	}
	resDiv.innerHTML = resInsMsg;
}
function InsertData() {

	var form_name = "form_insert";
	var book_symbol = document.forms[form_name].elements["txt_insert_symbol"].value;
	var book_name = document.forms[form_name].elements["txt_insert_name"].value;
	var book_author = document.forms[form_name].elements["txt_insert_author"].value;
	var book_publisher = document.forms[form_name].elements["txt_insert_publisher"].value;

	if (book_symbol == " ") {
		alert("청구번호를 입력해주세요 :(");
		document.forms[form_insert].elements["txt_insert_symbol"].focus();

	} else if (book_name == " ") {
		alert("저서명을 입력해주세요 :(");
		document.forms[form_insert].elements["txt_insert_name"].focus();

	} else if (book_author == " ") {
		alert("작가명을 입력해주세요 :(");
		document.forms[form_insert].elements["txt_insert_author"].focus();

	} else if (book_publisher == " ") {
		alert("출판사명을 입력해주세요 :(");
		document.forms[form_insert].elements["txt_insert_publisher"].focus();

	} else {
		insertDB();
	}
} // 입력
function updateDB() { // 수정

	var form_name = "form_update";
	var book_symbol = document.forms[form_name].elements["txt_update_symbol"].value;
	var book_name = document.forms[form_name].elements["txt_update_name"].value;
	var book_author = document.forms[form_name].elements["txt_update_author"].value;
	var book_publisher = document.forms[form_name].elements["txt_update_publisher"].value;

	createXHR();

	var url = "./bookUpdateDB.jsp";
	var reqparam = "book_symbol=" + book_symbol + "&book_name=" + book_name
			+ "&book_author=" + book_author + "&book_publisher="
			+ book_publisher;

	xhrObject.onreadystatechange = resUpdateDB; // 함수를 변수로 씀
	xhrObject.open("post", url, "true");
	xhrObject.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=utf-8");
	xhrObject.send(reqparam);
}

function resUpdateDB() {
	var resUpMsg = " ";
	var resDiv = document.getElementById("update_msg");
	if (xhrObject.readyState == 4) {
		if (xhrObject.status == 200) {

			var result = xhrObject.responseText;
			var objRes = eval("(" + result + ")");

			var n = objRes.ResultOK;
			if (n == 1) {				
				resUpMsg = "수정을 완료했습니다.";
				getData();
				resetUpdateData();
			} else if (n > 1) {
				resUpMsg = num + "개 이상이 수정되었습니다";
				getData();
				resetUpdateData();

			}
		}
	}
	resDiv.innerHTML = resUpMsg;
}
function UpdateData() {

	var form_name = "form_update";
	var book_symbol = document.forms[form_name].elements["txt_update_symbol"].value;
	var book_name = document.forms[form_name].elements["txt_update_name"].value;
	var book_author = document.forms[form_name].elements["txt_update_author"].value;
	var book_publisher = document.forms[form_name].elements["txt_update_publisher"].value;

	if (book_symbol == " ") {
		alert("청구번호를 입력해주세요 :(");
		document.forms[form_update].elements["txt_insert_symbol"].focus();

	} else if (book_name == " ") {
		alert("저서명을 입력해주세요 :(");
		document.forms[form_update].elements["txt_insert_name"].focus();

	} else if (book_author == " ") {
		alert("작가명을 입력해주세요 :(");
		document.forms[form_update].elements["txt_insert_author"].focus();

	} else if (book_publisher == " ") {
		alert("출판사명을 입력해주세요 :(");
		document.forms[form_update].elements["txt_insert_publisher"].focus();

	} else {
		updateDB();
	}
} // 수정

function delData() {

	var form_name = "form_delete";
	var book_name = document.forms[form_name].elements["txt_delete_name"].value;

	createXHR();

	var url = "./bookDeleteDB.jsp";
	var reqparam = "book_name=" + book_name;
	xhrObject.onreadystatechange = resDelData; // 함수를 변수로 씀
	xhrObject.open("post", url, "true");
	xhrObject.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=utf-8");
	xhrObject.send(reqparam);
}

function resDelData() {
	var resDelMsg = " ";
	var resDiv = document.getElementById("delete_msg");
	if (xhrObject.readyState == 4) {
		if (xhrObject.status == 200) {

			var result = xhrObject.responseText;
			var objRes = eval("(" + result + ")");

			var n = objRes.ResultOK;

			if (n >= 1) {
				resDelMsg = "삭제가 완료되었습니다.";
				getData();
				resetDeleteData();
			}
		}
	}
	resDiv.innerHTML = resDelMsg;
}

function DeleteData() {

	var form_name = "form_delete";
	var book_name = document.forms[form_name].elements["txt_delete_name"].value;

	delData();

} // 삭제

function button_update(up_symbol, up_name, up_author, up_publisher) {
	document.getElementById("txt_update_symbol").value = up_symbol;
	document.getElementById("txt_update_name").value = up_name;
	document.getElementById("txt_update_author").value = up_author;
	document.getElementById("txt_update_publisher").value = up_publisher;

}

function button_delete(del_name) {
	document.getElementById("txt_delete_name").value = del_name;

}

function resetInsertData(){
	document.getElementById("txt_insert_symbol").value = "";
	document.getElementById("txt_insert_name").value = "";
	document.getElementById("txt_insert_author").value = "";
	document.getElementById("txt_insert_publisher").value = "";
}// 버튼 클릭시 팝업창 텍스트 리셋

function resetDeleteData(){
	document.getElementById("txt_delete_name").value = "";
}// 버튼 클릭시 팝업창 텍스트 리셋

function resetUpdateData(){
	document.getElementById("txt_update_symbol").value = "";
	document.getElementById("txt_update_name").value = "";
	document.getElementById("txt_update_author").value = "";
	document.getElementById("txt_update_publisher").value = "";
}// 버튼 클릭시 팝업창 텍스트 리셋
