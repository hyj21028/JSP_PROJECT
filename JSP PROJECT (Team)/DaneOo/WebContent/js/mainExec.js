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

function start_sign_close() {
    document.getElementById("start-sign-popup").style.display = "none";
}

function gender_close() {
    document.getElementById("start-gender-popup").style.display = "none";
}
function favorite_close() {
    document.getElementById("start-favorite-popup").style.display = "none";
}



$(document).ready(function () {
    $("#sin-btn").click(function () {
        $("#login_popup").toggle("show");
        $("#join-popup").toggle("show");
    });

    $("#log-btn").click(function () {
        $("#login_popup").toggle("show");
        $("#join-popup").toggle("show");
    });
});

$(document).ready(function() {
	  $("#joinBtn-txtAli").click(function() {
	    $("#join-popup").toggle("hide");
	    $("#start-sign-popup").toggle("show");
	  });
	});

	$(document).ready(function() {
	  $("#rnb").click(function() {
	    $("#start-sign-popup").toggle("hide");
	    $("#start-gender-popup").toggle("show");
	  });
	});

	$(document).ready(function() {
	  $("#prev-rb").click(function() {
	    $("#start-gender-popup").toggle("hide");
	    $("#start-sign-popup").toggle("show");
	  });
	});

	$(document).ready(function() {
	  $("#g-rb").click(function() {
	    $("#start-gender-popup").toggle("hide");
	    $("#start-favorite-popup").toggle("show");
	  });
	});
	
function cancelBoard(){
	document.getElementById("right-body").style.display= "block";
	document.getElementById("closeBoard").style.display= "block";
	document.getElementById("write-addboard").style.display= "none";
	document.getElementById("cancelBoard").style.display= "none";
	document.getElementById("addBoard").style.display= "none";	
}

function addBoard(){
	document.getElementById("right-body").style.display= "none";
	document.getElementById("closeBoard").style.display= "none";
	document.getElementById("write-addboard").style.display= "block";
	document.getElementById("cancelBoard").style.display= "block";
	document.getElementById("addBoard").style.display= "block";
}

function Enter_Check(){

		var inputsch = $("#inputSearch").val();
		alert(inputsch);

 		location.href="ItemSearch.do?sch="+inputsch;
		alert(location.href="ItemSearch.do?sch="+inputsch);
}

$(document).on("click", ".open-addPinDialog", function () {
	var PinImg = $(this).data('id');
	$(".modal-body #pinImg").attr("src", PinImg); 
	// As pointed out in comments, 
	// it is superfluous to have to manually call the modal. 
	// $('#addBookDialog').modal('show'); 
});

