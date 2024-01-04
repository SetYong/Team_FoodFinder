<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.InputStreamReader,java.net.HttpURLConnection,java.net.URL,java.net.URLEncoder,java.io.BufferedReader,java.io.IOException,java.text.SimpleDateFormat,java.util.Date"%>

<%
    String serviceKey = "ZOyrleH0fOWPAKLTQNvktU3QszG232aYaSZ8NcusR5YE7EoNRXDz2yZEPmtCDwxKX7HjG8MNF4WqN9XrCNUEhg==";
    String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";

   
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    String currentDate = sdf.format(new Date());

    String queryParams = "?serviceKey=" + URLEncoder.encode(serviceKey, "UTF-8")
            + "&pageNo=1"
            + "&numOfRows=1000"
            + "&dataType=JSON"
            + "&base_date=" + currentDate  // 
            + "&base_time=0600"
            + "&nx=60"
            + "&ny=127";

    URL url = new URL(apiUrl + queryParams);
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");

    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

    StringBuilder sb = new StringBuilder();
    String line;
    while ((line = br.readLine()) != null) {
        sb.append(line);
    }
    br.close();

    out.println(sb.toString());  // 날씨 정보를 JSON 형식으로 출력
%>