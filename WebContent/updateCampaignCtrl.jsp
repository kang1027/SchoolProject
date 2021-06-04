<%@page import="DAO.TreeInfoDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="VO.CampaignVO"%>
<%@page import="VO.CorporationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		int code = Integer.parseInt(request.getParameter("code"));
		String[] cpvalue = request.getParameter("cpname").split("-");
		String cpname = cpvalue[0];
		String cpurl = cpvalue[1];
		String tcname = request.getParameter("tcname");
		String tcintro = request.getParameter("tcintro");
		String tcurl = request.getParameter("tcurl");
		String tccall = request.getParameter("tccall");
		String tcdate = request.getParameter("tcdate");
		CampaignVO vo = new CampaignVO();
		vo.setTccode(code);
		vo.setCpname(cpname);
		vo.setCpurl(cpurl);
		vo.setTcname(tcname);
		vo.setTcintro(tcintro);
		vo.setTcurl(tcurl);
		vo.setTccall(tccall);
		vo.setTcdate(Date.valueOf(tcdate));
		
		TreeInfoDAO dao = new TreeInfoDAO();
		int state = dao.updateCampaign(vo);
		
		if(state > 0)
			out.println("<script>alert('캠페인이 수정되었습니다..'); location.replace('campaignList.jsp');</script>");
		else
			out.println("<script>alert('캠페인 수정이 실패하였습니다.'); location.replace('updateCampaign.jsp?code="+code+"');</script>");
	%>
