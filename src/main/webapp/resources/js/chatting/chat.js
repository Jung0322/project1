/**
 * 
 */
$(".chat_exit").click(function(){
	//  채팅방 나가기 이미지 클릭시
	
	$(".modal").show();
	let chat_delete_roomid = $(".chat_exit").attr("id");
	console.log("방번호!!!!!:::"+chat_delete_roomid);
	$("#delete_yes").click(function(){
		$.ajax({
			url : chat_delete_roomid+"_delete.do",
			data:{
				roomid:chat_delete_roomid
			},
			success:function(data){
				if(data=="success"){
					alert("채팅방 삭제되었습니다.");
					$(".modal").hide();
				}else{
					alert("삭제가 되지 않았씁니다.");
					$(".modal").hide();
				}
			}
			
		})
		
	})
	$("#delete_no").click(function(){
		$(".modal").hide();
	})

	
})