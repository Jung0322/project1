/**
 * 
 */
$(function(){
	
	 let actionForm = $("#actionForm");
	
	
	$(".rbutton").click(function(e){
	//a태그 속성 중지
	e.preventDefault();
	//actionForm에 bno값을 추가한다
	
	let pno1 =  $(this).attr('href');
	actionForm.append("<input name='num' type='hidden' value='0'/>");
	actionForm.find("input[name='pno']").val(pno1);
	
	//actionForm action 설정 /board/read
	actionForm.attr("action","/solupdate");
	//actionForm 보내기
	actionForm.submit();
	})
})