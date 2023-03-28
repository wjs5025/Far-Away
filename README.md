# FAR-AWAY (BACK-END 5팀)

# PROJECT OVERVIEW

## 내게 꼭 맞는 여행지를 찾고 싶으신가요? FAR AWAY에서 찾아보세요!

- '지역별 여행지'에서 원하는 지역과 관광지 유형을 선택하면, 해당 지역의 관광 정보를 제공해요.
- '나의 여행계획'를 통해 나만의 여행 꿀팁을 공유할 수 있어요.
- '핫플 자랑하기'를 통해 내가 발견한 🔥핫플레이스를 자랑해보아요!
- '여행정보 공유'를 통해 회원끼리 유용한 정보를 나눌 수 있어요.

# PROJECT DETAIL

## TEAM INFO

- SSAFY 9기 광주 5반, BACK-END 관통프로젝트 페어 5팀
- 팀 구성 : 전인혁 / 최영환

## 이전 프로젝트의 통합

- 팀원마다 이전 페어와 진행했던 프로젝트들의 View와 기능을 하나로 통합했습니다.
- 통합 과정에서 HTML 분리 / HTML <-> JSP 변환 / 데이터베이스 연동 / 서버 구성 등 프로젝트에 많은 변화가 있었습니다.

  ![이전 프로젝트의 통합](./docs/capture/1_%EC%9D%B4%EC%A0%84%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%9D%98_%ED%86%B5%ED%95%A9.png)

## ERD

![ERD](./docs/capture/25_ERD.png)

## 테이블 명세

![테이블 명세](./docs/capture/26_%ED%85%8C%EC%9D%B4%EB%B8%94%EB%AA%85%EC%84%B8.png)

## 기본(필수) 기능

### 메인페이지

- "이번 봄, 어디로 떠나실건가요?" 라는 환영 문구와 함께 메인페이지가 나타납니다.
- 이번 "계절"은, 현재 날짜 기준으로 월별로 다른 계절 텍스트가 출력됩니다. (현재 12,1,2월이면 겨울 / 3,4,5월이면 봄 / 6,7,8월이면 여름 / 9,10,11월이면 가을)
- SEARCH 버튼을 누르면 '지역별 여행지' 메뉴로 이동합니다.

  ![메인페이지](./docs/capture/2_%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80.png)

### 지역별 관광지 조회 페이지

#### 지역별 관광지 조회 (전체)

- 관광지 유형을 선택하지 않으면, 선택 지역 내 모든 유형의 관광지가 보여집니다.
- 각각의 관광지 유형마다 다른 마커가 표시됩니다.

  ![지역별 관광지 조회 결과 페이지](<./docs/capture/9_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EC%A0%84%EC%B2%B4).png>)

#### 지역별 관광지 조회 (마커)

- 카카오맵 API를 활용해 마커를 클릭하면, 해당 관광지에 관한 정보가 팝업으로 보여집니다.

![지역별 관광지 조회 (마커)](<./docs/capture/24_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EB%A7%88%EC%BB%A4).png>)

#### 지역별 관광지 조회 (관광지)

- 선택한 지역에 해당하는 '관광지'만 보여집니다.
- '관광지'에 해당하는 마커로 표시됩니다.

  ![지역별 관광지 조회 결과 페이지](<./docs/capture/10_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EA%B4%80%EA%B4%91%EC%A7%80).png>)
  <br/>

#### 지역별 관광지 조회 (문화시설)

- 선택한 지역에 해당하는 '문화시설'만 보여집니다.
- '문화시설'에 해당하는 마커로 표시됩니다.

  ![지역별 관광지 조회 결과 페이지](<./docs/capture/11_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EB%AC%B8%ED%99%94%EC%8B%9C%EC%84%A4).png>)
  <br/>

#### 지역별 관광지 조회 (축제공연행사)

- 선택한 지역에 해당하는 '축제공연행사'만 보여집니다.
- '축제공연행사'에 해당하는 마커로 표시됩니다.

  ![지역별 관광지 조회 결과 페이지](<./docs/capture/12_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EC%B6%95%EC%A0%9C%EA%B3%B5%EC%97%B0%ED%96%89%EC%82%AC).png>)
  <br/>

#### 지역별 관광지 조회 (레포츠)

- 선택한 지역에 해당하는 '레포츠'만 보여집니다.
- '레포츠'에 해당하는 마커로 표시됩니다.

  ![지역별 관광지 조회 결과 페이지](<./docs/capture/13_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EB%A0%88%ED%8F%AC%EC%B8%A0).png>)
  <br/>

#### 지역별 관광지 조회 (숙박)

- 선택한 지역에 해당하는 '숙박'만 보여집니다.
- '숙박'에 해당하는 마커로 표시됩니다.

  ![지역별 관광지 조회 결과 페이지](<./docs/capture/14_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EC%88%99%EB%B0%95).png>)
  <br/>

#### 지역별 관광지 조회 (쇼핑)

- 선택한 지역에 해당하는 '쇼핑'만 보여집니다.
- '쇼핑'에 해당하는 마커로 표시됩니다.

  ![지역별 관광지 조회 결과 페이지](<./docs/capture/15_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EC%87%BC%ED%95%91).png>)
  <br/>

#### 지역별 관광지 조회 (음식점)

- 선택한 지역에 해당하는 '음식점'만 보여집니다.
- '음식점'에 해당하는 마커로 표시됩니다.

  ![지역별 관광지 조회 결과 페이지](<./docs/capture/16_%EC%A7%80%EC%97%AD%EB%B3%84%EA%B4%80%EA%B4%91%EC%A7%80%EC%A1%B0%ED%9A%8C(%EC%9D%8C%EC%8B%9D%EC%A0%90).png>)
  <br/>

### 회원관리

#### 회원 가입

