<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.InputStreamReader,java.net.HttpURLConnection,java.net.URL,java.net.URLEncoder,java.io.BufferedReader,java.io.IOException"%>

<%
    String keyword = request.getParameter("keyword");
    String startNum = request.getParameter("startNum");

    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1");
    urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=ZOyrleH0fOWPAKLTQNvktU3QszG232aYaSZ8NcusR5YE7EoNRXDz2yZEPmtCDwxKX7HjG8MNF4WqN9XrCNUEhg%3D%3D");
    urlBuilder.append("&" + URLEncoder.encode("desc_kor", "UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8"));
    urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(startNum, "UTF-8"));
    urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("13", "UTF-8"));
    urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
    
    URL url = new URL(urlBuilder.toString());
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");
    conn.setRequestProperty("Content-type", "application/json");

    BufferedReader rd;
    if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
        rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    } else {
        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
    }

    StringBuilder sb = new StringBuilder();
    String line;
    while ((line = rd.readLine()) != null) {
        sb.append(line);
    }

    rd.close();
    conn.disconnect();
  

    
    out.println(sb.toString());  // JSP에서 응답을 출력
%>