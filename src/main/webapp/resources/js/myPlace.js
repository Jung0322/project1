/**
 * 
 */

$(function() {
	
	// myPlace 게시글 읽기
	$(".move").click(function(e) {

	let actionForm = $("#actionForm");
	
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
	
	// myPlace 게시글 수정하기
	let formObj = $("#actionForm");
	
	$("#hiddenBtn").click(function(e){
		e.preventDefault();
		
		
	})
	
	
	
	
})



