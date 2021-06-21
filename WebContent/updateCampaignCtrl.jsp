<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="VO.CampaignVO"%>
<%@page import="VO.CorporationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
	
		String uploadPath = request.getRealPath("/uploadCampaign/");
		int maxSize = 1024 * 1024 * 10;
		String fileName1 = "";
		String originalName1 = "";
		long fileSize = 0;
		String fileType = "";
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		int code = Integer.parseInt(multi.getParameter("code"));
		String[] cpvalue = multi.getParameter("cpname").split("-");
		String cpname = cpvalue[0];
		String cpurl = cpvalue[1];
		String tcname = multi.getParameter("tcname");
		String tcintro = multi.getParameter("tcintro");
		String tcurl = multi.getParameter("tcurl");
		String tccall = multi.getParameter("tccall");
		String tcdate = multi.getParameter("tcdate");
		String tcphoto = multi.getParameter("tcPhoto");
		TreeInfoDAO dao = new TreeInfoDAO();
		CampaignVO vo = new CampaignVO();
		
		int state = 0;
		try{
			Enumeration files = multi.getFileNames();	// form에서 input type이 file인 태그의 name의 값
			while(files.hasMoreElements()){	
				String file1 = (String) files.nextElement(); // form input태그 name
				fileName1 = multi.getFilesystemName(file1); // 중복처리
				
				vo.setTccode(code);
				vo.setCpname(cpname);
				vo.setCpurl(cpurl);
				vo.setTcname(tcname);
				vo.setTcintro(tcintro);
				vo.setTcurl(tcurl);
				vo.setTccall(tccall);
				vo.setTcdate(Date.valueOf(tcdate));
				vo.setTcphoto(fileName1);
				state = dao.updateCampaign(vo);
			}
			if(state > 0) out.println("<script>alert('캠페인 수정에 성공하였습니다.'); location.replace('campaignList.jsp');</script>");
			else out.println("<script>alert('캠페인 수정 실패. 다시 시도해주세요.'); location.replace('updateCorporation.jsp?name='"+ Integer.parseInt(multi.getParameter("code"))+");</script>");			
		}catch (Exception e){
			e.printStackTrace();
			out.println("<script>alert('파일을 올리지 못하였습니다.'); location.replace('updateCorporation.jsp');</script>");
		}
		
		
	%>
