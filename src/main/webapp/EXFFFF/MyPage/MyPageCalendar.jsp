<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");

	Calendar cal = Calendar.getInstance();
	
	// 시스템 오늘 날짜
	int ty = cal.get(Calendar.YEAR);
	int tm = cal.get(Calendar.MONTH)+1;
	int td = cal.get(Calendar.DATE);
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	// 파라미터 받기
	String sy = request.getParameter("year");
	String sm = request.getParameter("month");
	
	if(sy!=null){
		year = Integer.parseInt(sy);
	}
	if(sm!=null){
		month = Integer.parseInt(sm);
	}
	cal.set(year, month-1, 1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	
	int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일) ~ 7(토)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0; padding: 0;
    box-sizing: border-box;
}

body {
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}

a {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: #F28011;
}

.calendar {
	width: 280px;
	margin: 30px auto;
}
.calendar .title{
	height: 37px;
	line-height: 37px;
	text-align: center;
	font-weight: 600;
}

.calendar table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

.calendar table thead tr:first-child{
	background: #f6f6f6;
}

.calendar table td{
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
}

.calendar table td:nth-child(7n+1){
	color: red;
}
.calendar table td:nth-child(7n){
	color: blue;
}
.calendar table td.gray {
	color: #ccc;
}
.calendar table td.today{
	font-weight:700;
	background: #E6FFFF;
}

.calendar .footer{
	height: 25px;
	line-height: 25px;
	text-align: right;
	font-size: 12px;
}
</style>
</head>
<body>
	<div class="calendar">
		<div class="title">
			<a href="MyPageCalendar.jsp?year=<%=year%>&month=<%=month - 1%>">&lt;</a> <label><%=year%>년
				<%=month%>월</label> <a href="MyPageCalendar.jsp?year=<%=year%>&month=<%=month + 1%>">&gt;</a>
		</div>
		<table>
			<thead>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>
			<tbody>
				<%
				// 1일 앞달
				Calendar preCal = (Calendar) cal.clone();
				preCal.add(Calendar.DATE, -(week - 1));
				int preDate = preCal.get(Calendar.DATE);

				out.print("<tr>");
				// 1일 앞 부분
				for (int i = 1; i < week; i++) {
					// out.print("<td>&nbsp;</td>");
					out.print("<td class='gray'>" + (preDate++) + "</td>");
				}

				// 1일부터 말일까지 출력
				int lastDay = cal.getActualMaximum(Calendar.DATE);
				String cls;
				for (int i = 1; i <= lastDay; i++) {
					cls = year == ty && month == tm && i == td ? "today" : "";
					out.print("<td class='" + cls + "'>" + i + "</td>");
					if (lastDay != i && (++week) % 7 == 1) {
						out.print("</tr><tr>");
					}
				}

				// 마지막 주 마지막 일자 다음 처리
				int n = 1;
				for (int i = (week - 1) % 7; i < 6; i++) {
					// out.print("<td>&nbsp;</td>");
					out.print("<td class='gray'>" + (n++) + "</td>");
				}
				out.print("</tr>");
				%>
			</tbody>
		</table>
		<div class="footer">
			<a href="MyPageCalendar.jsp">오늘 날짜로</a>
		</div>
	</div>
</body>
</html>