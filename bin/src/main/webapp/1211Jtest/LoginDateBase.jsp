<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String USER_ID = request.getParameter("id");
    String USER_pwd = request.getParameter("password");
   
    
    MemberDAO dao = new MemberDAO();
    MemberDTO memberDTO = dao.getUSER_ID(USER_ID, USER_pwd);
    dao.close();

    // null 체크를 추가하여 오류 방지
    if (memberDTO != null) {
        session.setAttribute("memberId", memberDTO.getId());
        response.sendRedirect("center.jsp");
    } else {
        // 사용자 정보가 조회되지 않았을 경우 처리
        // 예를 들어, 로그인 실패 메시지를 표시하거나 다시 로그인 화면으로 이동할 수 있음
        response.sendRedirect("login.jsp?error=1");
    }
%>
