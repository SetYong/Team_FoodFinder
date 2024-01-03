<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>날씨 정보</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        // [날씨 정보 가져오기] 버튼 클릭 시 실행할 메서드를 정의합니다.
        $(function() {
            $('#searchBtn').click(function() {
                $.ajax({
                    url: "WAPI.jsp",  // JSP 서버 프로그램 호출
                    type: "get",
                    dataType: "json",  // JSON 형식의 응답을 받음
                    success: function(response) {
                        var items = response.response.body.items.item;
                        var resultHtml ='<ul>';
                        for(var i =0; i< items.length; i++){
                            var item = items[i];
                            var category= item.category;
                            var obsrValue = item.obsrValue;
                        
                            var categoryKorean = getCategoryKoreanName(category);

                            resultHtml += '<li>' + categoryKorean + ' - ' + obsrValue + '℃</li>';
                        }
                        resultHtml += '</ul>';
                        
                        $('#searchResult').html(resultHtml);
                    },
                    error: function(xhr, status, error) {
                        alert("실패: " + status);
                    }
                });
            });
        });
        function getCategoryKoreanName(category) {
            switch (category) {
                case 'PTY':
                    return '강수형태';
                case 'REH':
                    return '습도';
                case 'RN1':
                    return '1시간 강수량';
                case 'T1H':
                    return '기온';
                case 'UUU':
                    return '풍속(동서성분)';
                case 'VEC':
                    return '풍향';
                case 'VVV':
                    return '풍속(남북성분)';
                case 'WSD':
                    return '풍속';
                default:
                    return category; // 정의되지 않은 경우, 그대로 반환
            }
        }
    </script>
</head>
<body>
    <h1>오늘의 날씨</h1>
    <button id="searchBtn">날씨 가져오기</button>
    <div id="searchResult"></div>
</body>
</html>
