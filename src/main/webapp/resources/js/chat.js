/**
 * 
 */
$(function() {
	//채팅 리스트 / 채팅 방 OPEN / CLOSE 
	         $(document).on("click", ".chatIcon", function(){                // 채팅 Icon 클릭 시,
	            if($('.chatContainer').hasClass("display-none")){           // if ) 채팅방이 열려있지 않을 때,
	                $('.chatListContainer').toggleClass('display-none');    // 리스트를 연다. toggleClass() 선택한 요소에 클래스(Class) 값을 넣었다 뺐다 할 수 있습니다.
	            }else{                                                      // else ) 채팅방이 열려있다면,
	                $('.chatContainer').toggleClass('display-none');        // 채팅방을 닫는다.
	                websocket.close();
	            }
	             
	             if(!$('.chatListContainer').hasClass('display-none')){         // 채팅 리스트가 닫혀 있을 때
	                getRoomList();                                            // 채팅 방 목록을 불러온다.
	             }
	         });
	         
	         $(document).on("click", "img.close", function(){                // X 버튼 클릭 시,
	             $('.chatContainer').toggleClass('display-none');           // 채팅방을 닫는다.
	             websocket.close();                                            // socket 연결 종료
	         });
	         
	         $(document).on("click", "img.down", function(){                 // - 버튼 클릭 시,
	             $('.chatContainer').toggleClass('display-none');           // 채팅방을 닫고,
	             $('.chatListContainer').toggleClass('display-none');       // 리스트를 연다.
	             websocket.close();                                            // socket 연결 종료
	         });
	
	//채팅 목록 관련						
	// 총 읽지 않은 갯수
	let countAll = 0;

	function getRoomList() {
		// 채팅 방 목록 가져오기
		$.ajax({
			url: "chatRoomList.do",
			data: {
				userId: "${loginMember.userid}"
			},
			dataType: "json",
			async: false, // async : false를 줌으로써 비동기를 동기로 처리 할 수 있다.
			success: function(data) {

				// 현재 로그인 된 User들
				let loginList = "";

				// 로그인 된 User들을 가져온다.
				/*$.ajax({
					url: "chatSession.do",
					data: {
					},
					async: false,
					dataType: "json",
					success: function(data) {
						for (var i = 0; i < data.length; i++) {
							loginList += data[i];
						}
					}
				});
*/
				$chatWrap = $(".chatList");
				$chatWrap.html("");

				var $div;     // 1단계
				var $img;     // 2단계
				var $divs;     // 2단계
				var $span;    // 2단계

				if (data.length > 0) {
					// 읽지 않은 메세지 초기화
					countAll = 0;

					// 태그 동적 추가
					for (var i in data) {

						// 자신이 구매자 입장일 때
						if (data[i].userId == "${loginMember.userId}") {
							// 현재 판매자가 로그인 상태 일 때
						
								$div = $("<div class='chatList_box2 enterRoomList' onclick='enterRoom(this);'>").attr("id", data[i].roomId).attr("masterId", data[i].masterId);
							$img = $("<img class='profile_img'>").attr("src", "resources/masterImg/" + data[i].masterPic);
							$divs = $("<div class='userNameId'>").text(data[i].masterId);
						}
						// 자신이 판매자 입장일 때
						else {
								$div = $("<div class='chatList_box enterRoomList' onclick='enterRoom(this);'>").attr("id", data[i].roomId).attr("userId", data[i].userId);
								$div = $("<div class='chatList_box2 enterRoomList' onclick='enterRoom(this);'>").attr("id", data[i].roomId).attr("userId", data[i].userId);
							$img = $("<img class='profile_img'>").attr('src', 'resources/img/' + data[i].userPic);
							$divs = $("<div class='userNameId'>").text(data[i].userId);
						} // else End

						// 읽지 않은 메세지가 0이 아닐 때
						if (data[i].unReadCount != 0) {
							$span = $("<span class='notRead'>").text(data[i].unReadCount);
						} else {
							$span = $("<span>");
						}

						$div.append($img);
						$div.append($divs);
						$div.append($span);

						$chatWrap.append($div);

						// String을 int로 바꿔주고 더해준다.
						countAll += parseInt(data[i].unReadCount);
					}// 태그 동적 추가 END
				} // IF 절 END
			} // success(data) 구문 END 
		});
	}

	// 화면 로딩 된 후
	$(window).on('load', function() {

		// 2초에 한번씩 채팅 목록 불러오기(실시간 알림 전용)
		setInterval(function() {
			// 방 목록 불러오기
			getRoomList();

			// 읽지 않은 메세지 총 갯수가 0개가 아니면
			if (countAll != 0) {
				// 채팅 icon 깜빡거리기
				$('.chatIcon').addClass('iconBlink');
				play();
			} else {
				// 깜빡거림 없애기
				$('.chatIcon').removeClass('iconBlink');
			}
		}, 2000);
	});

	// 채팅방 관련
	 let roomId;
	        // enter 키 이벤트
	        $(document).on('keydown', 'div.chatBottom textarea', function(e){
	             if(e.keyCode == 13 && !e.shiftKey) {
	                 e.preventDefault(); // 엔터키가 입력되는 것을 막아준다.
	                 const message = $(this).val();  // 현재 입력된 메세지를 담는다.
	                   
	                 let search3 = $('div.chatBottom textarea').val();
	                  
	                 if(search3.replace(/\s|  /gi, "").length == 0){
	                       return false;
	                       $('div.chatBottom textarea').focus();
	                    }
	                 
	                 sendMessage(message);
	                 // textarea 비우기
	                 clearTextarea();
	             }
	        });
	 
	        // 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
	        function enterRoom(obj){
	            // 현재 html에 추가되었던 동적 태그 전부 지우기
	            $('div.chatMiddle:not(.format) ul').html("");
	            // obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
	            roomId = obj.getAttribute("id");
	             // 해당 채팅 방의 메세지 목록 불러오기
	              $.ajax({
	                url:roomId + ".do",
	                data:{
	                    userId:"${loginMember.userid}"
	                },
	                async:false,
	                dataType:"json",
	                success:function(data){
	                    for(var i = 0; i < data.length; i++){
	                        // 채팅 목록 동적 추가
	                        CheckLR(data[i]);
	                    }
	                }
	            });
	             // 웹소켓 연결
	             connect();
	             console.log("enterRoom");
	        }
	        
	        // 채팅 방 열어주기
	        $(document).on("click", ".enterRoomList",function(){
	             $(".chatContainer").toggleClass("display-none");
	             $(this).parent().parent().toggleClass("display-none");
	             // 이름 추가
	             $("#setName").html($(this).children('div').html());
	             // 사진 추가
	             $("#setPic").attr("src",$(this).children('img').attr('src'));
	             // 스크롤바 아래 고정
	            $('div.chatMiddle').scrollTop($('div.chatMiddle').prop('scrollHeight'));
	             // 로그인 상태 일 때 
	             if($(this).hasClass('chatList_box')){
	                 // 점 표시
	                $('#loginOn').addClass('profile_img_Container');
	             }
	             // 로그아웃 상태 일 때
	             else{
	                 // 점 빼기
	                 $('#loginOn').removeClass('profile_img_Container');
	             }
	        });
	        
	        // 웹소켓
	         let websocket;
	     
	         //입장 버튼을 눌렀을 때 호출되는 함수
	         function connect() {
	             // 웹소켓 주소
	             var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/echo.do";
	             // 소켓 객체 생성
	             websocket = new WebSocket(wsUri);
	             //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
	             websocket.onopen = onOpen;
	             websocket.onmessage = onMessage;
	             console.log(websocket.send);
	         }
	         
	         //웹 소켓에 연결되었을 때 호출될 함수
	         function onOpen() {
	             // ENTER-CHAT 이라는 메세지를 보내어, Java Map에 session 추가
	             const data = {
	                    "roomId" : roomId,
	                    "userid" : "${ loginMember.userid }",
	                    "nickname" : "${ loginMember.nickname }",
	                 "message" : "ENTER-CHAT"
	            };
	            let jsonData = JSON.stringify(data);
	             websocket.send(jsonData);
	             console.log(websocket);
	         }
	         
	        // * 1 메시지 전송
	        function sendMessage(message){
	            
	            const data = {
	                "roomId" : roomId,
	                "userid" : "${ loginMember.userid }",
	                "nickname" : "${ loginMember.nickname }",
	                "message"   : message 
	            };
	              
	            CheckLR(data);
	             
	            let jsonData = JSON.stringify(data);
	             
	             websocket.send(jsonData);
	         }
	        
	         // * 2 메세지 수신
	         function onMessage(evt) {
	             
	            let receive = evt.data.split(",");
	             
	            const data = {
	                    "userid" : receive[0],
	                    "nickname" : receive[1],
	                 "message" : receive[2]
	            };
	             
	             if(data.nickname != "${ loginMember.nickname }"){
	                CheckLR(data);
	             }
	        }
	         
	        // * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
	        function CheckLR(data) {
	            // email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
	            const LR = (data.nickname != "${ loginMember.nickname }") ? "left" : "right";
	             // 메세지 추가
	            appendMessageTag(LR, data.userid, data.message, data.nickname);
	        }
	         
	        // * 3 메세지 태그 append
	        function appendMessageTag(LR_className, userid, message, nickname) {
	             
	            const chatLi = createMessageTag(LR_className, userid, message, nickname);
	         
	            $('div.chatMiddle:not(.format) ul').append(chatLi);
	         
	            // 스크롤바 아래 고정
	            $('div.chatMiddle').scrollTop($('div.chatMiddle').prop('scrollHeight'));
	        }
	         
	        // * 4 메세지 태그 생성
	        function createMessageTag(LR_className, nickname, message, userid) {
	         
	             // 형식 가져오기
	             let chatLi = $('div.chatMiddle.format ul li').clone();
	         
	             chatLi.addClass(LR_className);              // left : right 클래스 추가
	             // find() : chatLi의 하위 요소 찾기
	             chatLi.find('.sender span').text(nickname);      // 이름 추가
	             chatLi.find('.message span').text(message); // 메세지 추가
	         
	             return chatLi;
	        };
	         
	        // * 5 - 채팅창 비우기
	        function clearTextarea() {
	             $('div.chatBottom textarea').val('');
	             return false;
	        };

})