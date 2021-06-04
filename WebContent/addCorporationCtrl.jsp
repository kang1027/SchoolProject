<%@page import="VO.CorporationVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	
	String uploadPath = request.getRealPath("/uploadCorporation/");
	int maxSize = 1024 * 1024 * 10;
	String fileName1 = "";
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

	CorporationVO vo = new CorporationVO();
	TreeInfoDAO dao = new TreeInfoDAO();
	int cnt = 0;
	vo.setCpname(multi.getParameter("cpname"));
	vo.setCpurl(multi.getParameter("cpurl"));
	vo.setCpintro(multi.getParameter("cpintro"));
	vo.setCpcall(multi.getParameter("cpcall"));
	try{
		Enumeration files = multi.getFileNames();	// form에서 input type이 file인 태그의 name의 값
		while(files.hasMoreElements()){	
			String file1 = (String) files.nextElement(); // form input태그 name
			fileName1 = multi.getFilesystemName(file1); // 중복처리
			vo.setCpphoto(fileName1);
			cnt = dao.addCorporation(vo);
		}
		if(cnt > 0) out.println("<script>alert('기업정보 등록에 성공하였습니다.'); location.replace('corporationList.jsp');</script>");
		else out.println("<script>alert('기업정보 등록 실패. 다시 시도해주세요.'); location.replace('addCorporation.jsp');</script>");			
	}catch (Exception e){
		e.printStackTrace();
		out.println("<script>alert('파일을 올리지 못하였습니다.'); location.replace('addCorporation.jsp');</script>");
	}
%>