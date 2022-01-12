/**
 *	header.jsp 
 */

$(function() {

	$.ajax ({
		url: "/member/getProfileImg",
		type: "get",
		success: function(result) {
			console.log(result);
			
			if(result != null) {
				$(result).each(function(idx, obj) {
					var fileCallPath = encodeURIComponent(obj.profileUploadPath+"\\"+obj.pfuuid+"_"+obj.profileImgName);
					var str = "/member/profileDisplay?fileName="+fileCallPath;
					
					$(".profile").attr("src", str);
				})
			}
		}
	})
})