const positions = [];

// getRegionData() : 지역 정보 불러오기 (fetch)
const getRegionData = () => {
    const url = `/region`;

    fetch(url)
        .then((res) => res.json())
        .then((data) => {
            makeRegionList(data);
        });
};

// makeRegionList() : 가져온 지역 정보 dom에 뿌리기
const makeRegionList = (regions) => {
    const searchArea = document.getElementById("sidoCode");
    let sidoSum = "<option value='' selected>시/도</option>";
    regions.forEach((el) => {
        sidoSum += `<option value=${el.sidoCode}>${el.sidoName}</option>`;
    });
    searchArea.innerHTML = sidoSum;
};

// getGunguData() : 시군구 정보 불러오기 (fetch)
const getGunguData = () => {
    let sidoCode = document.getElementById("sidoCode").value;

    const url = `/region?sidoCode=${sidoCode}`;

    fetch(url)
        .then((res) => res.json())
        .then((data) => {
            makeGunguList(data);
        });
};

// makeSigunguList() : 가져온 지역 정보 dom에 뿌리기
const makeGunguList = (gungu) => {
    const searchArea = document.getElementById("gugunCode");

    let sigunguSum = "";
    gungu.forEach((el) => {
        sigunguSum += `<option value=${el.gugunCode}>${el.gugunName}</option>`;
    });
    searchArea.innerHTML = sigunguSum;
};
