/**
 * 
 */

$(function(){
	
	let actionForm = $("#actionForm");
	
	$(".move").click(function(e){
		e.preventDefault();
		
		let mno = $(this).attr('href');
		
		actionForm.find("input[name='mno']").val(mno);
		actionForm.attr("action","/board/read");
		actionForm.sumit();
	})
})

