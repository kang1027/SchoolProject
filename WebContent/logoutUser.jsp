<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		session.removeAttribute("nickname");
		session.removeAttribute("id");
		out.println("<script>alert('정상적으로 로그아웃 되셨습니다.'); location.replace('index.jsp'); </script>");
    %>