<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String USER_ID = request.getParameter("id");
    String USER_pwd = request.getParameter("password");
   
    String oracleDriver = application.getInitParameter("OracleDriver");
    String oracleURL = application.getInitParameter("OracleURL");
    String oracleId = application.getInitParameter("OracleID");
    String oraclePwd = application.getInitParameter("OraclePwd");
    
    MemberDAO dao = new MemberDAO();
    MemberDTO memberDTO = dao.getUSER_ID(USER_ID, USER_pwd);
    dao.close();

    // null 체크를 추가하여 오류 방지
    if (memberDTO != null) {
    	session.setAttribute("memberId", memberDTO.getId());
    	session.setAttribute("loginvalue", "1");
        response.sendRedirect("Main.jsp");
    } else {
        // 사용자 정보가 조회되지 않았을 경우 처리
        // 예를 들어, 로그인 실패 메시지를 표시하거나 다시 로그인 화면으로 이동할 수 있음
        request.setAttribute("LoginErrMsg","로그인 오류입니다.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
