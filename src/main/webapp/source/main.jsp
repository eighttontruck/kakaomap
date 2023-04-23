<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Maps API</title>
    <!-- 카카오 지도 api -->
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2baa88cb6ea7670d8c2b6ec22f7a8379"></script>
    <style>
        @font-face {
            font-family :'MaruBuri-SemiBold';
            src : url(./MaruBuri-SemiBold.ttf);
        }
        div.sidebar {
            width:500px;
            height:100%;
            background: cornsilk;
            position:fixed;
            top:0;
            right:-500px; /* 이 줄 left값은 width와 같은 값이 들어가야됨 */
            z-index:1;
            transition:all .35s;
        } 
        /* input[id="menuicon"]:checked + label + div {
            right:0;
        } */
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="../images/mainlogo.png" alt="Logo" style="width:50px;">
        </a>
        <a class="navbar-brand" href="#">오늘 점심 뭐 먹지?</a>
        <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button> -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link active ml-5 mt-1 h5" aria-current="page" href="#">전체보기</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-5 mt-1 h5" href="#">한식</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-5 mt-1 h5" href="#">중식</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-5 mt-1 h5" href="#">일식</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-5 mt-1 h5" href="#">양식</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-5 mt-1 h5" href="#">카페</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-5 mt-1 h5" href="#">편의점</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-5 mt-1 h5" href="#">점메추</a>
            </li>
            <li>
            	<p>${mid} 님 반갑습니다.</p>
            </li>
            <li class="nav-item">
                <button class="btn btn-success ml-5 mt-2" type="button">로그아웃</button>
            </li>
            </ul>            
        </div>
        </div>
    </nav>

    <div id="map" style="width:1680px; height:866px;"></div>
    <div id="clickLatlng"></div>
    
    <div class="sidebar" id="sidebar">
        <div class="container">
            <div class="row">
                <div class="col">여기에 자동으로 넘어가지는 음식사진 넣기</div>
            </div>
            <div class="row">
                <div class="col">여기에 뭐 가게명 영업시간 등등 쓰면 될듯</div>
            </div>
            <div class="row">
                <div class="col">여기엔 후기</div>
            </div>
            <div class="row">
                <div class="col"><input type="button" value="닫기" id="closBtn"></div>
            </div>
        </div>
    </div>

	<script>

        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(36.635073, 127.459547), //지도의 중심좌표. //현재 좌표는 그린컴퓨터아트학원 기준
            level: 2 //지도의 레벨(확대, 축소 정도)
            // disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        // 마커가 표시될 위치입니다 
        var markerPosition  = new kakao.maps.LatLng(36.635073, 127.459547); 
        var markerPosition2  = new kakao.maps.LatLng(36.634000, 127.459400); 

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            clickable:true
        });
        var marker2 = new kakao.maps.Marker({ //마커 생성 코드 나중에는 반복문으로 처리해야되나? 위도 경도는 db로 받고?
            position: markerPosition2,
            clickable:true
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        marker2.setMap(map);

        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    

        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
            
            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng; 
            
            // 마커 위치를 클릭한 위치로 옮깁니다
            // marker.setPosition(latlng);
            
            // 마우스로 클릭한 위치의 위도와 경도를 표시할 메세지
            var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            message += '경도는 ' + latlng.getLng() + ' 입니다';

            // 'clickLatlng'라는 아이디값을 가진 <div> 태그의 innerHTML 으로 위 메세지를 설정합니다.
            var resultDiv = document.getElementById('clickLatlng'); 
            resultDiv.innerHTML = message;
        });
            
        var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
            // 마커 위에 인포윈도우를 표시합니다
            infowindow.open(map, marker);
            sidebar.style.right=0;
        });
        kakao.maps.event.addListener(marker2, 'click', function() {
            // 마커 위에 인포윈도우를 표시합니다
            infowindow.open(map, marker2);
            sidebar.style.right=0;
        });


        const closBtn=document.getElementById("closBtn");

        closBtn.addEventListener('click',()=>{
            sidebar.style.right=-500+'px';
        });
	</script>

</body>
</html>