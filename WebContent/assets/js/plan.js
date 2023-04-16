// 검색 버튼을 누르면..
// 지역, 유형, 검색어 얻기.
// 위 데이터를 가지고 공공데이터에 요청.
// 받은 데이터를 이용하여 화면 구성.

window.onload = () => {
    document.getElementById("btn-plansearch").addEventListener("click", () => {
        console.log("gddgdg");
        let searchUrl = `https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;

        let keyword = document.getElementById("search-keyword").value;
        if (keyword) {
            searchUrl += `&keyword=${keyword}`;
        } else {
            alert("관광지를 검색하세요!");
        }
        fetch(searchUrl)
            .then((response) => response.json())
            .then((data) => makeList(data));
    });
}

function addLine(yy, xx) {
    var y = yy.toFixed(8);
    var x = xx.toFixed(8);
    var latlng = new kakao.maps.LatLng(y, x);
    tripCourse.push(latlng);
    document.getElementById("tripcourse").innerText = tripCourse.toString();
    // 지도에 표시할 선을 생성합니다
    var polyline = new kakao.maps.Polyline({
        path: tripCourse, // 선을 구성하는 좌표배열 입니다
        strokeWeight: 5, // 선의 두께 입니다
        strokeColor: '#FF3DE5', // 선의 색깔입니다
        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'dashed' // 선의 스타일입니다
    });
    // 지도에 선을 표시합니다
    polyline.setMap(map);
    for (var i = 0; i < infoWindowList.length; i++) {
        console.log(infoWindowList[i].getPosition());
        if (infoWindowList[i].getPosition().equals(latlng)) {
            infoWindowList[i].close();
            infoWindowList.splice(i, 1);
            i--;
        }
    }

}

function makeList(data) {
    // document.querySelector("table").setAttribute("style", "display: ;");
    positions.length = 0;
    let trips = data.response.body.items.item;
    let tripList = ``;
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    let noImgSrc = "";
    trips.forEach((area) => {
        let yy = parseFloat(area.mapy);
        let xx = parseFloat(area.mapx);

        const temp1 = yy * 100000000;
        const temp2 = Math.floor(temp1);
        const y = temp2 / 100000000;

        const temp3 = xx * 100000000;
        const temp4 = Math.floor(temp3);
        const x = temp4 / 100000000;

        positions.push({
            content: `
                <div class="info" onclick="moveCenter(${area.mapy}, ${area.mapx});">
                    <div class="title">
                        ${area.title}
                    </div>
                    <div class="body">
                      <div class="img">
                        <img alt="${noImgSrc}" src="${area.firstimage}"  width="73" height="70">
                      </div>
                    </div>
                    <div class="desc">
                        <div class="ellipsis">${area.addr2}</div>
                        <div class="jibun ellipsis">${area.addr1}</div>
            			<div><button class = "close" onclick="addLine(${area.mapy}, ${area.mapx});">추가</button></div>    
                    </div>
                    <br>
            	</div>`,
            title: area.title,
            latlng: new kakao.maps.LatLng(y, x),
        });

        // 관광지 서치 버튼 클릭 후 테이블 생성
        tripList += `
              <tr onclick="moveCenter(${area.mapy}, ${area.mapx});">
                <td><img src="${area.firstimage}" width="100px"></td>
                <td>${area.title}</td>
              </tr>
            `;
    });


    document.getElementById("trip-list").innerHTML = tripList;

    for (var i = 0; i < positions.length; i++) {
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커의 위치
            clickable: true,
        });

        var iwContent = positions[i].content, // 인포윈도우에 표출될 내용으로 HTML 문자열이나
            // document element가 가능합니다
            iwRemoveable = true;

        // 마커에 표시할 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: iwContent, // 인포윈도우에 표시할 내용
            removable: iwRemoveable,
        });

        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
        // 이벤트 리스너로는 클로저를 만들어 등록합니다
        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
        kakao.maps.event.addListener(marker, "click", makeOverListener(map, marker, infowindow));


    }

    map.setCenter(positions[0].latlng);
}

let infoWindowList = [];

function makeOverListener(map, marker, infowindow) {
    return function () {
        infowindow.open(map, marker);
        infoWindowList.push(infowindow);
    };
}

let tripCourse = [];

let courseList = ``;
// 지도의 추가버튼을 클릭하면 여행 코스에 추가하는 메서드

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
//      function closeOverlay() {
//    	  overlay.setMap(null);
//         infowindow.close();
//      }
// 인포윈도우를 표시하는 클로저를 만드는 함수입니다


map = new kakao.maps.Map(mapContainer, mapOption);


function moveCenter(lat, lng) {
    map.setCenter(new kakao.maps.LatLng(lat, lng));
}