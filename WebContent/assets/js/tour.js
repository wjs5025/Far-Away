const parseXML = new DOMParser();

// 현재 선택된 지역 코드 (default 광주(5));
let selectedAreaCode = 0;
let selectedSigunguCode = 0;
let selectedTourType = 0;

// getRegionData() : 지역 정보 불러오기 (fetch)
const getRegionData = () => {
  apiName = "areaCode1?";
  const url = `${baseURL}${apiName}serviceKey=${serviceKey}&MobileOS=ETC&MobileApp=AppTest&numOfRows=20`;

  fetch(url)
    .then((res) => res.text())
    .then((data) => {
      const xmlDoc = parseXML.parseFromString(data, "text/xml");
      console.log(xmlDoc);
      makeRegionList(xmlDoc.querySelectorAll("item"));
    });
};

// makeRegionList() : 가져온 지역 정보 dom에 뿌리기
const makeRegionList = (regions) => {
  const searchArea = document.getElementById("search-area");

  regions.forEach((el) => {
    const option = document.createElement("option");
    option.innerHTML = el.querySelector("name").innerHTML;
    option.value = el.querySelector("code").innerHTML;
    searchArea.appendChild(option);
  });
};

// getSigunguData() : 시군구 정보 불러오기 (fetch)
const getSigunguData = () => {
  let areaCode = document.getElementById("search-area").value;

  apiName = "areaCode1?";
  const url = `${baseURL}${apiName}serviceKey=${serviceKey}&MobileOS=ETC&MobileApp=AppTest&numOfRows=100&_type=json&areaCode=${areaCode}`;

  fetch(url)
    .then((res) => res.json())
    .then((data) => {
      makeSigunguList(data);
    });
};

// makeSigunguList() : 가져온 지역 정보 dom에 뿌리기
const makeSigunguList = (sigungu) => {
  const searchArea = document.getElementById("search-sigunguCode");

  let sigunguSum = "";
  sigungu.response.body.items.item.forEach((el) => {
    sigunguSum += `<option value=${el.code}>${el.name}</option>`;
  });
  searchArea.innerHTML = sigunguSum;
};

// Search() :  검색하기
const Search = () => {
  apiName = "searchKeyword1";

  // dom values
  const areaCode = document.getElementById("search-area").value;
  const sigunguCode = document.getElementById("search-sigunguCode").value;
  const contentTypeId = document.getElementById("search-content-id").value;

  // contentTypeId에 따라 다른 api호출
  // 12 관광지  14 문화시설  15 축제공연행사  25 여행코스   28 레포츠   32숙박  38쇼핑  39 음식점
  apiName = "areaBasedList1";
  const url = `${baseURL}${apiName}?serviceKey=${serviceKey}&MobileOS=ETC&MobileApp=AppTest&${
    areaCode == 0 ? "" : "areaCode=" + areaCode
  }&_type=json&numOfRows=10&${
    contentTypeId == 0 ? "" : "contentTypeId=" + contentTypeId
  }&arrange=O&sigunguCode=${sigunguCode}`;
  console.log(url);

  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
      makeTripList(data);
    });
};

let positions = [];
/* makeTripList() : 여행정보 목록 보여주기*/
const makeTripList = (data) => {
  let table = document.getElementById("trip-list");
  let elementSum = "";
  let dataArr = data.response.body.items.item;
  let defaultSrc = "";

  elementSum += `<thead>
  <tr>
    <th class="text-center">대표이미지</th>
    <th class="text-center">관광지명</th>
    <th class="text-center">주소</th>
  </tr>
</thead>`;
  if (dataArr === undefined) {
    elementSum += `
        <tr>
          <td>검색결과가 없습니다.</td>
        </tr>
    `;
  } else {
    elementSum += "<tbody>";
    dataArr.forEach((el) => {
      elementSum += `
        <tr  onclick="moveCenter(${el.mapy}, ${el.mapx});">
          <td class="text-center"><img src="${
            el.firstimage ? el.firstimage : defaultSrc
          }" width='100px'/></td>
          <td class="text-center">${el.title}</td>
          <td class="text-center">${el.addr1}</td>
        </tr>
    `;
      let markerInfo = {
        title: el.title,
        latlng: new kakao.maps.LatLng(el.mapy, el.mapx),
        contenttypeid: el.contenttypeid,
      };
      positions.push(markerInfo);
    });
    elementSum += "</tbody>";
  }

  table.innerHTML = elementSum;
  displayMarker();
};
