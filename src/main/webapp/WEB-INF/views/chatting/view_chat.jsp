<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<style>

.font_jua img, .floatRight img { display: inline-block; width: 32px; margin-right: 4px; }
.left1 {width: 30%;	height:100%; float: left; border-radius: 1px; }
.right1 { width: 70%; float: right; border-radius: 1px; }
.profile_img{ display: inline-block; width: 32px; margin-right: 4px; }
.chat_wrap .chatMiddle { padding-bottom: 80px; overflow: scroll; }
.chat_wrap .chatMiddle ul { width: 100%; list-style: none; }
.chatMiddle .format { display:none; } 
.format  ul li { list-style: none; }
.chat_wrap .header { font-size: 14px; padding: 15px 0; background: #9BB460; color: white; text-align: center; }
.chat_wrap .chatMiddle {height: 500px; }
.chat_wrap .chatMiddle ul li { width: 100%; }
.chat_wrap .chatMiddle ul li.left { text-align: left; }
.chat_wrap .chatMiddle ul li.right { text-align: right; }
 
.chat_wrap .chatMiddle ul li > div { font-size: 13px;  }
.chat_wrap .chatMiddle ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.chat_wrap .chatMiddle ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
.chatList_box, .chatList_box2 { margin : 2px; border : 2px solid silver;  }
.chatBottom {  bottom: 0; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
.chatBottom > textarea { width: 100%; height: 80px; border: none; padding: 10px; }

</style>
<body>

	<div class="channer" style="border-radius: 2px">
		<div class="channer left1">
	
			<!-- 채팅 리스트 -->
			<div class="chatListContainer font_jua display-none">
				 <div class="chatTop">
					<div style="font-size: 14px; padding: 15px 0; margin-left: 4px; background-color : #9BB460; color: white; text-align: center; ">콜리톡 리스트</div>
				</div> 
				<div class="chatList"></div>
			</div>
		</div>
		
		<div class="channer right1">
			<!-- 채팅 창 -->
			<div class="chat_wrap">
			<div class="header">CHAT <button type="button" id="chatout" style="color:red; float:right; display:none;">채팅나가기</button></div>
				<!-- 	<div class="floatLeft" id="loginOn">
						<img class="profile_img" id="setPic">
						src 사진 경로 동적 생성
					</div> --> 
					<div class="name_container font_noto" id="setName">
						<!-- 이름 동적 생성 -->
					</div>
					

					<div class="chatMiddle">
						<ul>
							<!-- 동적 생성 -->
						</ul>
					</div>
				<div class="chatBottom">
					<textarea placeholder="메세지를 입력해 주세요."></textarea>
				</div>
			</div>

		</div>
	</div>
			<!-- format -->
			<div class="chatMiddle format">
				<ul>
					<li>
						<div class="sender">
							<span></span>
						</div>
						<div class="message">
							<span></span>
						</div>
					</li>
				</ul>
			</div>
	<script>
	
	
	// 웹소켓
	let websocket;
	
	// 총 읽지 않은 갯수
	let countAll = 0;

	getRoomList(); // 채팅 방 목록을 불러온다.
	function getRoomList() {
		// 채팅 방 목록 가져오기
	// console.log("현재 로그인한 유저아이디 ::: "+userid);
		
		$.ajax({
					url : "chatRoomList.do",
					data : {
						userid : "${loginMember.userid}"
					},
					dataType : "json",
					async : false, // async : false를 줌으로써 비동기를 동기로 처리 할 수 있다.
					success : function(data) {

						// 현재 로그인 된 User들
						let loginList = "";

						// 로그인 된 User들을 가져온다.
						$.ajax({
							url : "chatSession.do",
							data : {},
							async : false,
							dataType : "json",
							success : function(data) {
								for (var i = 0; i < data.length; i++) {
									loginList += data[i];
									console.log(data[i]);
								}
							}
						});

						$chatWrap = $(".chatList");
						$chatWrap.html("");

						var $div; // 1단계
						var $img;
						var divs;
						
						if (data.length > 0) {
							// 읽지 않은 메세지 초기화
							countAll = 0;
						
							// 태그 동적 추가
							for ( var i in data) {
								var $span; // 2단계
								// 자신이 구매자 입장일 때
								if (data[i].userid == "${loginMember.userid}") {
									console.log("구매자 아이디 :::"+data[i].userid+"판매자 아이디 :::"+data[i].masterid);
										$div = $(
												"<div class='chatList_box enterRoomList' onclick='enterRoom(this);'>")
												.attr("id", data[i].roomid)
												.attr("userId",
														data[i].userid);
										$img = $("<img class='profile_img' src='/resources/images/temp-profile.png'>");
										$divs = $("<div class='userNameId'>");
										// 프로필 가져오기
										$.ajax({
											url: "/member/chatgetProfileImg",
											type:"get",
											data: {
												userid: data[i].masterid
											},
											success: function(result){
												console.log("결과:::::"+result);
												if(result != null) {
													$(result).each(function(idx, obj) {
														var fileCallPath = encodeURIComponent(obj.profileUploadPath+"\\"+obj.pfuuid+"_"+obj.profileImgName);
														var str = "/member/profileDisplay?fileName="+fileCallPath;
														$img = $img.attr("src", str);
														$div.append($img);
													})
												}
											}
											
										}) 
								} //자신이 구매자일떄 end
								// 자신이 판매자 입장일 때
								else {
									// 현재 구매자가 로그인 상태 일 때
										$div = $(
												"<div class='chatList_box enterRoomList' onclick='enterRoom(this);'>")
												.attr("id", data[i].roomid)
												.attr("masterId",
														data[i].masterid);
										$img = $("<img class='profile_img'>").attr("src", "/resources/images/temp-profile.png");
										
										$.ajax({
												url: "/member/chatgetProfileImg",
												type:"get",
												data: {
													userid: data[i].userid
												},
												success: function(result){
													console.log(result);
													if(result != null) {
														$(result).each(function(idx, obj) {
															var fileCallPath = encodeURIComponent(obj.profileUploadPath+"\\"+obj.pfuuid+"_"+obj.profileImgName);
															var str = "/member/profileDisplay?fileName="+fileCallPath;
															console.log("경로 !!:::"+str);
															
					                                        $img = $img.attr("src", str);
															$div.append($img);
														})
													}
												}
												
											})
									/* $img = $("<img class='profile_img'>")
											.attr('src',
													'/resources/images/default.png' + data[i].userpic); */
								} // 구매자가 아닌 판매자일떄  else End

								// 읽지 않은 메세지가 0이 아닐 때
								if (data[i].unReadCount != 0) {
									$span = $("<span class='notRead'style='float:right'>").text(data[i].unReadCount);
								} else {
									$span = $("<span style='float:right'>");
								}
								if (data[i].userid == "${loginMember.userid}"){
									$divs = $("<span class='userNameId'>").text(data[i].masterid);
								}else{
									$divs = $("<span class='userNameId'>").text(data[i].userid);
								}
								$div.append($img);
								$div.append($divs);
								$div.append($span);
								
								$chatWrap.append($div);

								// String을 int로 바꿔주고 더해준다.
								countAll += parseInt(data[i].unReadCount);
								console.log("메세지 안 읽은 숫자  ::"+countAll);
							}// for 태그 동적 추가 END
						} // IF 절 END
					} // success(data) 구문 END 
				});
	}// getroomlist END
	
	// 채팅방 관련
	let roomid;
	// 메세지 입력 시 
	// enter 키 이벤트
	$(document).on('keydown', 'div.chatBottom textarea', function(e) {
		if (e.keyCode == 13 && !e.shiftKey) {
			e.preventDefault(); // 엔터키가 입력되는 것을 막아준다.
			const message = $(this).val(); // 현재 입력된 메세지를 담는다.
			let search3 = $('div.chatBottom textarea').val();
			if (search3.replace(/\s|  /gi, "").length == 0) {
				return false;
				$('div.chatBottom textarea').focus();
			}

			sendMessage(message); // 메세지 보내는 곳 
			// textarea 비우기
			clearTextarea();
		}
	}); // 메세지 입력후 enter  END

	// 상품 판매에서 상대방과 채팅하기 위해 넘어 왔을 때 자동 채팅창 열기 
	/* if(masterid !== null){
		let obj = $(document).getElementById('${masterDto.userid}');
		enterRoom(obj);
	} */
	
	// 소켓 닫기
	$("#chatout").click(function(){
		$("#chatout").toggle();
		websocket.close();
	})
	// 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
	function enterRoom(obj) {
		// 채팅방 나가기 클릭버튼 display:none 해제 
		$("#chatout").toggle();
		// 현재 html에 추가되었던 동적 태그 전부 지우기
		$('div.chatMiddle:not(.format) ul').html("");
		// obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
		roomid = obj.getAttribute("id");
		console.log("채팅 방 아이디 ::::"+roomid);
		// 해당 채팅 방의 메세지 목록 불러오기
		$.ajax({
			url : roomid + ".do",
			data : {
				userid : "${loginMember.userid}"
			},
			async : false,
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					// 채팅 목록 동적 추가
					CheckLR(data[i]);
				}
			}
		});
		// 웹소켓 연결
		connect();
		console.log("enterRoom");
	}// 채팅방 클릭 시 방번호 배정후 웹소켓 연결
	// 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
	// 채팅하기로 넘어왔을 시 작동 

	let room_id = <%= request.getParameter("room_id")%>;
	console.log("룸아이디 가져오기 :::"+room_id);
	if(room_id!=null){
		chattingRoom(room_id);
	}
	
	function chattingRoom(obj) {
		// 채팅방 나가기 클릭버튼 display:none 해제 
		$("#chatout").toggle();
		// 현재 html에 추가되었던 동적 태그 전부 지우기
		$('div.chatMiddle:not(.format) ul').html("");
		// obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
		roomid = obj;
		// 해당 채팅 방의 메세지 목록 불러오기
		$.ajax({
			url : roomid + ".do",
			data : {
				userid : "${loginMember.userid}"
			},
			async : false,
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					// 채팅 목록 동적 추가
					CheckLR(data[i]);
				}
			}
		});
		// 웹소켓 연결
		connect();
		console.log("enterRoom");
	}// 채팅방 클릭 시 방번호 배정후 웹소켓 연결

	// 채팅 방 열어주기
