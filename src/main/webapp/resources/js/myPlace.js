/**
 * 
 */

$(function() {

	let actionForm = $("#actionForm");
	
	// myPlace 게시글 읽기
	$(".move").click(function(e) {


		//a 태그 속성 중지
		e.preventDefault();

		let mno = $(this).attr('href');

		//actionForm에 bno 값을 추가
		actionForm.find("input[name='mno']").val(mno);

		//actionForm action 설정
		actionForm.attr("action", "/board/read");

		//actionForm 보내기
		actionForm.submit();
	})
	
	//게시글 수정하기
	$("submit").click(function(e) {

		e.preventDefault();

		let oper = $(this).data("oper");

		if (oper == 'modify') {
			formOdj = $("form[role='form']");
			formObj.submit();
		}

	})
	
		$(".paginate_button a").click(function(e){
		
		e.preventDefault();
		
		let pageNum = $(this).attr("href");
		actionForm.find("input[name='pageNum']").val(pageNum);
		actionForm.attr("action","/board/myPlace");
		actionForm.find("input[name='mno']").remove();
		actionForm.submit();
	})
	
	//댓글 작업
	
	//댓글 입력창 영역 가져오기
	let replyForm = $("#replyForm");
	let content = replyForm.find("input[name='replyContent']");
	let replyRegisterBtn = replyForm.find("#replyButton"); 
	
	$(document).ajaxSend(function(e,xhr,options){
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	
	
	//댓글 삽입 
	replyService.add(
		{mno:mno,userid:'ccoli1',nickname:'콜리',content:'댓글삽입'},
				function(result){
					if(result){
						alert(result);
					}
	}); //add end
	
	replySerive.getList({mno:mno,page:1},function(data){
		
	}); //getList end
	
	replyService.remove(24,
		function(result){
			alert(result);
		},
		function(){
			alert(msg);
		}
	
	);
	
	
	
	

	
	//댓글 등록 버튼 클릭시
	/*$("#replyButton").click(function(){
		
		var reply = {
			mno: mno,
			replyer: nickname.val(),
			reply: content.val()
		};
		
		replyService.add(reply,
			function(result){
				if(result){
					if(result == 'success'){
						alert("댓글등록성공");
					}
				}
			});
	})
	
	//댓글 전체 가져오기 함수 호출
	showList(1);
	
	//댓글 보여줄 영역 가져오기
	let replyUi = $(".blog-reply");
	
	function showList(){
		replyService.getList({mno:mno}, function(data){
			
			//댓글이 없는 경우
			if (data == null || data.length == 0 ){
				replyUi,html("");
				return;
			}
			
			//댓글이 있는 경우
			let str = "";
			for (var i = 0, len = data.length || 0; i < len; i++){
				str += "<span name=''nickname'>"+data[i].nickname+"</span>"; 
				str += "<span name='mytown'>"+data[i].mytown+"</span>";
				str += "<span name='regdate'>"+data[i].regdate+"</span>";
				str += "<p name='content'>"+data[i].content+"</p>";
			}
			
			replyUi.html(str);
		});
	}*/

})







