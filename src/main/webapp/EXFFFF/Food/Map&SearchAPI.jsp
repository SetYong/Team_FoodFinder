<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 API</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=l6gbu2evid"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script>
        // [검색 요청] 버튼 클릭 시 실행할 메서드를 정의합니다.
        $(function() {
            $('#searchBtn').click(function() {
                $.ajax({
                    url: "http://localhost:8081/Team_FoodFinder/NaverSearchAPI.do",  // 요청 URL
                    type: "get",                  // HTTP 메서드
                    data: {                       // 매개변수로 전달할 데이터
                        keyword: $('#keyword').val(),                   // 검색어
                        startNum: $('#startNum option:selected').val()  // 검색 시작 위치
                    },
                    dataType: "json",      // 응답 데이터 형식
                    success: sucFuncJson,  // 요청 성공 시 호출할 메서드 설정
                    error: errFunc         // 요청 실패 시 호출할 메서드 설정
                });
            });
        });

        // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson(d) {
            var str = "";
            $.each(d.items, function(index, item) {
                str += "<ul>";
                str += "    <li>" + (index + 1) + "</li>";
                str += "    <li>" + item.title + "</li>";
                str += "    <li>" + item.category + "</li>";
                str +="     <li>" + item.address + "</li>";
                str += "    <li><a href='" + item.link + "' target='_blank'>바로가기</a></li>";
                str += "</ul>";
            });
            $('#searchResult').html(str);
        }

        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
        
    </script>
    
    <style>
        ul{border:2px #cccccc solid;}
    </style>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>
    <div>
        <div>
            <form id="searchFrm">
                여기에서 검색해 주세요. <br />
                <select id="startNum">
                    <option value="1">1페이지</option>
                    <option value="11">2페이지</option>
                    <option value="21">3페이지</option>
                    <option value="31">4페이지</option>
                    <option value="41">5페이지</option>
                </select>
                <input type="text" id="keyword" placeholder="검색어를 입력하세요." />
                <button type="button" id="searchBtn">검색 요청</button>
            </form>
        </div>
        <div class="row" id="searchResult">
            여기에 검색 결과가 출력됩니다.
        </div>
    </div>
    <script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);

var markerOptions = {
    position: new naver.maps.LatLng(37.3595704, 127.105399),
    map: map,
    draggable: true // 마커를 드래그할 수 있도록 설정
};

var marker = new naver.maps.Marker(markerOptions);

// 마커를 클릭했을 때의 이벤트 핸들러
naver.maps.Event.addListener(marker, 'click', function(e) {
    alert('마커를 클릭했습니다.');
});

// 지도를 클릭했을 때의 이벤트 핸들러
naver.maps.Event.addListener(map, 'click', function(e) {
    var latlng = e.coord; // 클릭한 위치의 좌표
    marker.setPosition(latlng); // 마커 위치 이동
});

</script>
</body>
</html>