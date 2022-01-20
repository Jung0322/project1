/**
 * 
 */

$(function() {

	console.log(replyer);

	// 댓글 전체 가져오기
	showList(1);

	// 댓글 보여줄 영역 가져오기
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
	let replyForm = $("#replyForm");
	let content = replyForm.find("textarea[name='replyContent']");


	let replyRegisterBtn = replyForm.find("#replyButton");
	let replyModifyBtn = replyDiv.find("#replyModifyBtn");
	let replyDeleteBtn = replyDiv.find("#replyDeleteBtn");


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


	
	//나중에 생성되는 댓글의 이벤트 걸기 - 댓글 수정하기
	replyDiv.on("click", ".btn-modify", function() {
		
		let mrno = $(this).data("mrno");
		console.log("댓글 번호 : "+mrno);
		
		//댓글 수정 시 댓글 정보 출력할 영역 가져오기
		let modifyContent = $(".replyAreaHidden"+mrno).find("#modifyContent");
									
		//버튼 영역 가져오기
		let hiddenModifyBtn = $(".replyAreaHidden"+mrno).find("#hiddenModifyBtn");
		let hiddenCancelBtn = $(".replyAreaHidden"+mrno).find("#hiddenCancelBtn");
			
		replyService.get(mrno, function(data) {
			console.log(data);
			
			//댓글 작성자 가져오기
			let oriReplyer = data.userid;
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
		
			// 원래 댓글 영역 숨기고, 수정 필드 보여주기
			$("#replyModifyBtn"+mrno).closest(".replyArea").hide();
			$(".replyAreaHidden"+mrno).show();
							
			//도착한 댓글 내용을 보여주기
			let modifyContent = $(".replyAreaHidden"+mrno).find("#modifyContent");
			modifyContent.val(data.content);					

		});//get end
		

		//수정창에 있는 수정 버튼이 눌리면
		hiddenModifyBtn.click(function() {
			//댓글 작성 확인
			if(modifyContent.val()==""){
				alert("댓글을 작성해주세요.");
				return;
			}
			
			var reply = {
				mrno: mrno,
				content: modifyContent.val()
			}

			console.log("content : "+modifyContent.val())
			
		 	replyService.update(reply,
				function(data) {
					if (data == "success") {
						showList(1);
					}
				},
				function(msg) {
					alert(msg);
				})

		}) // hiddenModifyBtn end
		
		//수정창에 있는 취소 버튼이 눌리면
		hiddenCancelBtn.click(function() {
			showList(1);
		})

	}) //replyDiv modify end

	//나중에 생성되는 댓글의 이벤트 걸기 - 댓글 삭제하기
	replyDiv.on("click", "#replyDeleteBtn", function() {
		let mrno = $(this).data("mrno");
		console.log("mrno : " + mrno);
		
		//댓글 갯수 업데이트 해서 보여주기
		$("#replyCnt").html((replyCnt-=1)+" Comments");	

		replyService.get(mrno, function(data) {
			console.log(data);

			
			//댓글 작성자 가져오기
			let oriReplyer = data.userid;
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
	
	
	//댓글 전체 가져오기
	function showList(page) {
		replyService.getList({ mno: mno, page: page || 1 }, function(data) {

			// 댓글이 없는 경우
			if (data == null || data.length == 0) {
				replyDiv.html("");
				return;
			}

			// 댓글이 있는 경우
			// 원래 출력하는 댓글 영역
			let str = "";
			for (var i = 0, len = data.length || 0; i < len; i++) {
				str += "<div class ='replyArea'>";
				str += "<div class='dropdown' id='dropdown1'>";
				str += "<i class='fas fa-ellipsis-v' data-toggle='dropdown' aria-expanded='false'></i>";
				str += "<div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>";
				str += "<button class='dropdown-item list btn-modify' id='replyModifyBtn"+data[i].mrno+"' type='button' data-mrno='" + data[i].mrno + "'>수정하기</button>";
				str += "<button class='dropdown-item list' id='replyDeleteBtn' type='button' data-mrno='" + data[i].mrno + "'>삭제하기</button>";
				str += "</div></div>";
				str += "<div class='media-object pull-left'>";
				
				// 프로필 이미지가 없는 경우
				if(data[i].profileList[0].pfuuid == null) {
					str += "<img src='/resources/images/temp-profile.png' class='img-responsive img-circle pro'>";
				} else { 	// 프로필 이미지가 있는 경우
					uploadPath = data[i].profileList[0].profileUploadPath;
					fileName = data[i].profileList[0].profileImgName;
					uuid = data[i].profileList[0].pfuuid;
					
					orgPath = uploadPath + "\\" + uuid + "_" + fileName;

					str += "<img src='/member/profileDisplay?fileName="+encodeURIComponent(orgPath)+"' class='img-responsive img-circle pro'>";
				}
							
				str += "</div>";
				str += "<div class='media-body'>";
				str += "<span name='nickname' class='replyElement'>" + data[i].nickname + "</span>";
				str += "<span name='mytown' class='replyElement'>" + data[i].mytown + "</span>";
				str += "<span name='regdate' class='replyElement'>" + replyService.displayTime(data[i].updatedate) + "</span>";
				str += "<p name='content' id='showReplyContent'>" + data[i].content + "</p>";
				str += "</div></div></div>";
				
				
				// 댓글 수정시 나타나는 댓글 영역
				str += "<div class ='replyAreaHidden"+data[i].mrno+"' id='replyAreaHidden' style='display:none;'>";
				str += "<div class='media-object pull-left' id='profile'>";
				
				// 프로필 이미지가 없는 경우
				if(data[i].profileList[0].pfuuid == null) {
					str += "<img src='/resources/images/temp-profile.png' class='img-responsive img-circle pro hiddenImg' alt='Blog Image'>";
				} else { // 프로필 이미지가 있는 경우
					uploadPath = data[i].profileList[0].profileUploadPath;
					fileName = data[i].profileList[0].profileImgName;
					uuid = data[i].profileList[0].pfuuid;
					
					orgPath = uploadPath + "\\" + uuid + "_" + fileName;

					str += "<img src='/member/profileDisplay?fileName="+encodeURIComponent(orgPath)+"' class='img-responsive img-circle pro'>";
				}
							
				str += "</div>";
				str += "<div class='media-body clearfix'>";
				str += "<span name='nickname' id='nicknameHidden'>" + data[i].nickname + "</span>";
				str += "<span name='mytown' id='mytownHidden'>" + data[i].mytown + "</span></div>";
				str += "<div><textarea name='content' id='modifyContent'></textarea></div>";
				str += "<div><button type='button' id='hiddenCancelBtn'>취소</button>";
				str += "<button type='button' id='hiddenModifyBtn'>수정</button></div>";
				str += "</div>";
			}
			replyDiv.html(str);


		}); //getList end

	}//showlist end
	
}) // function end
