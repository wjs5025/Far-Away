// 카카오지도
let mapContainer = document.getElementById("map"), // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
    level: 5, // 지도의 확대 레벨
  };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
let map = new kakao.maps.Map(mapContainer, mapOption);


// 마커표시
function displayMarker() {
  // 마커 이미지의 이미지 주소입니다
  let imageSrc;

  for (let i = 0; i < positions.length; i++) {
    // 마커 이미지의 이미지 크기 입니다
    let imageSize = new kakao.maps.Size(24, 35);

    imageSrc = `/assets/img/marker/marker${positions[i].contenttypeid}.png`;
      // 마커 이미지를 생성합니다
    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

    // 마커를 생성합니다
    let marker = new kakao.maps.Marker({
      map: map, // 마커를 표시할 지도
      position: positions[i].latlng, // 마커를 표시할 위치
      title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
      image: markerImage, // 마커 이미지
    });
  }

  // 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
  map.setCenter(positions[0].latlng);
}

function moveCenter(lat, lng) {
  console.log(lat)
  console.log(lng)
  map.setCenter(new kakao.maps.LatLng(lat, lng));
}
