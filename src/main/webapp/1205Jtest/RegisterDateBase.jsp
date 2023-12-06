<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
    String name = request.getParameter("name");
    String cn = request.getParameter("cn");
    String mail = request.getParameter("mail");
    String phone = request.getParameter("phone");
    String nickname = request.getParameter("nickname");
    
    
    MemberDAO dao = new MemberDAO();
    MemberDTO memberDTO = dao.getRegister(name, cn, mail, phone, nickname);
    dao.close();
    
    // null 체크를 추가하여 오류 방지
    if (memberDTO != null) {
        session.setAttribute("memberId", memberDTO.getId());
        response.sendRedirect("Login.jsp");
    } else {
        // 사용자 정보가 조회되지 않았을 경우 처리
        // 예를 들어, 로그인 실패 메시지를 표시하거나 다시 로그인 화면으로 이동할 수 있음
        response.sendRedirect("login.jsp?error=1");
    }
%>