/**
 * 
 */

$(function() {

	// 댓글 전체 가져오기
	showList(1);

	// 댓글 보여줄 영역 가져오기
	//댓글 보여줄 영역 가져오기
	let replyUi = $(".media");



	//게시글 수정하기
	$("submit").click(function(e) {

		e.preventDefault();

		let oper = $(this).data("oper");

		if (oper == 'modify') {
			formOdj = $("form[role='form']");
			formObj.submit();
		}

	})

	//댓글 작업
	//댓글 입력창 영역 가져오기
	let replyForm = $("#replyForm");
	let content = replyForm.find("textarea[name='replyContent']");
	let replyRegisterBtn = replyForm.find("#replyButton");

	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});

	replyRegisterBtn.click(function(){
		console.log("컨텐츠 : "+content.val());
		
		var reply = {
			mno: mno,
			content: content.val()
		};
		
	//댓글 삽입 
	replyService.add(reply,
		function(result) {
			if(result){
				if(result == 'success'){
					alert("댓글 등록 성공");
				}
				
				//댓글 보낸 내역 textArea에서 지우기
				replyForm.find("textarea[name='replyContent']").val("");
				//댓글 목록 불러오기
				showList(-1);
			}
		}); //add end
	})


	//댓글 전체 가져오기
	function showList(page) {
		replyService.getList({ mno: mno, page: page || 1 }, function(data) {

			// 댓글이 없는 경우
			if (data == null || data.length == 0) {
				replyUi.html("");
				return;
			}

			// 댓글이 있는 경우
			let str = "";
			for (var i = 0, len = data.length || 0; i < len; i++) {
				str += "<div class='dropdown' id='dropdown1'>";
				str += "<i class='fas fa-ellipsis-v' data-toggle='dropdown' aria-expanded='false'></i>";
				str += "<div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>";
				str += "<button class='dropdown-item list' type='submit'>수정하기</button>";
				str += "<button class='dropdown-item list' type='submit'>삭제하기</button></div></div>";
				str += "<div class='media-object pull-left'>";
				str += "<img src='/resources/images/ff.png' class='img-responsive img-circle' alt='Blog Image'>";
				str += "</div>";
				str += "<div class='media-body'>";
				str += "<span name='nickname'>" + data[i].nickname + "</span>";
				str += "<span name='mytown'>" + data[i].mytown + "</span>";
				str += "<span name='regdate'>" + replyService.displayTime(data[i].regdate) + "</span>";
				str += "<p style='margin-bottom: 20px; margin-top: 10px;' name='content'>" + data[i].content + "</p>";
				str += "</div></div>";
			}
			replyUi.html(str);


		}); //getList end

	}//showlist end
	
})







