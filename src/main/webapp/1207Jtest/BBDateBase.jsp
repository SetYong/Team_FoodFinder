<%@ page import="FoodDB.FoodDTO"%>
<%@ page import="FoodDB.FoodDAO"%>
<%@ import ="java.sql.date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    int head_num =Integer.parseInt(request.getParameter("head_num"));
    int visitcount =Integer.parseInt(request.getParameter("visitcount"));
    String image = request.getParameter("image");
    String text = request.getParameter("text");
    String title = request.getParameter("title");
    int mbnum = Integer.parseInt(request.getParameter("mbnum"));
    int heartcount = Integer.parseInt(request.getParameter("heartcount"));
    Date fooddate = Integer.parseInt(request.getParameter("fooddate"));
    String cate = request.getParameter("cate");
    
    
    System.out.println(head_num);
    System.out.println(visitcount);
    System.out.println(image);
    System.out.println(text);
    System.out.println(title);
    System.out.println(mbnum);
    System.out.println(heartcount);
    System.out.println(fooddate);
    System.out.println(cate);
    
    FoodDAO dao = new FoodDAO();
    FoodDTO memberDTO = dao.getHead_num(head_num, visitcount, image, text, title, mbnum, heartcount, fooddate, cate);
    dao.close();
    
    // null 체크를 추가하여 오류 방지
    if (memberDTO != null) {
        session.setAttribute("memberName", FoodDTO.getHead_num());
        response.sendRedirect(".jsp");
    }
%>