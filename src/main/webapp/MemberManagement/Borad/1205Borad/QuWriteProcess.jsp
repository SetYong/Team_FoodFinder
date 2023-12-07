<%@ page import = "QuestionBoard.QuestionBoardDAO" %>
<%@ page import = "QuestionBoard.QuestionBoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("QuCate");
	String title = request.getParameter("QuTitle");
	String content = request.getParameter("QuContent");
	
	QuestionBoardDTO dto = new QuestionBoardDTO();
	dto.setQucate(cate);
	dto.setTitle(title);
	dto.setContent(content);
	//dto.setUserid(session.getAttribute("User_Id").toString());
	dto.setMbnum(20);
	
	System.out.println(dto.getQucate() + dto.getTitle() + dto.getContent() + dto.getMbnum());
	QuestionBoardDAO dao = new QuestionBoardDAO();
	int iResult = dao.insertQuWrite(dto);
	dao.close();
	
	if(iResult == 1){
		response.sendRedirect("QuestionBoardResult.jsp");
	}
%>