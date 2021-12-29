/**
 * 
 */

let replyService = (function(){
	
	function add(reply, callback){
		
		$.ajax({
			url : '/replies/new',
			type: 'post',
			contentType: 'application/json',
			success: function(result){
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr,status,err){
				error(err);
			}
		})
	}
	
	function getList(param, callback) {
		
		let mno = param.mno;
		
		let page = param.page || 1;
		
		$.getJSON({
			url: '/replies/pages'+mno+'/'+page,
			success:function(data){
				callback(data.replyCnt,data.list);
			}
		})
	}
})