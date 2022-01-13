/**
 * 
 */
$('#summernote').summernote({
	height: 300,
	minHeight: null,
	maxHeight: null,
	focus: true,
	lang: 'ko-KR',
	placeholder: "내용을 작성해주세요",
	toolbar: [
		['font', ['sans-serif', 'Arial']],
		['fontname', ['fontname']],
		['fontsize', ['fontsize']],
		['style', ['bold']],
		['color', ['forecolor', 'color']],
		['para', ['ul', 'ol', 'paragraph']],
		['height', ['height']],
		['insert', ['picture', 'link']],
		['view', ['fullscreen', 'help']]
	],
	callbacks: {
		onImageUpload: function(files) {
			//for(var i = files.length - 1; i >=0; i--){
			uploadSummernoteImageFile(files, this);
			//}
		}
	}
});

formData = new FormData();

function uploadSummernoteImageFile(files, el) {

	console.log("image upload");

	for (var i = 0; i < files.length; i++) {
		formData.append("uploadFile", files[i]);
	}

	$.ajax({
		url: '/uploadImage',
		type: 'POST',
		processData: false,
		contentType: false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		data: formData,
		success: function(data) {

			console.log(data);

			$(data).each(function(idx, obj) {

				data.url = "/ccoli/" + obj.muploadPath + "/" + obj.muuid + "_" + obj.mimgName;
				console.log(data.url);

				$(el).summernote('editor.insertImage', data.url);
			});
		}
	});
	
	

}


$(function() {
	
		//게시물 삭제시 폴더에 있는 이미지 삭제하기
		/*$("#Button").click(function(){
			
			let fileName = $('.note-editable').find('img').attr('src');
			
			console.log("파일이름 : "+fileName);
	
			$.ajax({
				url:'/deleteImage',
				type:'POST',
				data:fileName,
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			success:function(data){
				alert("삭제성공");
			}			
			})
			
			
		})*/	
	

	//입력 요소 찾아오기
	let writeForm = $("#writeForm")
	let title = writeForm.find("input[name='title']");
	let content = writeForm.find("textarea[name='content']");

	$("#successButton").click(function(e) {

		e.preventDefault();

		if (title.val() == "") {
			alert("제목을 작성해주세요.");
			return;
		} else if (content.val() == "") {
			alert("내용을 작성해주세요.");
			return;
		}
		writeForm.attr("action", "/board/write");
		writeForm.submit();

	}) //글 작성 버튼 end
	
		console.log("카테고리 : "+mcategory);
		
		//작성할 때 선택한 카테고리 수정 페이지에서 보여주기
		if(mcategory == '동네질문'){
			$("#mcategory").val('동네질문').prop("selected",true);
		}else if (mcategory == '동네맛집'){
			$("#mcategory").val('동네맛집').prop("selected",true);	
		}else if (mcategory == '동네소식'){
			$("#mcategory").val('동네소식').prop("selected",true);	
		}else if (mcategory == '동네사건사고'){
			$("#mcategory").val('동네사건사고').prop("selected",true);	
		}else if (mcategory == '일상'){
			$("#mcategory").val('일상').prop("selected",true);	
		}else if(mcategory == '기타'){
			$("#mcategory").val('기타').prop("selected",true);	
		}
		
})



















