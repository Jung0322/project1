/**
 * 
 */
let goodService = (function(){
	
	 function add(reply,callback){
      console.log("add method 실행");
      
      $.ajax({
         url:'/replies/new',
         type:'post',
         contentType:'application/json',
         data:JSON.stringify(reply),
         success:function(result){
            if(callback){
               callback(result);
            }
         },
         error:function(xhr,status,err){
            error(err);
         }
         
      })
      
   }//add end
	
	
	})();