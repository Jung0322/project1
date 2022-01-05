/**
 * modify-info.jsp 
 */

$(function() {
	var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
    var csrfTokenValue = $("meta[name='_csrf']").attr("content");

	$("button").click(function() {
				
		// 버튼의 종류 구분
		let oper = $(this).data("oper");
		
		
		if(oper == 'nickname') { // 닉네임 수정 
			// 기존의 닉네임
			var nicknameOrgValue = $("#nickname").val();
						
			// 닉네임 수정버튼 클릭시
			$("#nickname").attr("readonly", false);
			$("#nickname-btn").css("display", "none");
			$("#nickname-btn-submit").css("display", "block");
			$("#nickname-btn-cancel").css("display", "block");
			
			// 닉네임 수정 취소버튼 클릭시
			$("#nickname-btn-cancel").click(function() {
				$("#nickname").attr("readonly", true);
				$("#nickname").val(nicknameOrgValue);
				$("#nickname-btn").css("display", "block");
				$("#nickname-btn-submit").css("display", "none");
				$("#nickname-btn-cancel").css("display", "none");
				
				$("#nickname-error").remove();
			})
			$("#nickname-btn-submit").click(function(e) {
				e.preventDefault();
				
				
				console.log($("small#nickname > label").text()); // small 태그 안의 값 확인
				 
				if($("small#nickname > label").text() != ""){ // small 태그 안에 값이 있다면
					return; // 리턴(값을 보내지 않음)
				}		
				
				// 중복되지 않았다면 닉네임 저장
				$.ajax ({
					url: '/member/nickname-modify',
					type: 'post',
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: {	nickname: $("#nickname").val() },
					success: function() {
						$("#nickname").attr("readonly", true);
						$("#nickname-btn").css("display", "block");
						$("#nickname-btn-submit").css("display", "none");
						$("#nickname-btn-cancel").css("display", "none");
					}
				})
			})				
		} // nickname end 
		else if(oper == 'password') {
			// 기존의 비밀번호
			var pwdOrgValue = $("#password").val();
			
			// 비밀번호 수정버튼 클릭시
			$(".div-pwd-hide").css("display", "none");
			$(".div-pwd-form").css("display", "block");
			$("#password-btn-submit").css("display", "block");
			$("#password-btn-cancel").css("display", "block");
			
			// 비빌번호 수정 취소버튼 클릭시
			$("#password-btn-cancel").click(function() {
				$(".div-pwd-hide").css("display", "block");
				$(".div-pwd-form").css("display", "none");
				$("#password-btn-submit").css("display", "none");
				$("#password-btn-cancel").css("display", "none");
				
				$("#password").val("");
				$("#new_password").val("");
				$("#password_check").val("");
				
				$("small#password > label").remove();
				$("small#new_password > label").remove();
				$("small#password_check > label").remove();
			})
			
			// 비밀번호 수정 저장버튼 클릭시
			$("#password-btn-submit").click(function(e) {
				e.preventDefault();
								
				let param = {
					password: $("#password").val(),
					new_password: $("#new_password").val()
				}
				
				// small 태그 안에 값이 있다면
				if($("small#new_password > label").text() != "" || $("small#password_check > label").text() != ""
						|| $("small#password > label").text() != "") 
				{ 
					return; // 리턴(값을 보내지 않음)
				} else if($("#password").val() == "" || $("#new_password").val() == "" || $("#password_check").val() == "") {
					return;
				}
				
				$.ajax({
					url: "/member/pwd-modify",
					type: "post",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: param,
					success: function() {
						$(".div-pwd-hide").css("display", "block");
						$(".div-pwd-form").css("display", "none");
						$("#password-btn-submit").css("display", "none");
						$("#password-btn-cancel").css("display", "none");

						$("#password").val("");
						$("#new_password").val("");
						$("#password_check").val("");

						/*$("small#password > label").remove();
						$("small#new_password > label").remove();
						$("small#password_check > label").remove();*/
					}
				})
			}) // $("#password-btn-submit").click
		} // password end
		else if(oper == 'email') {
			// 기존 이메일 값
			var emailOrgValue = $("#email").val();
			
			// 이메일 수정버튼 클릭시
			$("#email").attr("readonly", false);
			$("#email-btn").css("display", "none");
			$("#email-btn-submit").css("display", "block");
			$("#email-btn-cancel").css("display", "block");
			
			// 이메일 수정 취소버튼 클릭시
			$("#email-btn-cancel").click(function() {
				$("#email").attr("readonly", true);
				$("#email").val(emailOrgValue);
				$("#email-btn").css("display", "block");
				$("#email-btn-submit").css("display", "none");
				$("#email-btn-cancel").css("display", "none");
				
				$("small#email > label").remove();
			})
			
			// 이메일 수정 저장버튼 클릭시
			$("#email-btn-submit").click(function(e) {
				e.preventDefault();
				
				if($("small#email > label").text() != ""){ // small 태그 안에 값이 있다면
					return; // 리턴(값을 보내지 않음)
				}
				
				// 중복되지 않은 이메일 저장
				$.ajax({
					url: "/member/email-modify",
					type: "post",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: { email: $("#email").val() },
					success: function() {
						$("#email").attr("readonly", true);
						$("#email-btn").css("display", "block");
						$("#email-btn-submit").css("display", "none");
						$("#email-btn-cancel").css("display", "none");
					}
				})
			}) // $("email-btn-submit").click end
		} // email end
		else if(oper == 'phone') {
			// 기존 휴대전화 값
			var phoneOrgValue = $("#phone").val();
			
			// 휴대전화 수정버튼 클릭시
			$("#phone").attr("readonly", false);
			$("#phone-btn").css("display", "none");
			$("#phone-btn-submit").css("display", "block");
			$("#phone-btn-cancel").css("display", "block");
			
			// 휴대전화 수정 취소버튼 클릭시
			$("#phone-btn-cancel").click(function() {
				$("#phone").attr("readonly", true);
				$("#phone").val(phoneOrgValue);
				$("#phone-btn").css("display", "block");
				$("#phone-btn-submit").css("display", "none");
				$("#phone-btn-cancel").css("display", "none");
				 
				$("small#phone > label").remove();
			});
			
			// 휴대전화 수정 저장버튼 클릭시
			$("#phone-btn-submit").click(function(e) {
				e.preventDefault();
				
				if($("small#phone > label").text() != ""){ // small 태그 안에 값이 있다면
					return; // 리턴(값을 보내지 않음)
				}
				
				$.ajax({
					url: "/member/phone-modify",
					type: "post",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: { phone: $("#phone").val() },
					success: function() {
						$("#phone").attr("readonly", true);
						$("#phone-btn").css("display", "block");
						$("#phone-btn-submit").css("display", "none");
						$("#phone-btn-cancel").css("display", "none");
					}
				})
			})
		} // phone end
	}); // $("button").click end
	
	
	// 유효성 검사 - 닉네임
	$("#modifyForm_nickname").validate({
    	errorPlacement: function(error, element) {
      		$(element).closest("form")
        			  .find("small[id='" + element.attr("id") + "']")
        			  .append(error);
    	},
		rules: {
			nickname: {
				required: true,
				minlength: 2,				
				onchange:false,
				remote: {					
					url: "/member/checkNickname",
					type: "post",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: {
						nickname: function() {
							return $("#nickname").val();
						}
					}					
				} // remote end
			} // nickname end
		}, // rules end
		messages: {
			nickname: {
				remote: "중복된 닉네임입니다.",
				required: "닉네임은 필수 입력 요소입니다.",
				minlength: "2글자 이상 입력해야 합니다."
			}
		} 
	}); // $("#modifyForm_nickname").validate end

	// 유효성 검사 - 비밀번호
	$("#modifyForm_password").validate({
    	errorPlacement: function(error, element) {
      		$(element).closest("form")
        			  .find("small[id='" + element.attr("id") + "']")
        			  .append(error);
    	},
		rules: {
			password: {
				required: true,
				validPwd: true,
				remote: {
					url: "/member/checkOrgPassword",
					type: "post",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: {
						password: function() {
							return $("#password").val();
						}
					}
				} // remote end
			}, // password end
			new_password: {
				required: true,
				validPwd: true
			},
			password_check: {
				required: true,
				validPwd: true,
				equalTo: "#new_password"
			}
		}, // rules end
		messages: {
			password: {
				required: "비밀번호는 필수 입력 요소입니다.",
				remote: "비밀번호가 맞지 않습니다."
			},
			new_password: {
				required: "새 비밀번호는 필수 입력 요소입니다.",
			},
			password_check: {
				required: "새 비밀번호 재입력은 필수 입력 요소입니다.",
				equalTo: "새 비밀번호와 다릅니다."
			}
		}
	}); // $("#modifyForm_password").validate end
	
	// 유효성 검사 - 이메일
	$("#modifyForm_email").validate({
    	errorPlacement: function(error, element) {
      		$(element).closest("form")
        			  .find("small[id='" + element.attr("id") + "']")
        			  .append(error);
    	},
		rules: {
			email: {
				required: true,
				email: true,
				remote: {
					url: "/member/checkEmail",
					type: "post",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: {
						email: function() {
							return $("#email").val();
						}
					}
				}
			} // email end
		}, // rules end
		messages: {
			email: {
				required: "이메일은 필수 입력 요소입니다.",
				remote: "이미 존재하는 이메일입니다."
			}
		}
	}); // $("#modifyForm_password").validate end
	
	// 유효성 검사 - 휴대전화
	$("#modfiyForm_phone").validate({
    	errorPlacement: function(error, element) {
      		$(element).closest("form")
        			  .find("small[id='" + element.attr("id") + "']")
        			  .append(error);
    	},
		rules: {
			phone: {
				required: true,
				phone: true,
				maxlength:13,
				minlength:13
			}
		}, // rules end
		messages: {
			phone: {
				required: "휴대전화는 필수 입력 요소입니다.",
				maxlength: "번호의 길이가 너무 깁니다.",
				minlength: "번호의 길이가 너무 짧습니다."
			}
		} // messages end
	});
	
	// 자동 하이픈 추가
	$("#phone").keydown(function(event) {
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
});


// 유효성 검사 규칙
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
$.validator.addMethod(
	"phone",
	function(value) {
		var regPhone = /[0-9]/gi;
		return regPhone.test(value);
	},
	"숫자만 입력해 주세요."
);