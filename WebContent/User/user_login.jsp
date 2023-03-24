<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인 모달 -->
	<div class="modal" id="Modal2" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">로그인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="close-register2"></button>
				</div>
				<div class="modal-body">
					<form action="" id="login-form">
						<div class="mb-3">
							<label for="login" class="form-label">아이디</label> <input
								type="text" class="form-control" id="loginId" placeholder="아이디" />
						</div>
						<div class="mb-3">
							<label for="login" class="form-label">비밀번호</label> <input
								type="password" class="form-control" id="loginPw"
								placeholder="비밀번호" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="login">
								로그인</button>
							<button type="reset" class="btn btn-primary" id="reset2">
								초기화</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>