/* 	$(".enterRoomList").click(function(){
		// 이름 추가
		 $("#setName").html($(this).children('div').html()); 
		// 사진 추가
		 $("#setPic").attr("src",
				$(this).children('img').attr('src')); 
		// 스크롤바 아래 고정
		$('div.chatMiddle').scrollTop(    											// 스크롤 고정 css 건들기 
				$('div.chatMiddle').prop('scrollHeight'));
	
		});
	 */
	
	
	//입장 버튼을 눌렀을 때 호출되는 함수
	function connect() {
		// 웹소켓 주소
		var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/echo.do";
		console.log("커넥트 웹소켓 주소 ::"+wsUri);
		// 소켓 객체 생성
		websocket = new WebSocket(wsUri);
		//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
	}

	//웹 소켓에 연결되었을 때 호출될 함수
	function onOpen() {
		console.log("onOpen 실행 :::"+roomid);
		// ENTER-CHAT 이라는 메세지를 보내어, Java Map에 session 추가
		const data = {
			"roomid" : roomid,
			"messageid" : "",
			"sentid" : "${ loginMember.userid }",
			"nickname" : "${ loginMember.nickname }",
			"message" : "ENTER-CHAT",
			/*"unReadCount" : 0*/
		};
		let jsonData = JSON.stringify(data);
		websocket.send(jsonData);
		console.log(websocket);
	} 

	// * 1 메시지 전송
	function sendMessage(message) {
		console.log("SendMessage 메세지 전송 !!::: "+message);
		const data = {
			"roomid" : roomid,
			"messageid" : "",
			"sentid" : "${ loginMember.userid }",
			"nickname" : "${ loginMember.nickname }",
			"message" : message,
			"lr" : "left"
		};
		CheckLR(data);

		let jsonData = JSON.stringify(data);
		websocket.send(jsonData); // 메세지 보내는 곳 
	}
	
	// * 2 메세지 수신
	function onMessage(evt) {
		console.log("onMessage :::: ");
		let receive = evt.data.split(",");
		console.log("recieve :::: "+receive);

		const data = {
			"sentid" : receive[0],
			"nickname" : receive[1],
			"message" : receive[2],
			"lr" : "left"
		};
		console.log("수신자 :::"+data.sentid);
		if (data.sentid != "${ loginMember.userid }") {
			CheckLR(data);
		}
	}

	// * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
	function CheckLR(data) {
		// userid이 loginSession의 userid과 다르면 왼쪽, 같으면 오른쪽
		const LR = (data.sentid != "${ loginMember.userid }") ? "left": "right";
		// 메세지 추가
		appendMessageTag(LR, data.sentid, data.nickname, data.message);
	}

	// * 3 메세지 태그 append
	function appendMessageTag(LR_className, sentid, nickname, message) {

		const chatLi = createMessageTag(LR_className, sentid, nickname, message);

		$('div.chatMiddle:not(.format) ul').append(chatLi);

		// 스크롤바 아래 고정
		$('div.chatMiddle').scrollTop($('div.chatMiddle').prop('scrollHeight'));
	}

	
	// * 4 메세지 태그 생성
	function createMessageTag(LR_className, sentid, nickname, message) {

		// 형식 가져오기
		let chatLi = $('div.chatMiddle.format ul li').clone(); // $('div.chatMiddle.format ul li').clone();

		chatLi.addClass(LR_className); // left : right 클래스 추가
		// find() : chatLi의 하위 요소 찾기
		chatLi.find('.sender span').text(sentid); // 이름 추가
		chatLi.find('.message span').text(message); // 메세지 추가

		return chatLi;
	};

	// * 5 - 채팅창 비우기
	function clearTextarea() {
		$('div.chatBottom textarea').val('');
		return false;
	};

	</script>
</body>
	
<!-- <script src='/resources/js/chatting/chat.js'></script> -->
</html>