/**
 *	header.jsp 
 */

$(function() {
	$.ajax ({
		url: "/member/getProfileImg",
		typ: "get",
		success: function(data) {
			console.log(data);
			
			if(data != null) {
				$(data).each(function(idx, obj) {
					var fileCallPath = encodeURIComponent(obj.profileUploadPath+"\\"+obj.pfuuid+"_"+obj.profileImgName);
					var str = "/member/profileDisplay?fileName="+fileCallPath;
					
					$(".profile").attr("src", str);
				})
			}
		}
	})
})