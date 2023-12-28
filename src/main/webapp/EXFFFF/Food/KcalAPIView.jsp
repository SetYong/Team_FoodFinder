<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 API</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        // [검색 요청] 버튼 클릭 시 실행할 메서드를 정의합니다.
        $(function() {
            $('#searchBtn').click(function() {
                $.ajax({
                    url: "API.jsp",  // JSP 서버 프로그램 호출
                    type: "get",
                    data: {
                        keyword: $('#keyword').val(),
                        startNum: $('#startNum option:selected').val()
                    },
                    dataType: "html",  // JSP에서 HTML 형식의 응답을 받음
                    success: function(response) {
                        // JSP 서버 프로그램의 응답을 사용하여 화면에 뿌려줍니다.
                        $('#searchResult').html(response);
                    },
                    error: function(xhr, status, error) {
                        alert("실패: " + status);
                    }
                });
            });
        });
    </script>
    <style>
        ul{border:2px #cccccc solid;}
    </style>
</head>
<body>
    <div>
        <div>
            <form id="searchFrm">
                한 페이지에 10개씩 출력됨 <br />
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
</body>
</html>
