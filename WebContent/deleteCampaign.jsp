<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	int code = Integer.parseInt(request.getParameter("code"));
    	TreeInfoDAO dao = new TreeInfoDAO();
    	int state = dao.deleteCampaign(code);
    	if(state > 0)
    		out.println("<script>alert('"+code+"번 캠페인 삭제가 완료되었습니다.'); location.replace('campaignList.jsp')</script>");
    	else
    		out.println("<script>alert('"+code+"번 캠페인 삭제를 실패했습니다.'); location.replace('campaignList.jsp')</script>");
    %>