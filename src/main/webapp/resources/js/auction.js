/**
 * 
 */
$(function(){
	
	//css 화면 비율 때문에 class명 수정
	$( 'ul li:nth-child(1)' ).attr('class','first product')

	$( 'ul li:nth-child(4)' ).attr('class','last product')

	$( 'ul li:nth-child(5)' ).attr('class','first product')

	$( 'ul li:nth-child(8)' ).attr('class','last product')
	
	
/*	var fileCallPath = encodeURIComponent(orginPath);
	
	console.log("파일 경로"+fileCallPath);
	$( '.product li img').attr('src','/display?fileName='+fileCallPat);*/
	
	//페이지 나누기 스크립트
   let actionForm = $("#actionForm");
   
   //번호 클릭 시 클릭된 번호 값 가져오기
   $(".paginate_button a").click(function(e){
      //a 태그의 속성을 중지
      e.preventDefault();
      //번호 값 가져오기
      let pageNum = $(this).attr("href");
      
      //가져온 번호를 actionForm 안의 pageNum 값으로 대체
      actionForm.find("input[name='pageNum']").val(pageNum);

	  //action 수정
		actionForm.attr("action","/auction/auction");
		//pno제거
		actionForm.find("input[name='ano']").remove();	
		
      //폼 전송
      actionForm.submit();
	})
	
	$('.orderby').change(function(){
		let form = $(".woocommerce-ordering");
		
		form.find("input[name='pageNum']").val("1");
		form.submit();
	});
	
						
						
						
						
						
					
	

})