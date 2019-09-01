/**
 * 
 */
function update_open() {//프로필 수정 열기
    document.getElementById("memberUpdate").style.display = "block";
    document.getElementById("postit").style.display = "none";
    document.getElementById("user").style.display = "none";
    document.getElementById("personal").style.display = "none";
    document.getElementById("sec").style.display = "none";
}

function update_close() {//프로필 수정 닫기
    document.getElementById("memberUpdate").style.display = "none";
}

function user_open() { //계정설정 열기
    document.getElementById("memberUpdate").style.display = "none";
    document.getElementById("user").style.display = "block";
    document.getElementById("postit").style.display = "none";
    document.getElementById("personal").style.display = "none";
    document.getElementById("sec").style.display = "none";
}

function user_close() { //계정설정 닫기
    document.getElementById("user").style.display = "none";
}

function postit_open() {//알림 열기
    document.getElementById("memberUpdate").style.display = "none";
    document.getElementById("user").style.display = "none";
    document.getElementById("postit").style.display = "block";
    document.getElementById("personal").style.display = "none";
    document.getElementById("sec").style.display = "none";
}

function postit_close() {//알림 닫기
    document.getElementById("postit").style.display = "none";
}

function personal_open() {//개인정보 열기
    document.getElementById("memberUpdate").style.display = "none";
    document.getElementById("user").style.display = "none";
    document.getElementById("postit").style.display = "none";
    document.getElementById("personal").style.display = "block";
    document.getElementById("sec").style.display = "none";
}

function personal_close() {//개인정보 닫기
    document.getElementById("personal").style.display = "none";
}

function sec_open() {//보안
    document.getElementById("memberUpdate").style.display = "none";
    document.getElementById("user").style.display = "none";
    document.getElementById("postit").style.display = "none";
    document.getElementById("personal").style.display = "none";
    document.getElementById("sec").style.display = "block";
}

function sec_close() {//보안 닫기
    document.getElementById("sec").style.display = "none";
}

$(document).ready(function () {
    console.log('준비됨!')
    $(".toMail").click(function () {
        console.log('클릭됨!');
        $("#sendMail").toggle();
    });

});

$(document).ready(function () {
    console.log('준비됨!')
    $("#toAlarm").click(function () {
        console.log('클릭됨!');
        $(".logoutForm").toggle();
    });

});

$(".profile").submit(function(){
	
    var password = $("input[name='svdpassword']");
    var ckpassword = $("input[name='ckpassword']");
    if(password.val() =='') {
        alert("비밀번호를 입력하세요!");
        password.focus();
        return false;
    }
    if(password.val().search(/\s/) != -1){
        alert("비밀번호는 공백없이 입력해주세요.");
        return false;
    }
    if(!/^[a-zA-Z0-9!@#$%^&*()?_~]{8,20}$/.test(password.val())){
        alert("비밀번호는 숫자, 영문, 특수문자(!@$%^&*?_~ 만 허용) 조합으로 8~20자리를 사용해야 합니다.");
        return false;
    }
    // 영문, 숫자, 특수문자 2종 이상 혼용
    var chk=0;
    if(password.val().search(/[0-9]/g) != -1 ) chk ++;
    if(password.val().search(/[a-z]/ig)  != -1 ) chk ++;
    if(password.val().search(/[!@#$%^&*()?_~]/g) != -1) chk ++;
    if(chk < 2){
        alert("비밀번호는 숫자, 영문, 특수문자를 두가지이상 혼용하여야 합니다.");
        return false;
    }

    if(repassword.val() =='') {
        alert("비밀번호를 다시 한번 더 입력하세요!");
        repassword.focus();
        return false;
    }
    if(password.val()!== ckpassword.val()){
        alert('입력한 두 개의 비밀번호가 일치하지 않습니다');
        return false;
    }

});
