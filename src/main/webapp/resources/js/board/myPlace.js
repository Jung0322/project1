/**
 * 
 */

$(function() {

	console.log(replyer);

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

	
	//댓글 작업
	//댓글 입력창 영역 가져오기
	let modal = $("#replyModal");
	let replyForm = $("#replyForm");
	let content = replyForm.find("textarea[name='replyContent']");

	//댓글 정보 출력할 영역 가져오기
		
	let modalUserid = modal.find("span[name='userid']");
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
		
		if(content.val()==""){
			alert("댓글을 작성해주세요");
			return;
		}

		var reply = {
			mno: mno,
			content: content.val()
		};
		
		console.log("댓글 수 : "+replyCnt);

		//댓글 삽입 
		replyService.add(reply,
			function(result) {

				//댓글 보낸 내역 textArea에서 지우기
				replyForm.find("textarea[name='replyContent']").val("");
				//댓글 목록 불러오기
				showList(-1);

			}); //add end
			
				//댓글 갯수 업데이트 해서 보여주기
				$("#replyCnt").html((replyCnt+=1)+" Comments");	
			
	}) //replyRegisterBtn end


	//나중에 생성되는 댓글의 이벤트 걸기 - 댓글 하나 가져오기
	replyDiv.on("click", "#replyModifyBtn", function() {
		let mrno = $(this).data("mrno");
		//console.log("mrno : "+mrno);

		replyService.get(mrno, function(data) {
			console.log(data);

			modalUserid.html(data.userid);
			
			//댓글 작성자 가져오기
			let oriReplyer = modalUserid.html();
			console.log("로그인 사용자"+replyer);
			console.log("댓글 작성자"+oriReplyer)
			if(!replyer){
				alert("로그인 후 댓글 수정이 가능합니다.");
				return;
			}
			
			
			if(replyer != oriReplyer){
				alert("본인이 작성한 댓글만 수정가능합니다.");
				return;
			}
			
			//도착한 데이터를 모달창에 보여주기
			modalNickname.html(data.nickname);
			modalMytown.html(data.mytown);
			modalRegdate.html(replyService.displayTime(data.regdate));
			modalContent.val(data.content);

			modal.modal("show");

		});//get end

		//모달창 안에 있는 수정 버튼이 눌리면
		modalModifyBtn.click(function() {
			//댓글 작성 확인
			if(modalContent.val()==""){
				alert("댓글을 작성해주세요.");
				return;
			}
			
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
				})

		}) // modalModifyBtn end

	}) //replyDiv modify end

	//나중에 생성되는 댓글의 이벤트 걸기 - 댓글 삭제하기
	replyDiv.on("click", "#replyDeleteBtn", function() {
		let mrno = $(this).data("mrno");
		console.log("mrno : " + mrno);
		
		//댓글 갯수 업데이트 해서 보여주기
		$("#replyCnt").html((replyCnt-=1)+" Comments");	

		replyService.get(mrno, function(data) {
			console.log(data);

			modalUserid.html(data.userid);
			
			//댓글 작성자 가져오기
			let oriReplyer = modalUserid.html();
			console.log("로그인 사용자"+replyer);
			console.log("댓글 작성자"+oriReplyer)
			
			if(!replyer){
				alert("로그인 후 댓글 삭제가 가능합니다.");
				return;
			}
			
			if(replyer != oriReplyer){
				alert("본인이 작성한 댓글만 삭제가능합니다.");
				return;
			}else{
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

			};
		
		})//get end	

	}) //replyDiv delete end
	
	//대댓글 작성하기
	/*replyDiv.on("click", "#re-reply", function() {
		let modalRe = $("#re-replyModal");
		
		//userid를 이용해 로그인 한 사용자 정보 가져오기
		
		
		//가져온 정보 모달 창에 뿌리기
		
		
			modalRe.modal("show");
		
	})*///re-replyModal end



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
				str += "<div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>";
				str += "<div style='display:block;'>";
				str += "<button class='dropdown-item list' id='replyModifyBtn' type='button' data-mrno='" + data[i].mrno + "'>수정하기</button>";
				str += "</div>";
				str += "<div style='display:block;'>";
				str += "<button class='dropdown-item list' id='replyDeleteBtn' type='button' data-mrno='" + data[i].mrno + "'>삭제하기</button></div></div>";
				str += "</div>";
				str += "<div class='media-object pull-left'>";
				str += "<img src='/resources/images/temp-profile.png' class='img-responsive img-circle pro' alt='Blog Image'>";
				str += "</div>";
				str += "<div class='media-body'>";
				str += "<span name='nickname'>" + data[i].nickname + "</span>";
				str += "<span name='mytown'>" + data[i].mytown + "</span>";
				str += "<span name='regdate'>" + replyService.displayTime(data[i].updatedate) + "</span>";
				str += "<p style='margin-bottom: 10px; margin-top: 10px;' name='content'>" + data[i].content + "</p>";
				//str += "<div><button type='button' id='re-reply'>답글</button></div>";
				str += "</div></div>";
			}
			replyDiv.html(str);


		}); //getList end

	}//showlist end
	

}) // function end
