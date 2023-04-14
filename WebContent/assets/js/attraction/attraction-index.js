window.onload = () => {
    document.getElementById("btn-search").addEventListener("click", () => getAttractionData(1));
    getRegionData();
    getAttractionData(1);
}

// getAttractionData() : 서버로부터 현재 조건에 맞는 관광지 정보 불러오기
const getAttractionData = async (pageNo) => {
    let sidoCode = document.getElementById("sidoCode").value;
    let gugunCode = document.getElementById("gugunCode").value;
    let contentTypeId = document.getElementById("contentTypeId").value;

    // 관광지 데이터 받아오기
    const dataUrl = `/attraction?action=list&pageNo=${pageNo}&sidoCode=${sidoCode}&gugunCode=${gugunCode}&contentTypeId=${contentTypeId}`;

    await fetch(dataUrl)
        .then((res) => res.json())
        .then((data) => makeAttractionList(data));

    // 페이지 정보 불러오기
    const pageUrl = `/attraction?action=pageNavigation&pageNo=${pageNo}&sidoCode=${sidoCode}&gugunCode=${gugunCode}&contentTypeId=${contentTypeId}`;
    await fetch(pageUrl)
        .then((res) => res.json())
        .then((data) => makeNavigation(data));
}


// document에 받아온 정보 뿌리기
const makeAttractionList = (data) => {
    console.log(data)
    const attractionList = document.getElementById("attraction-list");
    positions.length = 0;

    let str = "";

    if (data.length === 0){
        str += ` <tr>
                    <td>검색 결과가 없습니다.</td>
                </tr>`
    } else {
        data.forEach(el => {
            saveMarkerInfo(el);
            const imgSrc = el.firstImage ? el.firstImage : "/assets/img/attraction/no-img.png";
            str += `<tr class="text-center" onclick="moveCenter(${el.latitude}, ${el.longitude})">
                        <td><img src="${imgSrc}" width="100px"/></td>
                        <td>${el.title}</td>
                        <td>${el.addr1}</td>
                    </tr>`
        })
    }
    attractionList.innerHTML = str;
    displayMarker();
}

// 네비게이션 만들기
const makeNavigation = (data) => {
    const navigator = document.getElementById("navigator");
    navigator.innerHTML = data.navigator;
}


const saveMarkerInfo = (el) => {
    const markerInfo = {
        contentId: el.contentId,
        addr1: el.addr1,
        title: el.title,
        latlng: new kakao.maps.LatLng(el.latitude, el.longitude),
        contentTypeId: el.contentTypeId,
        firstImage: el.firstImage,
        zipCode: el.zipCode,
        tel: el.tel
    };

    positions.push(markerInfo)
}
