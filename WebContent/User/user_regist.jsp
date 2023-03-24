<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 회원가입 -->
	<div class="modal" id="Modal1" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원 가입</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="close-register"></button>
				</div>
				<div class="modal-body">
					<form action="" id="register-form1" method="get">
						<div class="mb-3">
							<label for="name" class="form-label">이름</label> <input
								type="text" class="form-control" id="memberName"
								placeholder="이름" />
						</div>
						<div class="mb-3">
							<label for="id" class="form-label">아이디</label> <input type="text"
								class="form-control" id="memberId" placeholder="아이디" />
						</div>
						<div class="mb-3">
							<label for="pw" class="form-label">비밀번호</label> <input
								type="password" class="form-control" id="memberPw"
								placeholder="비밀번호" />
						</div>
						<div class="mb-3">
							<label for="pwcheck" class="form-label">비밀번호 확인</label> <span
								id="pwCheckmessage">비밀번호 불일치</span> <input type="password"
								class="form-control" id="memberPwCheck" placeholder="비밀번호 확인" />
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label> <input
								type="email" class="form-control" id="memberEmail"
								placeholder="이메일" required />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="register">
								회원가입</button>
							<button type="reset" class="btn btn-primary" id="reset1">
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