<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String name = request.getParameter("name");
    	TreeInfoDAO dao = new TreeInfoDAO();
    	int state = dao.deleteTree(name);
    	if(state > 0)
    		out.println("<script>alert('"+name+"나무 삭제가 완료되었습니다.'); location.replace('treeInfoList.jsp')</script>");
    	else
    		out.println("<script>alert('"+name+"나무 삭제를 실패했습니다.'); location.replace('treeInfoList.jsp')</script>");
    	
    %>