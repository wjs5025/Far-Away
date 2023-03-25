const setSeason = () => {
  const mainTitle = document.getElementById("main-title");

  let date = new Date();
  let month = date.getMonth() + 1;
  let season = "";

  if (month === 12 || month === 1 || month === 2) {
    season = "겨울";
  } else if (month === 3 || month === 4 || month === 5) {
    season = "봄";
  } else if (month === 6 || month === 7 || month === 8) {
    season = "여름";
  } else {
    season = "가을";
  }
  mainTitle.innerText = `이번 ${season}, 어디로 떠나실건가요?`;
};

// window onload 시
window.onload = () => {
  let pathname = location.pathname  ;

  switch (pathname) {
    case "/index.jsp" :
      setSeason();
      break;
    case "/Attraction/attraction_index.jsp":
      getRegionData();
      break;
    default:
      break;
  }
};