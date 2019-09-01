function update_open() {//프로필 수정
    document.getElementById("memberUpdate").style.display = "block";
    document.getElementById("postit").style.display = "none";
    document.getElementById("user").style.display = "none";
    document.getElementById("personal").style.display = "none";
    document.getElementById("sec").style.display = "none";
}
function user_open() { //계정설정
    document.getElementById("memberUpdate").style.display = "none";
    document.getElementById("user").style.display = "block";
    document.getElementById("postit").style.display = "none";
    document.getElementById("personal").style.display = "none";
    document.getElementById("sec").style.display = "none";
}
function postit_open() {//알림
    document.getElementById("memberUpdate").style.display = "none";
    document.getElementById("user").style.display = "none";
    document.getElementById("postit").style.display = "block";
    document.getElementById("personal").style.display = "none";
    document.getElementById("sec").style.display = "none";
}
function personal_open() {//개인정보
    document.getElementById("memberUpdate").style.display = "none";
    document.getElementById("user").style.display = "none";
    document.getElementById("postit").style.display = "none";
    document.getElementById("personal").style.display = "block";
    document.getElementById("sec").style.display = "none";
}
function sec_open() {//보안
    document.getElementById("memberUpdate").style.display = "none";
    document.getElementById("user").style.display = "none";
    document.getElementById("postit").style.display = "none";
    document.getElementById("personal").style.display = "none";
    document.getElementById("sec").style.display = "block";
}
$(document).ready(function () {
    console.log('준비됨!')
    $(".toMail").click(function () {
        console.log('클릭됨!');
        $("#sendMail").toggle();
    });

});


