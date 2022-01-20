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
	
		$(".paginate_button a").click(function(e) {

		e.preventDefault();

		let pageNum = $(this).attr("href");
		actionForm.find("input[name='pageNum']").val(pageNum);
		actionForm.attr("action", "/board/myPlace");
		actionForm.find("input[name='mno']").remove();
		actionForm.submit();
	})
		
})