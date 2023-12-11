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
	
	MemberDAO dao = new MemberDAO();
	MemberDTO memberDTO = dao.getMemberId(memberName, memberCn, memberPhone);
	memberDTO.setName(memberName);
	dao.close();
	
	if(memberDTO.getId() != null){
		request.setAttribute("memberName",memberDTO.getName());
		request.setAttribute("memberId",memberDTO.getId());
		request.getRequestDispatcher("Main.jsp?contentPage=FindIdResult.jsp").forward(request, response);;
	}
	else{
		request.setAttribute("LoginErrMsg", "입력하신 정보의 회원을 찾지 못하였습니다.");
		request.getRequestDispatcher("Main.jsp?contentPage=FindIdHome.jsp").forward(request, response);
	}
%>