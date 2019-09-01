
$(document).ready(function () {
    console.log('준비됨!')
    $(".toMail").click(function () {
        console.log('클릭됨!');
        $("#sendMail").toggle();
    });

});//메시지 창 오픈

$(document).ready(function () {
    console.log('준비됨!')
    $("#shareS").click(function () {
        console.log('클릭됨!');
        $("#share-popop").toggle();
    });
}); //공유


$(document).ready(function () {
    console.log('준비됨!')
    $("#toAlarm").click(function () {
        console.log('클릭됨!');
        $(".logoutForm").toggle();
    });

});//로그아웃
