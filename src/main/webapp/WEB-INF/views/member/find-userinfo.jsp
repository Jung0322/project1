<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/member.css" />s

<!-- validate cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

<sec:authorize access="isAuthenticated()">
	<!-- 로그인된 상태 -->
	<c:redirect url="/product/Secindex" />
	<!-- 메인페이지로 이동 -->
</sec:authorize>

<!-- Contact Section -->

<section id="contact">
	<div class="container">
		<div class="row">

			<div class="col-md-offset-1 col-md-10 col-sm-12">
				<div class="section-title">
					<h3>아이디, 비밀번호 찾기</h3>
				</div>

				<div class="login-form">
					<div class="find-userinfo">
						<p>아이디 찾기</p>
						<button type="button" class="modify-btn" data-oper="find-userid">선택</button>
					
						<div id="div-find-userid" style="position: relative; display: none;">
							<form action="" method="post" id="findUseridForm">
								<label for="email">이메일</label>
								<input type="text" name="email" id="email-userid" class="form-control" placeholder="이메일" />
								
								<label for="phone">휴대전화</label>
								<input type="text" name="phone" id="phone-userid" class="form-control phone" placeholder="전화번호 입력" maxlength="13"/>
								<button type="button" class="sendPhoneCerti" id="sendPhoneCertiUserid" >인증번호 발송</button>
								<input type="text" name="checkPhone" id="checkPhoneUserid" class="form-control phone" placeholder="인증번호 입력" disabled="disabled"/>
								<button type="button" class="checkPhoneCerti" id="checkPhoneCertiUserid">인증 확인</button>
								<small id="phone"></small>
								
								<input type="hidden" name="phoneDoubleChkUserid" id="phoneDoubleChkUserid" />
								
								<div class="div-chkMemberInfo" id="chkUserid">
									<button type="submit" class="chkMemberInfo" id="chkMemberInfoUserid">확인</button>
								</div>
							</form>
						</div>
						
						<div id="div-userInfo-userid" style="display: none;">
							<b>고객님의 정보와 일치하는 아이디입니다.</b>
							<p id="p-userid-info"></p>
							<a href="/member/signIn"><button type="button" class="chkMemberInfo">로그인 하기</button></a>
						</div>
					</div>
				</div>

				<div class="login-form">
					<div class="find-userinfo">
						<p>비밀번호 찾기</p>
						<button type="button" class="modify-btn" data-oper="find-pwd">선택</button>
						
						<div id="div-find-pwd" id="findForm_pwd" style="position: relative; display: none;">
							<form action="#" method="post" id="findForm_pwd">
								<label for="userid">아이디</label>
								<input type="text" name="userid" id="userid" class="form-control" placeholder="아이디" />
								
								<label for="email">이메일</label>
								<input type="text" name="email" id="email_pwd" class="form-control" placeholder="이메일" />
								
								<label for="phone">휴대전화</label>
								<input type="text" name="phone" id="phone_pwd" class="form-control phone" placeholder="휴대전화" maxlength="13" />
								<button type="button" class="sendPhoneCerti" id="sendPhoneCertiPwd" style="top: 197px;">인증번호 발송</button>
								<input type="text" name="checkPhone" id="checkPhonePwd" class="form-control phone" placeholder="인증번호 입력" disabled="disabled"/>
								<button type="button" class="checkPhoneCerti" id="checkPhoneCertiPwd" style="top: 242px;">인증 확인</button>
								<small id="phone"></small>
								
								<input type="hidden" name="phoneDoubleChkPwd" id="phoneDoubleChkPwd" />
								
								<div class="div-chkMemberInfo" id="chkPwd">
									<button type="submit" class="chkMemberInfo" id="chkMemberInfoPwd">확인</button>
								</div>
							</form>
						</div>
						
						<div id="div-errorMsg" style="display: none; margin-bottom: 10px;">
							<b></b>
						</div>
						
						<div id="div-userInfo-pwd" style="display: none; height: 128px;">
							<form action="/member/find-userinfo" method="post" id="replaceForm">
								<label for="new_password">새 비밀번호 설정</label>
								<input type="password" name="new_password" id="password" class="form-control" placeholder="새 비밀번호 설정"/>
								<small id="password"></small>
								
								<input type="password" name="password_check" id="password_check" class="form-control" placeholder="새 비밀번호 확인" />
								<small id="password_check"></small>
								<button type="submit" class="chkMemberInfo" id="replacePwd" style="width: 130px; bottom: 100px;" >비밀번호 재설정</button>
								
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
						</div>
						
					</div>
				</div>

			</div>

		</div>
	</div>
</section>

<script src="/resources/js/member/find-userinfo.js"></script>
<%@ include file="../includes/footer.jsp"%>