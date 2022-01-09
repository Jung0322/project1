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
	callbacks:{
		onImageUpload: function(files){
			//for(var i = files.length - 1; i >=0; i--){
				uploadSummernoteImageFile(files,this);
			//}
		}
	}
});

formData = new FormData();
	 

function uploadSummernoteImageFile(files, el){
	 
	console.log("image upload");	
	
	for (var i = 0; i < files.length; i++) {		
		formData.append("uploadFile", files[i]);
	}
	
	$.ajax({
		url: '/uploadImage',
		type: 'POST',
		processData: false,
		contentType: false,
		beforeSend:function(xhr){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		},
		data: formData,		
		success: function(data){
			
			console.log(data);
			
			$(data).each(function(idx, obj) {			
				
				data.url = "/ccoli/"+obj.muploadPath+"/"+obj.muuid+"_"+obj.mimgName;		
				console.log(data.url);
			
				$(el).summernote('editor.insertImage',data.url);
			});
		}
	});
	
}





















