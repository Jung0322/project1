/**
 * 
 */
$(function(){
	
	 let actionForm = $("#actionForm");
	
	$(".mbutton").click(function(e){
	//a태그 속성 중지
	e.preventDefault();
	//actionForm에 bno값을 추가한다
	
	let pno1 =  $(this).attr('href');
	console.log(pno1);
	actionForm.find("input[name='pno']").val(pno1);
	
	//actionForm action 설정 /board/read
	actionForm.attr("action","/read");
	//actionForm 보내기
	actionForm.submit();
	})
})