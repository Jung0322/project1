/**
 * remove-member.jsp 
 */

$(function() {
	var delete_reason = "";
	
	$("#deleteReason").change(function() {
		delete_reason = $("#deleteReason").val();
		console.log(delete_reason);
		
		if(delete_reason == 7) {
			$("#deleteContent").css("display", "block");
			$(".div-remove").css("display", "block");
			
		} else if(delete_reason == 1) {
			$("#deleteContent").css("display", "none");
			$(".div-remove").css("display", "none");
		} 
		else {
			$("#deleteContent").css("display", "none");
			$(".div-remove").css("display", "block");
		}
	})
	
	// 유효성 검사
	$("#removeForm").validate({
    	errorPlacement: function(error, element) {
      		$(element).closest("form")
        			  .find("small[id='" + element.attr("id") + "']")
        			  .append(error);
    	},
		rules: {
			userid: {
				required: true
			},
			password: {
				required: true
			}
		}, // rules end
		messages: {
			userid: {
				required: "아이디는 필수 입력 요소입니다."
			},
			password: {
				required: "비밀번호는 필수 입력 요소입니다."
			}			
		} // messages end
	}) // $("#removeForm").validate end
})