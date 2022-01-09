/**
 * 
 */

$(function() {

	// 댓글 전체 가져오기
	showList(1);

	// 댓글 보여줄 영역 가져오기
	//댓글 보여줄 영역 가져오기
	let replyDiv = $("#showReply");



	//게시글 수정하기
	$("submit").click(function(e) {

		e.preventDefault();

		let oper = $(this).data("oper");

		if (oper == 'modify') {
			formOdj = $("form[role='form']");
			formObj.submit();
		}

	})
	
	//좋아요 갯수 증가
	$("#ques").click(function(e){
		$(this).css("color","#9BB460");
		
			/*$.ajax({
				url: '/replies/new',
				type: 'post',
				contentType: 'application/json',
				data: JSON.stringify(reply),
				success: function(result) {
					if (callback) {
						callback(result);
					}
				},
				error: function(xhr, status, err) {
					error(err);
				}
			})			
		})*/		
	})
	

	//댓글 작업
	//댓글 입력창 영역 가져오기
	let modal = $("#replyModal");
	let replyForm = $("#replyForm");
	let content = replyForm.find("textarea[name='replyContent']");

	//댓글 정보 출력할 영역 가져오기
	let modalNickname = modal.find("span[name='nickname']");
	let modalMytown = modal.find("span[name='mytown']");
	let modalRegdate = modal.find("span[name='regdate']");
	let modalContent = modal.find("textarea[name='content']");


	let replyRegisterBtn = replyForm.find("#replyButton");
	let replyModifyBtn = replyDiv.find("#replyModifyBtn");
	let replyDeleteBtn = replyDiv.find("#replyDeleteBtn");

	//모달창 안에 있는 버튼
	let modalModifyBtn = modal.find("#modalModifyBtn");

	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});


	//댓글 입력 버튼이 눌리면
	replyRegisterBtn.click(function() {
		console.log("컨텐츠 : " + content.val());

		var reply = {
			mno: mno,
			content: content.val()
		};

		//댓글 삽입 
		replyService.add(reply,
			function(result) {

				//댓글 보낸 내역 textArea에서 지우기
				replyForm.find("textarea[name='replyContent']").val("");
				//댓글 목록 불러오기
				showList(-1);

			}); //add end
	}) //replyRegisterBtn end


	//나중에 생성되는 댓글의 이벤트 걸기 - 댓글 하나 가져오기
	replyDiv.on("click", "#replyModifyBtn", function() {
		let mrno = $(this).data("mrno");
		//console.log("mrno : "+mrno);

		replyService.get(mrno, function(data) {
			console.log(data);

			//도착한 데이터를 모달창에 보여주기
			modalNickname.html(data.nickname);
			modalMytown.html(data.mytown);
			modalRegdate.html(replyService.displayTime(data.regdate));
			modalContent.val(data.content);

			modal.modal("show");

		});//get end

		//모달창 안에 있는 수정 버튼이 눌리면
		modalModifyBtn.click(function() {

			var reply = {
				mrno: mrno,
				content: modalContent.val()
			}

			console.log("content : "+modalContent.val())
			
		 	replyService.update(reply,
				function(data) {
					if (data == "success") {
						modal.modal("hide");
						showList(1);
					}
				},
				function(msg) {
					alert(msg);
				}
			)

		}) // modalModifyBtn end

	}) //replyDiv modify end

	//나중에 생성되는 댓글의 이벤트 걸기 - 댓글 삭제하기
	replyDiv.on("click", "#replyDeleteBtn", function() {
		let mrno = $(this).data("mrno");
		console.log("mrno : " + mrno);

		//댓글삭제
		replyService.remove(mrno,
			function(result) {
				if (result == "success") {
					showList(1);
				}
			},
			function(msg) {
				alert(msg);
			}
		);//remove end		

	}) //replyDiv delete end
	
	//대댓글 작성하기
	replyDiv.on("click", "#re-reply", function() {
		let modalRe = $("#re-replyModal");
		
			modalRe.modal("show");
		
	})//re-replyModal end



	//댓글 전체 가져오기
	function showList(page) {
		replyService.getList({ mno: mno, page: page || 1 }, function(data) {

			// 댓글이 없는 경우
			if (data == null || data.length == 0) {
				replyDiv.html("");
				return;
			}

			// 댓글이 있는 경우
			let str = "";
			for (var i = 0, len = data.length || 0; i < len; i++) {
				str += "<div class='dropdown' id='dropdown1'>";
				str += "<i class='fas fa-ellipsis-v' data-toggle='dropdown' aria-expanded='false'></i>";
				//str += "<sec:authentication property='principal' var='info'/>";
				//str += "<sec:authorize access='isAuthenticated()'>";
				str += "<div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>";
				//str += "<c:if test='${info.username == "+data[i].userid+"}'>";
				str += "<div style='display:block;'>";
				str += "<button class='dropdown-item list' id='replyModifyBtn' type='button' data-mrno='" + data[i].mrno + "'>수정하기</button>";
				str += "</div>";
				str += "<div style='display:block;'>";
				str += "<button class='dropdown-item list' id='replyDeleteBtn' type='button' data-mrno='" + data[i].mrno + "'>삭제하기</button></div></div>";
				str += "</div>";
				//str += "</c:if></sec:authorize>";
				str += "<div class='media-object pull-left'>";
				str += "<img src='/resources/images/temp-profile.png' class='img-responsive img-circle profile' alt='Blog Image'>";
				str += "</div>";
				str += "<div class='media-body'>";
				//str += "<span name='userid'>" + data[i].userid + "</span>";
				str += "<span name='nickname'>" + data[i].nickname + "</span>";
				str += "<span name='mytown'>" + data[i].mytown + "</span>";
				str += "<span name='regdate'>" + replyService.displayTime(data[i].updatedate) + "</span>";
				str += "<p style='margin-bottom: 10px; margin-top: 10px;' name='content'>" + data[i].content + "</p>";
				str += "<div><button type='button' id='re-reply'>답글</button></div>";
				str += "</div></div>";
			}
			replyDiv.html(str);


		}); //getList end

	}//showlist end

})







