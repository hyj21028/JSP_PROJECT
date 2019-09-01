/**
 * 	JOIN/LOGIN
 */

$(document).ready(function () {
    console.log('준비됨!')
    $(".toMail").click(function () {
        console.log('클릭됨!');
        $("#sendMail").toggle();
    });

});

function join_open() {
    document.getElementById("join-popup").style.display = "block";
}

function join_close() {
    document.getElementById("join-popup").style.display = "none";
}
function login_open() {
    document.getElementById("login_popup").style.display = "block";
}
function login_close() {
    document.getElementById("login_popup").style.display = "none";
}