- 회원가입을 위한 페이지입니다.
- 비밀번호와 비밀번호 확인의 일치여부에 따라 메시지가 출력됩니다. (비밀번호가 일치하지 않습니다, 비밀번호가 일치합니다.)
- 특정 입력 필드에 값이 입력되지 않으면, 해당 필드에 값을 입력하라는 경고창이 등장합니다.
- 이미 등록된 아이디의 경우, 회원가입이 불가하므로 에러페이지로 이동합니다.

  ![3. 회원정보 등록](./docs/capture/3_%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%20%EB%93%B1%EB%A1%9D.png)
  <br/>

#### 로그인

- 회원가입 완료 후, 또는 상단 네비게이션의 로그인 메뉴를 선택하면 로그인페이지로 이동합니다.
- 데이터베이스에 저장된 사용자 정보와 입력된 아이디와 비밀번호를 검증합니다.

  ![로그인](./docs/capture/4_%EB%A1%9C%EA%B7%B8%EC%9D%B8.png)
  <br/>

- 로그인 완료

  - 아이디와 패스워드가 일치한다면, 로그인에 성공합니다.
  - 로그인에 성공하면, 상단에 사용자 이름과 함께 메뉴가 변경됩니다.

    ![로그인 완료](./docs/capture/5_%EB%A1%9C%EA%B7%B8%EC%9D%B8%EC%84%B1%EA%B3%B5.png)
    <br/>

#### 회원정보 조회

- 회원정보 조회 메뉴를 선택하면, 현재 로그인된 계정의 정보를 출력합니다.
- 회원 정보 수정하기 버튼을 누르면 회원정보 수정화면으로 이동합니다.

  ![회원정보 조회](./docs/capture/6_%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%EC%A1%B0%ED%9A%8C.png)
  <br/>

#### 회원정보 수정

- 변경 가능한 정보(사용자 이름, 이메일)을 변경하고, 비밀번호를 입력 후 수정완료 버튼을 누르면 수정이 완료됩니다.
- 수정이 완료되면 메인페이지로 이동합니다.
- 수정에 실패하면 에러페이지로 이동합니다.

  ![회원정보 수정](./docs/capture/7_%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%20%EC%88%98%EC%A0%95.png)
  <br/>

#### 회원 탈퇴

- 회원 정보 조회 화면에서, 회원탈퇴 버튼을 누르면 confirm 창이 등장합니다.
- 확인을 누르면 탈퇴가 완료되고, 메인페이지로 이동합니다.

  ![탈퇴](./docs/capture/8_%ED%83%88%ED%87%B4.png)

## 심화 기능

### 여행정보 공유

#### 공지사항 게시판

- 공지사항 게시글 목록

  - 공지사항을 위한 게시판 페이지입니다.
  - '공지사항' 카테고리의 게시글이 한 페이지당 10개씩 보여집니다.
  - 게시글의 제목을 누르면 게시글 상세보기로 이동하고, 글 작성을 누르면 글작성 화면으로 이동합니다.

  ![공지사항 게시글 목록](./docs/capture/17_%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%EA%B2%8C%EC%8B%9C%EA%B8%80%EB%AA%A9%EB%A1%9D.png)

- 게시글 작성

  - 'WRITE' 버튼을 누르면 게시글 작성화면으로 이동합니다.
  - 게시글 작성자명은 현재 로그인된 회원명으로 자동입력되며, 카테고리(공지사항, 공유게시판 中 1)을 선택하고, 제목과 내용을 입력 후 글작성 버튼을 누르면 게시글이 작성됩니다.
  - 작성한 게시글은 데이터베이스(Board 테이블)에 저장됩니다.

    ![게시글 작성](./docs/capture/18_%EA%B2%8C%EC%8B%9C%EA%B8%80%EC%9E%91%EC%84%B1.png)

- 게시글 상세 보기

  - 현재 선택한 게시글을 열람합니다.
  - 게시글 수정하기 버튼을 누르면 게시글 수정화면으로, 게시글 삭제하기를 누르면 게시글을 삭제할 수 있습니다.

    ![게시글 상세 보기](./docs/capture/19_%EA%B2%8C%EC%8B%9C%EA%B8%80%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0.png)

  - 만약, 본인의 게시글이 아니라면, 게시글에 대한 권한이 없기 때문에, 아래 메뉴(수정하기, 삭제하기)가 보이지 않습니다.

  ![게시글 상세 보기2](<./docs/capture/20_%EA%B2%8C%EC%8B%9C%EA%B8%80%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0(%EB%B3%B8%EC%9D%B8%EC%9D%98%EA%B8%80%EC%9D%B4%EC%95%84%EB%8B%90%EB%96%84).png>)

- 게시글 수정하기

  - 기존 게시글의 내용이 입력창에 자동입력되며, 게시글을 수정 후 수정완료 버튼을 누르면 게시글이 수정됩니다.

  ![게시글 수정하기](./docs/capture/21_%EA%B2%8C%EC%8B%9C%EA%B8%80%EC%88%98%EC%A0%95%ED%95%98%EA%B8%B0.png)

- 게시글 삭제하기

  - 삭제하기 버튼을 누르면 '게시글을 정말 삭제하시겠습니까?' 라는 경고창이 등장합니다. 확인을 누르면 게시글을 삭제하고 목록으로 이동합니다.

    ![게시글 삭제하기](./docs/capture/22_%EA%B2%8C%EC%8B%9C%EA%B8%80%EC%82%AD%EC%A0%9C%ED%95%98%EA%B8%B0.png)

#### 공유게시판

- 공지사항 게시판과 동일합니다.
  ![공유게시판](./docs/capture/23_%EA%B3%B5%EC%9C%A0%EA%B2%8C%EC%8B%9C%ED%8C%90.png)
