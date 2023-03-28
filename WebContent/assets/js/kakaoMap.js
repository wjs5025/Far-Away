// 카카오지도
let mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
        level: 5, // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
let map = new kakao.maps.Map(mapContainer, mapOption);


// 마커표시
const displayMarker = () => {
    // 마커 이미지의 이미지 주소입니다
    let imageSrc;

    for (let i = 0; i < positions.length; i++) {
        // 마커 이미지의 이미지 크기 입니다
        let imageSize = new kakao.maps.Size(24, 35);

        imageSrc = `/assets/img/marker/marker${positions[i].contentTypeId}.png`;
        // 마커 이미지를 생성합니다
        let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        let markerInfo = {
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage, // 마커 이미지
            clickable: true,
        }

        // 마커를 생성합니다
        const marker = new kakao.maps.Marker(markerInfo);

        marker.setMap(map);

        // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
        let iwContent = `
                <div class="card" style="width: 18rem; font-size: 0.8em">
                  <img class="card-img-top" src="${positions[i].firstImage}" alt="">
                  <div class="card-body">
                    <h5 class="card-title">${positions[i].title}</h5>
                  </div>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">[주소]<br/>(${positions[i].zipCode}) ${positions[i].addr1}</li>
                    <li class="list-group-item">[전화번호]<br/>${positions[i].tel}</li>
                  </ul>
                </div>`, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

        // 인포윈도우를 생성합니다
        let infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function () {
            // 마커 위에 인포윈도우를 표시합니다
            infowindow.open(map, marker);
        });
    }


    if (positions.length != 0){
        map.setCenter(positions[0].latlng);
    }
}

function moveCenter(lat, lng) {
    map.setCenter(new kakao.maps.LatLng(lat, lng));
}

const contentIdToString = (contentId) => {
    switch (contentId) {
        case 12 :
            return "관광지";
        case 14:
            return "문화시설";
        case 15:
            return "축제공연행사";
        case 25:
            return "여행코스";
        case 28:
            return "레포츠";
        case 32:
            return "숙박";
        case 38:
            return "쇼핑";
        case 39:
            return "음식점";
        default :
            return "기타"
    }

}