/**
 * reply와 관련된 스크립트
 */

let replyService = (function(){
	
	function add(reply, callback){
		console.log("add method 실행");
		
		$.ajax({
			url: '/replies/new',
			type: 'post',
			contentType: 'application/json',
			data: JSON.stringify(reply),
			success: function(result){
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr,status,err){
				error(err);
			}
		})
	} // add end
	
	function getList(param, callback) {
		
		let mno = param.mno;
		let page = param.page || 1;
		
		$.getJSON({
			url: '/replies/pages'+mno+'/'+page,
			success:function(data){
				callback(data);
			}
		})
	} // getList end


	function remove(mno,callback,error){
		
		a.jax({
			url: '/replies/'+mno,
			type:'delete',
			contentType:'application/json',
			data:JSON.stringify({
				nickname:nickname
			}),
			success:function(result){
				if(callback){
				callback(result);					
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(xhr.responseText);
				}
			}
			
		})
	}// remove end
	
	function update(reply,callback,error){
		
		a.jax({
			url: '/replies/'+reply.mrno,
			type: 'put',
			contentType: 'application/json',
			
			data: JSON.stringify(reply),
			success: function(data){
				if(callback){
					callback(data);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(xhr.responseText);
				}
			}
		})
	} //update end
	
		
	return{
		add: add,
		getList: getList,
		remove: remove,
		update: update
	};
	
})();