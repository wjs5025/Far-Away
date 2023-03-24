<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 회원 정보 조회 -->
	<div class="modal" id="Modal3" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원 정보 조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="close-register3"></button>
				</div>
				<div class="modal-body">
					<form action="" id="register-form3" method="get">
						<div class="mb-3">
							<label for="name" class="form-label">이름</label> <input
								type="text" class="form-control" id="showName" placeholder="이름"
								readonly />
						</div>
						<div class="mb-3">
							<label for="id" class="form-label">아이디</label> <input type="text"
								class="form-control" id="showId" placeholder="아이디" readonly />
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label> <input
								type="email" class="form-control" id="showEmail"
								placeholder="이메일" readonly />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원정보 수정 및 삭제 -->
	<div class="modal" id="Modal4" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원 정보 수정 및 삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="close-register4"></button>
				</div>
				<div class="modal-body">
					<form action="" id="register-form4" method="get">
						<div class="mb-3">
							<label for="name" class="form-label">이름</label> <input
								type="text" class="form-control" id="nowName" placeholder="이름" />
						</div>
						<div class="mb-3">
							<label for="id" class="form-label">아이디</label> <span>(변경
								불가)</span> <input type="text" class="form-control" id="nowId"
								placeholder="아이디" readonly />
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label> <input
								type="email" class="form-control" id="nowEmail"
								placeholder="이메일" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="change">
								변경</button>
							<button type="button" class="btn btn-primary" id="delete">
								삭제</button>
							<button type="reset" class="btn btn-primary" id="reset3">
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