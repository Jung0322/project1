/**
 * 
 */
var cc = 0;
$(function(){
	console.log("zz"+ cc);
	if(userid!=null){
			$.ajax({
				url:'/selectgood',
				type:'post',
				contentType:'application/json',
				beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue)
				},
				data:JSON.stringify({
				pno:pno,
				userid:userid
				}),
				success:function(data){
					console.log("값확인"+data);
					console.log(data==null);
					if(data==null||data==""){
						$("#asd").attr("src","/resources/images/NotGood.png");
						cc=1;
					}else{
						$("#asd").attr("src","/resources/images/Good.png");
						cc=2;
					}
				},
				error:function(xhr,status,error){
					alert(xhr.responseText);
				}
			
			})
			setTimeout(function(){
				if(cc==1){
					$(".heart").click(function(){
							$.ajax({
							url:'/insertgood',
							type:'post',
							contentType:'application/json',
							beforeSend:function(xhr){
							xhr.setRequestHeader(csrfHeaderName,csrfTokenValue)
							},
							data:JSON.stringify({
							pno:pno,
							userid:userid
							}),
							success:function(data){
								console.log("확인 : "+data);
								if(data=='success'){
									$("#asd").attr("src","/resources/images/Good.png");
									cc=2;
								}
							},
							error:function(xhr,status,error){
								alert(xhr.responseText);
							}
			
						})
					})
			
			}else{
				$(".heart").click(function(){
							$.ajax({
							url:'/deletegood',
							type:'post',
							contentType:'application/json',
							beforeSend:function(xhr){
							xhr.setRequestHeader(csrfHeaderName,csrfTokenValue)
							},
							data:JSON.stringify({
							pno:pno,
							userid:userid
							}),
							success:function(data){
								if(data=='success'){
									$("#asd").attr("src","/resources/images/NotGood.png");
									cc=1;
									
								}
							},
							error:function(xhr,status,error){
								alert(xhr.responseText);
							}
			
						})
					})
			}
			}, 1000);
		
	}
	
	console.log($("#asd").attr("src"));

	let delivery = $(".delivery");
	let discount = $(".discount");
	let reservation = $(".reservation");
	
	if(delivery1==1){
		delivery.text("택배가능여부 : 가능");
	}else{
		delivery.text("택배가능여부 : 불가능");
	}
	
	if(discount1==1){
		discount.text("내고여부 : 가능");
	}else{
		discount.text("내고여부 : 불가능");
	}
	
	if(reservation1==1){
		reservation.text("예약여부 : 예약중");
	}else{
		reservation.text("예약여부 : 예약가능");
	}
						
	let uploadResult = $(".images");		
	
	let str="";
	
	let imgslide = $(".imgslide");
	
	let imgStr="";
	
	var i = 1;
	
	//해당 상품 이미지 가져오기
	$.getJSON({
		url:'/getAttachList',
		data:{
			pno:pno
		},
		success:function(data){
			console.log(data);
			//도착한 첨부파일을 보여주기
			$(data).each(function(idx,obj){
				
			//썸네일 이미지 경로 생성
			//encodeURIComponent(): 영어,숫자랑 입부 특수문자는 인코딩 하지 않음
			//encodURI(): 영어,숫자,특수문자 인코딩 안함(공백은 인코딩 ) 
			 var fileCallPath = encodeURIComponent(obj.puploadPath+"\\"+obj.puuid+"_"+obj.pimgname);
				
			if(idx==0){
               str+="<div class='mySlides fade2'>";
			   str+=" <img class='main_slideImg' src=/display?fileName="+fileCallPath;
			   str+="> </div>";				
			}else{
			   str+="<div class='mySlides fade2' style='display:none'>";
			   str+=" <img class='main_slideImg' src=/display?fileName="+fileCallPath;
			   str+="> </div>";	
			}

			 imgStr+="<span class='imagedot' onclick='currentSlide("+i+")'></span> ";
			   i++;

           
         }) //$(data).each end

		 uploadResult.html(str+uploadResult.html());	  
		 imgslide.html(imgStr);
		}
	})// 전체 첨부물 가져오기 종료		
				

})

		/*$.ajax({
							url:'/updategood',
							type:'post',
							contentType:'application/json',
							beforeSend:function(xhr){
							xhr.setRequestHeader(csrfHeaderName,csrfTokenValue)
							},
							data:JSON.stringify({
							num:1,
							pno:userid
							}),
							success:function(data){
								if(data=='success'){
									$("#asd").attr("src","/resources/images/NotGood.png");
									cc=1;
									alert("업데이트성공");
								}else{
									alert("업데이트삭제실패");
								}
							},
							error:function(xhr,status,error){
								alert(xhr.responseText);
							}
			
						})*/