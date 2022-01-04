<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>웹소켓 채팅</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<script>
	<audio id='audio_play' src='/*알림음 */'></audio>
	function play() { 
	    var audio = document.getElementById('audio_play'); 
	    if (audio.paused) { 
	        audio.play(); 
	    }else{ 
	        audio.pause(); 
	        audio.currentTime = 0 
	    } 
	} 
	</script>
	</head>
	<body>
	    <!-- 채팅 아이콘 -->
	    <div class="chatIcon font_jua">
	        <img src="resources/images/ccoli.png" class="iconImg">
	    </div>
	    
	    <!-- 채팅 창 -->
	    <div class="chatContainer display-none">
	        <div class="chatTop">
	            <div class="floatLeft" id="loginOn">
	                <img class="profile_img" id="setPic"><!-- src 사진 경로 동적 생성 -->
	            </div>
	            <div class="name_container font_noto" id="setName"><!-- 이름 동적 생성 --></div>
	            <div class="floatRight">
	                <img src="resources/img/chat-close.png" class="btnImg close">
	            </div>
	            <div class="floatRight">
	                <img src="resources/img/chat-minus.png" class="btnImg down">
	            </div>
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
	 
	    <!-- 채팅 리스트 -->
	    <div class="chatListContainer font_jua display-none">
	        <div class="chatTop">
	            <div style="padding: 10px; margin-left: 4px;">니즈톡 리스트</div>
	        </div>
	        <div class="chatList">
	            <!-- 동적 생성 -->
	        </div>
	    </div>
	    
	
	<script>
		$(document).ready(function() {
			webSocket.init({ url: '<c:url value="/chat" />' });			
		});
	</script>
	<script src='/resources/js/chat.js'></script>
</body>
</html>