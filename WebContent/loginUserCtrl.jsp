<%@page import="DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	UserDAO dao = new UserDAO();
    	String[] state = dao.tryLogin(id, pw);
    	if(state[0].equals("1")){
    		out.println("<script>location.replace('index.jsp');</script>");
			session.setAttribute("nickname", state[1]);   		
			session.setAttribute("id", state[2]);
    	}
    	else if(state[0].equals("-1"))
    		out.println("<script>alert('없는 아이디입니다. 다시 확인해주세요.'); location.replace('loginUser.jsp');</script>");
    	else if(state[0].equals("-2"))
    		out.println("<script>alert('비밀번호가 다릅니다. 다시 확인해주세요.'); location.replace('loginUser.jsp?id="+ id +"');</script>");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>