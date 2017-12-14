function loginCheck() {
	if (login.iId.value == "" || login.iPwd.value == "") {
		alert("ID & PASSWORD are required");
		login.iId.focus();
		return;
	}
	login.submit();
}
/*모달 처리 jQuery*/
$("#signInA").on("click", function(){
	$(".close").click();
	$("#joinModal").modal();
});
$("#signUpBack").on("click", function(){
	$(".close")[1].click();
});
