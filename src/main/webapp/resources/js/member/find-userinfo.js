/**
 * find-userinfo.jsp
 */

$(function() {
	var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
    var csrfTokenValue = $("meta[name='_csrf']").attr("content");

	$("button").click(function() {
		// 버튼 종류 구분
		let oper = $(this).data("oper");

		if(oper == "find-userid") { // 아이디 찾기 클릭시
		
			$("#div-find-userid").css("display", "block");
			
			var code = "";
			
			// 인증번호 발송
			$("#sendPhoneCertiUserid").click(function() {
				alert("인증번호 발송이 완료되었습니다. \n휴대폰에서 인증번호 확인을 해주십시오.");
				
				// 전화번호 입력
				var phone = $("#phone-userid").val();
				
				$.ajax({
					type: "GET",
					url: "phoneCheck?phone="+phone,
					cache: false,
					success: function(data) {
						if(data == "error") {
							alert("전화번호가 올바르지 않습니다.");
							$("#phone-userid").attr("autofocus", true);
							$("small#phone").html("<b>유효한 번호를 입력해 주세요.</b>");
							$("small#phone").css("color", "red");
						} else {
							$("#checkPhoneUserid").attr("disabled", false);
							$("#checkPhoneUserid").attr("autofocus", true);
							$("small#phone").html("<b>인증번호를 입력한 뒤 본인인증을 눌러주십시오.</b>");
							$("small#phone").css("color", "green");
							$("#phone-userid").attr("readonly", true);
							code = data;
						}
					}
				})
			}) // $("#sendPhoneCertiUserid").click end
			
			// 휴대전화와 인증번호 대조
			$("#checkPhoneCertiUserid").click(function() {
				if($("#checkPhoneUserid").val() == code) { // 인증번호와 동일하다면
					$("small#phone").html("<b>인증번호가 일치합니다.</b>");
					$("samll#phone").css("color", "green");
					$("#phoneDoubleChkUserid").val("true");
					$("#checkPhoneUserid").attr("disabled", true);
					$("#chkUserid").css("display", "block");
				} else {
					$("small#phone").html("<b>인증번호가 일치하지 않습니다.</b>");
					$("samll#phone").css("color", "red");
					$("#phoneDoubleChkUserid").val("false");
					$("#chkUserid").css("display", "none");
					$(this).attr("autofocus", true);
				}
			}) // $("#checkPhoneCertiPw").click end
			
			// 확인 버튼 클릭시
			$("#chkMemberInfoUserid").click(function(e) {
				e.preventDefault();
											
				$.ajax ({
					url: "/member/find-userid",
					type: "POST",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: {
						email : $("#email-userid").val(),
						phone : $("#phone-userid").val(),
						doubleChk : $("#phoneDoubleChkUserid").val()
					},
					success: function(result) {
						if(result == "") {
							$("#div-userInfo-userid").css("display", "block");
							$("#div-userInfo-userid > b").html("일치하는 정보가 없습니다.");
							$("#div-userInfo-userid > a, .div-userinfo > button").css("display", "none");
						} else {
							$("#div-userInfo-userid").css("display", "block");
							$("#p-userid-info").html(result);
						}
					} 
				})
			})
		} // find-userid end
		else if(oper == "find-pwd") {
			
			$("#div-find-pwd").css("display", "block");
			
			var code = "";
			
			// 인증번호 발송
			$("#sendPhoneCertiPwd").click(function() {
				alert("인증번호 발송이 완료되었습니다. \n휴대폰에서 인증번호 확인을 해주십시오.");
				
				// 전화번호 입력
				var phone = $("#phone_pwd").val();
				
				$.ajax({
					type: "GET",
					url: "phoneCheck?phone="+phone,
					cache: false,
					success: function(data) {
						if(data == "error") {
							alert("전화번호가 올바르지 않습니다.");
							$("#phone_pwd").attr("autofocus", true);
							$("small#phone").html("<b>유효한 번호를 입력해 주세요.</b>");
							$("small#phone").css("color", "red");
						} else {
							$("#checkPhonePwd").attr("disabled", false);
							$("#checkPhonePwd").attr("autofocus", true);
							$("small#phone").html("<b>인증번호를 입력한 뒤 본인인증을 눌러주십시오.</b>");
							$("small#phone").css("color", "green");
							$("#phone_pwd").attr("readonly", true);
							code = data;
						}
					}
				})
			}) // $("#sendPhoneCertiPwd").click end
			
			// 휴대전화와 인증번호 대조
			$("#checkPhoneCertiPwd").click(function() {
				if($("#checkPhonePwd").val() == code) { // 인증번호와 동일하다면
					$("small#phone").html("<b>인증번호가 일치합니다.</b>");
					$("samll#phone").css("color", "green");
					$("#phoneDoubleChkPwd").val("true");
					$("#checkPhonePwd").attr("disabled", true);
					$("#chkPwd").css("display", "block");
				} else {
					$("small#phone").html("<b>인증번호가 일치하지 않습니다.</b>");
					$("samll#phone").css("color", "red");
					$("#phoneDoubleChkPwd").val("false");
					$("#chkPwd").css("display", "none");
					$(this).attr("autofocus", true);
				}
			}) // $("#checkPhoneCertiPw").click end
			
			// 확인 버튼 클릭시
			$("#chkMemberInfoPwd").click(function(e) {
				e.preventDefault();
											
				$.ajax ({
					url: "/member/find-pwd",
					type: "POST",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: {
						userid : $("#userid").val(),
						email : $("#email_pwd").val(),
						phone : $("#phone_pwd").val(),
						doubleChk : $("#phoneDoubleChkPwd").val()
					},
					success: function(result) {
						console.log(result);
						if(result == "") {
							$("#div-errorMsg").css("display", "block");
							$("#div-errorMsg > b").html("일치하는 정보가 없습니다.");
							$("#div-errorMsg > b").css("color", "red");
						} else {
							$("#div-errorMsg").css("display", "block");
							$("#div-errorMsg > b").html("비밀번호를 재설정 하십시오.");
							$("#div-errorMsg > b").css("color", "green");
							
							$("#div-userInfo-pwd").css("display", "block");
						}
					} 
				})
			}) // $("#chkMemberInfoPwd").click end
			
			
			var formObj = $("#replaceForm");
			
			$("#replacePwd").click(function(e) {
				e.preventDefault();

				var userid = $("#userid").val();
				var str = "<input type='hidden' name='userid' value='"+userid+"' />";
				
				formObj.append(str);
				formObj.submit();
			})

	
		} // find-pwd end
	}) // button click end

	// 자동 하이픈 추가
	$("input[name=phone]").keydown(function(event) {
		var key = event.charCode || event.keyCode || 0;
		$text = $(this);
		if(key !== 8 && key !== 9) {
			if($text.val().length === 3) {
             	$text.val($text.val() + '-');
			}
            if ($text.val().length === 8) {
            	$text.val($text.val() + '-');
            }
		}
		// 0~9 숫자, 백스페이스, 탭, Delete 키, 넘버패드 외 입력 불가
		return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	}) // $("#phone").keydown(function(event) end
	
	
	// 유효성 검사 - 비밀번호 재설정
	$("#replaceForm").validate({
    	errorPlacement: function(error, element) {
      		$(element).closest("form")
        			  .find("small[id='" + element.attr("id") + "']")
        			  .append(error);
    	},
		rules: {
			password: {
				required: true,
				validPwd: true
			},
			password_check: {
				required: true,
				validPwd: true,
				equalTo: "#password"
			}
		}, // rules end
		messages: {
			password: {
				required: "새 비밀번호는 필수 입력 요소입니다."
			},
			password_check: {
				required: "새 비밀번호 재입력은 필수 입력 요소입니다.",
				equalTo: "새 비밀번호와 다릅니다."
			}
		}
	}) // $("#findForm_pwd").validate end 
	
})

// 유효성 검사 규칙
$.validator.addMethod(
	"validId",
  	function(value) {
    	var regId = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,12}$/;
    	return regId.test(value);
	},
	"아이디는 영문 대소문자,숫자를 포함하여 5~12자리 사이로 입력해야 합니다."
);
$.validator.addMethod(
  "validPwd",
  function(value) {
    var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
    return regPwd.test(value);
  },
  "비밀번호는 숫자와 영문자와 특수문자의 조합으로 8~15자리를 사용해야 합니다."
);
$.validator.addMethod(
  "email",
  function(value) {
    var regEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return regEmail.test(value);
  },
  "이메일 형식을 확인해 주세요."
);