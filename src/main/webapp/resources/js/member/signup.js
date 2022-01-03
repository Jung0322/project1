/**
 * signUp.jsp
 */

// 회원가입시 유효성 검사
$(function() {
	var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
    var csrfTokenValue = $("meta[name='_csrf']").attr("content");
	
	$("#signupForm").validate({
		errorPlacement: function(error, element) {
			$(element).closest("form")
					  .find("small[id='"+element.attr("id")+"']")
					  .append(error);
		},
		rules: {
			userid: {
				required: true,
				validId: true,
				remote: {
					url: "/member/checkUserid",
					type: "post",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: {
						userid: function() {
							return $("#userid").val();
						}
					}
				} // remote end
			}, // userid end
			password: {
				required: true,
				validPwd: true
			},
			password_check: {
				required: true,
				validPwd: true,
				equalTo:"#password"
			},
			nickname: {
				required: true,
				minlength: 2,
				remote: {
					url: "/member/checkNickname",
					type: "post",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: {
						userid: function() {
							return $("#userid").val();
						}
					}
				} // remote end
			}, // nickname end
			mytown: {
				required: true,
			},
			email: {
				required: true,
        		email: true
			},
			phone: {
				required: true,
				phone: true
			}
		}, // rules end
		messages: {
			userid: {
				remote: "아이디가 중복되었습니다.",
				required: "아이디는 필수 입력 요소입니다."
			},
			password: {
        		required: "비밀번호는 필수 입력 요소입니다."
      		},
      		password_check: {
        		required: "비밀번호는 필수 입력 요소입니다.",
        		equalTo:"이전 비밀번호와 다릅니다."
      		},
			nickname: {
				remote: "닉네임이 중복되었습니다.",
				required: "닉네임은 필수 입력 요소입니다.",
				minlength: "2글자 이상 입력해야 합니다."
			},
			mytown: {
				required: "내동네는 필수 입력 요소입니다."
			},
			email: {
				required: "이메일은 필수 입력 요소입니다."
			},
			phone: {
				required: "휴대전화는 필수 입력 요소입니다."
			}
		} // messages end
	}) // $("#signupForm").validate end
	
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
$.validator.addMethod(
	"phone",
	function(value) {
		var regPhone = /[0-9]/gi;
		return regPhone.test(value);
	},
	"숫자만 입력해 주세요."
)