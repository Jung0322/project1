/**
 * register.jsp
 */
$(function(){
	
	//remove, list 일 때 전송될 폼
   let formObj = $("#actionForm");
    
   $(".registration").click(function(e){
      e.preventDefault(); //submit 막기
      
      //어느버튼에서 명령이 왔는가
      //data-*(아무거나 와도된다.)
      let oper = $(this).data("oper");
      
      if(oper=='modify'){
         formObj = $("form[role='form']")

		//첨부된 파일 정보 수집하기
		var str = "";
		$(".uploadResult ul li").each(function(i,obj){
			var ele = $(obj);
			
			str +="<input type='hidden' name='attachList["+i+"].puuid' value='"+ele.data('uuid')+"'>";
			str +="<input type='hidden' name='attachList["+i+"].puploadPath' value='"+ele.data('path')+"'>";
			str +="<input type='hidden' name='attachList["+i+"].pimgname' value='"+ele.data('filename')+"'>";
		})
		
		if(str==""){
			alert("상품사진을 첨부하세요");
			return;
		}
		
		console.log("form");
		console.log(str);
		
		//현재 폼에 첨부파일 정보 추가하기
      	formObj.append(str);

      }else if(oper=='remove'){
         formObj.attr("action","/product/delete").attr("method","post");
      }else{
         formObj.attr("action","/product/sellproduct")
               .attr("method","get")
               .find("input[name='pno']").remove();
      }

		if($("select[name='category']").val()==''){
			alert("카테고리를 입력하세요");
			return;
		}else if($("select[name='delivery']").val()==''){
			alert("택배가능 여부를 입력하세요");
			return;
		}else if($("select[name='discount']").val()==''){
			alert("내고가능 여부를 입력하세요");
			return;
		}else if($("input[name='title']").val()==''){
			alert("제목을 입력하세요");
			return;
		}else if($("input[name='price']").val()==''){
			alert("가격을 입력하세요");
			return;
		}

	  formObj.submit();
   })
	
	
	let uploadResult = $(".uploadResult ul");
	let str1="";
	
	// 상품 이미지 가져오기
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
 				 var fileCallPath = encodeURIComponent(obj.puploadPath+"\\s_"+obj.puuid+"_"+obj.pimgname);
               
			   //원본 이미지 경로 생성
				var originPath = obj.puploadPath+"\\"+obj.puuid+"_"+obj.pimgname;
				originPath = originPath.replace(new RegExp(/\\/g),"/");
				
				
               str1+="<li data-path='"+obj.puploadPath+"' data-uuid='"+obj.puuid+"'";
			   str1+=" data-filename='"+obj.pimgname+"'>";
               str1+="<img src='/display?fileName="+fileCallPath+"'>";
			   str1+="<div>"+obj.pimgname+"</a> ";
			   str1+="<button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"'><i class='fa fa-times'></i></button>";
      		   str1+="</div></li>";            
        
            
         }) //$(data).each end
		 uploadResult.html(str1);	   
		}
	})// 전체 첨부물 가져오기 종료
	
	
	
	$("input[type='file']").change(function(e){
		e.preventDefault();
		
		console.log("업로드 요청");
		
		//formData 객체 생성 - ajax 형태로 데이터를 보낼때
		//keyvalue 형태로 쌍을 생성해 줌
		var formData =  new FormData();
		
		//첨부 파일 목록 가져오기
		var inputFile = $("input[name='uploadFile']");
		
		//console.log(inputFile);
		
		var files = inputFile[0].files;
		
		//가져온 목록을 formData에 추가하기
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			//conroller의 uploadFile
			formData.append("uploadFile",files[i]);
		}
		//query string : http://localhost:8080/upload?name=~~~
		//processData:false (데이터를 query string 형태로 변환할 것인가?)
		//contentType:false (application/x-www-form-urlencoded 로 보낼 것인가?)
		
		$.ajax({
			url:'/uploadAjax',
			type:'post',
			processData:false,
			contentType:false,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue)
			},
			data:formData,
			success:function(result){
				console.log(result);
				showUploadFile(result);
				$("input[name='uploadFile']").val("");
			},
			error(xhr,status,error){
				console.log(xhr.responseText);
			}
		})
	})//uploadBtn end
	
	//첨부된 파일 목록 보여주기
	function showUploadFile(uploadResultArr){
		
		//첨부파일 결과를 보여줄 영역 가져오기
		var uploadResult =  $(".uploadResult ul");
		
		var str="";
		$(uploadResultArr).each(function(idx,obj){
			
				
				//썸네일 이미지 경로 생성
				//encodeURIComponent(): 영어,숫자랑 입부 특수문자는 인코딩 하지 않음
				//encodURI(): 영어,숫자,특수문자 인코딩 안함(공백은 인코딩 ) 
 				 var fileCallPath = encodeURIComponent(obj.puploadPath+"\\s_"+obj.puuid+"_"+obj.pimgname);
               
			   //원본 이미지 경로 생성
				var originPath = obj.puploadPath+"\\"+obj.puuid+"_"+obj.pimgname;
				originPath = originPath.replace(new RegExp(/\\/g),"/");
				
				
               str+="<li data-path='"+obj.puploadPath+"' data-uuid='"+obj.puuid+"'";
			   str+=" data-filename='"+obj.pimgname+"'>";
               str+="<img src='/display?fileName="+fileCallPath+"'>";
			   str+="<div>"+obj.pimgname+"</a> ";
			   str+="<button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"'><i class='fa fa-times'></i></button>";
      		   str+="</div></li>";            
         })   
		console.log(str);
		
		uploadResult.append(str);
	}
	
	function checkExtension(fileName,fileSize){
		var regex = new RegExp("(.*?)\.(jpg|gif|png)$");
		var maxSize = 2097152;//약 2 MB
		
		if(fileSize > maxSize){
			alert("파일사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}//checkExtension end
	
	
	
	//첨부파일 목록에서 X 누르면 목록에서 지우기
	$(".uploadResult").on("click","button",function(){
		//삭제할 파일 가져오기
		let targetFile =  $(this).data("file");
		//삭제할 파일 타입 가져오기
		let type = $(this).data("type");
		//x버튼의 부모 li 가져오기
		var targetLi = $(this).closest("li");
		
		if(confirm("정말로 파일을 삭제하시겠습니까")){
			//목록에서 지우기
			targetLi.remove();
		}
	})// X 버튼 종료
	
})



