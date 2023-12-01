<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberName = request.getParameter("memberName");

	String memberCn = request.getParameter("memberCn1");
		   memberCn += request.getParameter("memberCn2");
		   
	String memberPhone = request.getParameter("memberPhone1");
		   memberPhone += request.getParameter("memberPhone2");
		   memberPhone += request.getParameter("memberPhone3");

	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
	MemberDTO memberDTO = dao.getMemberId(memberName, memberCn, memberPhone);
	dao.close();
	
	session.setAttribute("memberName",memberName);
	session.setAttribute("memberId",memberDTO.getId());
	response.sendRedirect("FindIdResult.jsp");
%>