window.onload = () => {
  let user = JSON.parse(localStorage.getItem("user"));

  let writer = document.getElementById("add-post-writer");

  if (localStorage.getItem("first") == null) getPosts();
  makePostsList(JSON.parse(localStorage.getItem("posts")));
  localStorage.setItem("first", 1);

  writer.value = JSON.parse(localStorage.getItem(1)).name;
};

// 게시글 정보 받아오기 (더미데이터)
const getPosts = () => {
  fetch("./assets/data/posts.json")
    .then((res) => res.json())
    .then((data) => localStorage.setItem("posts", JSON.stringify(data.posts)));
};

let postlist;

//
// 게시글 dom에 뿌리기
const makePostsList = (posts) => {
  postlist = posts;
  const postsElement = document.getElementById("posts");

  let postSum = "";
  posts.forEach((post) => {
    postSum += `
        <tr onclick="postDetail(${post.no})" data-bs-toggle="modal"
        data-bs-target="#post-detail-modal"
        id="btn-modal2">
            <td>${post.no}</td>
            <td>${post.title}</td>
            <td>${post.writer}</td>
            <td>${post.date}</td>
      </tr>`;
  });

  postsElement.innerHTML = postSum;
};

// 게시글 상세정보
const postDetail = (no) => {
  const detailNo = document.getElementById("detail-no");
  const detailTitle = document.getElementById("detail-title");
  const detailWriter = document.getElementById("detail-writer");
  const detailContent = document.getElementById("detail-content");
  const detailDate = document.getElementById("detail-date");

  detailNo.innerHTML = no;
  detailTitle.innerHTML = postlist[no].title;
  detailWriter.innerHTML = postlist[no].writer;
  detailDate.innerHTML = "작성일 : " + postlist[no].date;
  detailContent.innerHTML = postlist[no].content;
};

// 게시글 추가
const postAdd = () => {
  const closeBtn = document.getElementById("post-add-close-btn");
  let title = document.getElementById("add-post-title");
  let writer = document.getElementById("add-post-writer");
  let content = document.getElementById("add-post-content");
  const date = new Date();

  const origin = JSON.parse(localStorage.getItem("posts"));
  origin.push({
    no: origin.length,
    writer: writer.value,
    title: title.value,
    content: content.value,
    date: `${date.getFullYear()}/${date.getMonth()}/${date.getDay()}`,
  });

  localStorage.setItem("posts", JSON.stringify(origin));
  makePostsList(origin);
  closeBtn.click();
  title.value = "";
  content.value = "";
};

// 게시글 삭제
const postRemove = () => {
  const closeBtn = document.getElementById("post-detail-close-btn");
  const detailNo = document.getElementById("detail-no").innerHTML;
  const detailWriter = document.getElementById("detail-writer").innerHTML;
  const user = JSON.parse(sessionStorage.getItem("user"));

  if (detailWriter === user.name) {
    let pw = window.prompt("비밀번호를 입력해주세요.");

    if (user.password === pw) {
      const origin = JSON.parse(localStorage.getItem("posts"));
      let idx;
      for (let i = 0; i < origin.length; i++) {
        if (origin[i].no == detailNo) {
          idx = i;
        }
      }
      origin.splice(idx, 1);

      localStorage.setItem("posts", JSON.stringify(origin));
      makePostsList(origin);
      closeBtn.click();
    } else {
      alert("비밀번호가 틀렸습니다 !");
    }
  } else {
    alert("본인의 게시글만 삭제할 수 있습니다 !");
  }
};
