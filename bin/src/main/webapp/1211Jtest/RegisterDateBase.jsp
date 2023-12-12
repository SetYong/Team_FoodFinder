<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String name = request.getParameter("name");
    String cn = request.getParameter("cn");
    String mail = request.getParameter("mail");
    String phone = request.getParameter("phone");
    String nickname = request.getParameter("nickname");
    
    
    System.out.println(name);
    System.out.println(cn);
    System.out.println(mail);
    System.out.println(phone);
    System.out.println(nickname);
    
    MemberDAO dao = new MemberDAO();
    MemberDTO memberDTO = dao.getRegister(name, cn, mail, phone, nickname);
    dao.close();
    
    // null 체크를 추가하여 오류 방지
    if (memberDTO != null) {
        session.setAttribute("memberName", memberDTO.getName());
        response.sendRedirect("Login.jsp");
    }
%>