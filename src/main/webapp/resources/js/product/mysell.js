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
	
	$(".sbutton").click(function(e){
	//a태그 속성 중지
	e.preventDefault();
	//actionForm에 bno값을 추가한다
	
	let pno1 =  $(this).attr('href');
	let resval =  $(this).data('val');
	console.log(pno1);
	console.log(resval);
	actionForm.append("<input name='num' type='hidden' value="+resval+" />");
	actionForm.find("input[name='pno']").val(pno1);
	
	console.log(actionForm.find("input[name='num']").val());
	console.log(actionForm.html());
	//actionForm action 설정 /board/read
	actionForm.attr("action","/resupdate");
	//actionForm 보내기
	actionForm.submit();
	})
	
	$(".rbutton").click(function(e){
	//a태그 속성 중지
	e.preventDefault();
	//actionForm에 bno값을 추가한다
	
	let pno1 =  $(this).attr('href');
	actionForm.append("<input name='num' type='hidden' value='1'/>");
	actionForm.find("input[name='pno']").val(pno1);
	
	//actionForm action 설정 /board/read
	actionForm.attr("action","/solupdate");
	//actionForm 보내기
	actionForm.submit();
	})
})