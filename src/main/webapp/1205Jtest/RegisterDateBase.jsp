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
    
    // null üũ�� �߰��Ͽ� ���� ����
    if (memberDTO != null) {
        session.setAttribute("memberId", memberDTO.getId());
        response.sendRedirect("Login.jsp");
    } else {
        // ����� ������ ��ȸ���� �ʾ��� ��� ó��
        // ���� ���, �α��� ���� �޽����� ǥ���ϰų� �ٽ� �α��� ȭ������ �̵��� �� ����
        response.sendRedirect("login.jsp?error=1");
    }
%>