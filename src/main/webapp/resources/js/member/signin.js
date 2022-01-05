/**
 * signIn.jsp 
 */

$(function() {
	
	$(":submit").click(function(e) {
		var str = "";
		if($("#username").val() == "") {
			str ="<ul><li>";
			str +="<b>아이디</b>";
			str += "를 입력해 주세요.";
			str += "</li><ul>";
			
			$(".error-message").html(str);
			
			e.preventDefault();
		} else if($("#password").val() == "") {
			str ="<ul><li>";
			str +="<b>비밀번호</b>";
			str += "를 입력해 주세요.";
			str += "</li><ul>";
			
			$(".error-message").html(str);
			
			e.preventDefault();
		}
	})
})