<%@page import="VO.UserVO"%>
<%@page import="DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	request.setCharacterEncoding("utf-8");
    
    	UserDAO dao = new UserDAO();
    	UserVO vo = new UserVO();
    	vo.setUserid(request.getParameter("id"));
    	vo.setUserpw(request.getParameter("pw"));
    	vo.setUserName(request.getParameter("name"));
    	vo.setUsergender(request.getParameter("gender"));
    	vo.setUsernickname(request.getParameter("nickName"));
    	int cnt = dao.addUser(vo);
    	if(cnt > 0)
    		out.println("<script>alert('회원가입이 성공했습니다.'); location.replace('index.jsp'); </script>");
    	else
    		out.println("<script>alert('!Error : SignUp-State = false'); location.replace('addUser.jsp'); </script>");
    %>