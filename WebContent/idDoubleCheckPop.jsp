<%@page import="DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	
    	UserDAO dao = new UserDAO();
    	int state = dao.idDoubleCheck(id);
    	if(state > 0)
    		out.println("<script>alert('사용 가능한 아이디입니다.'); window.close(); </script>");
    	else
    		out.println("<script>alert('이미 있는 아이디입니다. 아이디를 다시 입력해주세요.'); window.close(); </script>");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id %>아이디는 사용 가능합니다.
</body>
</html>