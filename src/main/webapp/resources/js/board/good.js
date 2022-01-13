/**
 * 
 */

//좋아요 갯수 증가
$(function(){	
	
	console.log("좋아요체크 : "+good_check);
	
	//좋아요 테이블의 사용자에 대한 정보가 있다면
	if(good_check == 'true'){
		//녹색으로 표시
		$("#ques").css("color","#9BB460");
	}else{
		//검은색으로 표시
		$("#ques").css("color","#333");
	}
	
	$("#ques").click(function(){
			console.log ("로그인 아이디 : "+replyer);
			console.log ("글 작성자 : "+writer);
		
		if(!replyer){
			alert("로그인 후 이용 가능합니다.");
			return;
		}
		
		if(replyer==writer){
			alert("본인이 작성한 글에서는 이용할 수 없는 기능입니다.");
			return;
		}
				
		//버튼 색상이 검정색이라면
		if($("#ques").css("color") == "rgb(51, 51, 51)"){
			//체크를 1로
			favoriteBtn = 1;
		}else { // 버튼 색상이 녹색이라면 체크를 -1로
			favoriteBtn = -1;
		}
		console.log("사용자 : "+userid, "mno :"+mno, "good_check : "+good_check);
		
		$.ajax({
			url: '/curious/insertGood',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue)
			},
			data:{
				mno:mno,
				userid:userid,
				//버튼색상이 눌려서 녹색으로 변경되었다면 1이 전송, 검정색으로 변경되었다면 -1이 전송
				favoriteBtn:favoriteBtn
			},
			success: function(data){
				console.log("값 :",data);
				if($.trim(data)=='add success'){
					//좋아요 갯수가 증가되었다면 색상을 녹색으로 변경
					$("#ques").css("color","#9BB460");
					//좋아요 갯수 증가시켜주기
					$("#quesCnt").html(parseInt($("#quesCnt").html()) + 1);			
				}else{
					//좋아요 갯수가 감소되었다면 색상을 검정으로 변경
					$("#ques").css("color","#333");
					//좋아요 갯수 증가시켜주기
					$("#quesCnt").html(parseInt($("#quesCnt").html()) - 1);	
				}
			} 
			
		})
				
		
	}) //ques end
	
	
})