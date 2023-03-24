// 사용자 정보 배열
// 회원가입 시 아이디 검사하여 추가
// 로그인 시 확인

let btn = document.getElementById("register");
let member = "";

//  비밀번호 입력 확인
document.getElementById("memberPwCheck").addEventListener("blur", function () {
  let memberPw = document.getElementById("memberPw");
  let memberPwCheck = document.getElementById("memberPwCheck");
  let pwCheckmessage = document.getElementById("pwCheckmessage");
  if (memberPw.value === memberPwCheck.value) {
    pwCheckmessage.innerText = "비밀번호 일치";
    document.getElementById("register").removeAttribute("disabled");
  } else {
    pwCheckmessage.innerText = "비밀번호 불일치";
    document.getElementById("register").setAttribute("disabled", "disabled");
  }
});

// 회원 가입
document.getElementById("register").addEventListener("click", function () {
  // 아이디 존재 여부 확인 후 로컬 스토리지에 저장
  if (
    localStorage.getItem(document.getElementById("memberId").value) === null
  ) {
    let keyid = document.getElementById("memberId").value;
    if (document.getElementById("memberEmail").value <= 0) {
      alert("이메일을 입력하세요");
    } else {
      let member = {
        name: document.getElementById("memberName").value,
        id: document.getElementById("memberId").value,
        password: document.getElementById("memberPw").value,
        email: document.getElementById("memberEmail").value,
      };
      localStorage.setItem(keyid, JSON.stringify(member));
      document.getElementById("reset1").click();
      document.getElementById("close-register").click();
      alert("회원가입 완료");
    }
  } else {
    alert("해당 아이디가 이미 존재합니다.");
  }
});

// 로그인
const login = (sessionID, sessionPW) => {
  const user = JSON.parse(localStorage.getItem(sessionID));

  if (localStorage.getItem(document.getElementById("loginId").value) === null) {
    alert("아이디 또는 비밀번호가 틀렸습니다.");
  } else {
    let idcheck = document.getElementById("loginId").value;
    let pwcheck = document.getElementById("loginPw").value;
    let storedId = JSON.parse(localStorage.getItem(idcheck)).id;
    let storedPW = JSON.parse(localStorage.getItem(idcheck)).password;
    if (idcheck === storedId && pwcheck === storedPW) {
      member = idcheck;
      document.getElementById("account").innerText =
        JSON.parse(localStorage.getItem(idcheck)).name + "님";
      document.getElementById("reset2").click();
      document.getElementById("close-register2").click();
      document.getElementById("logout").setAttribute("style", "display:flex");
      document
        .getElementById("btn-modal3")
        .setAttribute("style", "display:flex");
      document
        .getElementById("btn-modal4")
        .setAttribute("style", "display:flex");
      document
        .getElementById("btn-modal1")
        .setAttribute("style", "display:none");
      document
        .getElementById("btn-modal2")
        .setAttribute("style", "display:none");
    }

    sessionStorage.setItem("user", localStorage.getItem(member));
  }
};

document.getElementById("login").addEventListener("click", login);

// 회원 정보 조회
document.getElementById("btn-modal3").addEventListener("click", function () {
  let tmppw = prompt("비밀번호를 입력하세요!");
  let mem = JSON.parse(localStorage.getItem(member));
  if (tmppw === JSON.parse(localStorage.getItem(member)).password) {
    console.log("why?");
    document.getElementById("showName").value = mem.name;
    document.getElementById("showId").setAttribute("placeholder", mem.id);
    document.getElementById("showEmail").setAttribute("placeholder", mem.email);
  } else {
    alert("올바르지 않은 비밀번호 입니다.");
  }
});

// 회원 정보 삭제 및 수정
document.getElementById("btn-modal4").addEventListener("click", function () {
  let tmppw = prompt("비밀번호를 입력하세요!");
  let mem = JSON.parse(localStorage.getItem(member));
  if (tmppw === JSON.parse(localStorage.getItem(member)).password) {
    document.getElementById("nowName").setAttribute("placeholder", mem.name);
    document.getElementById("nowId").setAttribute("placeholder", mem.id);
    document.getElementById("nowEmail").setAttribute("placeholder", mem.email);
    // 수정
    document.getElementById("change").addEventListener("click", function () {
      let willchange = JSON.parse(localStorage.getItem(member));
      if (document.getElementById("nowName").value !== null) {
        console.log(willchange.name);
        console.log(document.getElementById("nowName").value);
        let member = {
          name: document.getElementById("nowName").value,
          id: willchange.id,
          password: willchange.password,
          email: willchange.email,
        };
        localStorage.setItem(willchange.id, JSON.stringify(member));
        document.getElementById("reset3").click();
        document.getElementById("close-register4").click();
      }
      if (document.getElementById("nowEmail").value !== null) {
        let member = {
          name: willchange.name,
          id: willchange.id,
          password: willchange.password,
          email: document.getElementById("nowEmail").value,
        };
        localStorage.setItem(willchange.id, JSON.stringify(member));
        document.getElementById("reset3").click();
        document.getElementById("close-register4").click();
      }
      document.getElementById("close-register4").click();
      alert("회원 정보가 변경 되었습니다.");
    });
    // 삭제
    document.getElementById("delete").addEventListener("click", function () {
      console.log("will delete");
      if (confirm("정말 탈퇴하시겠습니까?")) {
        localStorage.removeItem(member);
        document.getElementById("close-register4").click();
        alert("탈퇴되었습니다.");
      }
    });
  } else {
    alert("올바르지 않은 비밀번호 입니다.");
  }
});

// 로그아웃
document.getElementById("logout").addEventListener("click", function () {
  document.getElementById("logout").setAttribute("style", "display:none");
  document.getElementById("btn-modal3").setAttribute("style", "display:none");
  document.getElementById("btn-modal4").setAttribute("style", "display:none");
  document.getElementById("btn-modal1").setAttribute("style", "display:flex");
  document.getElementById("btn-modal2").setAttribute("style", "display:flex");
});
