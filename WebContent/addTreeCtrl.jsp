<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@page import="VO.TreeInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	
	String uploadPath = request.getRealPath("/uploadImage/");
	int maxSize = 1024 * 1024 * 10;
	String fileName1 = "";
	String originalName1 = "";
	long fileSize = 0;
	String fileType = "";
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

	TreeInfoVO vo = new TreeInfoVO();
	TreeInfoDAO dao = new TreeInfoDAO();
	int cnt = 0;
	
	try{
		Enumeration files = multi.getFileNames();	// form에서 input type이 file인 태그의 name의 값
		while(files.hasMoreElements()){	
			String file1 = (String) files.nextElement(); // form input태그 name
			originalName1 = multi.getOriginalFileName(file1); // 실제 파일 이름
			fileName1 = multi.getFilesystemName(file1); // 중복처리
			fileType = multi.getContentType(file1);	// 파일 타입 정보
			File file = multi.getFile(file1); // 실제 파일 
			fileSize = file.length(); // 파일 크기
			
			vo.setTreename(multi.getParameter("treename"));
			vo.setTreelife(multi.getParameter("treelife"));
			vo.setTreePoint(multi.getParameter("treepoint"));
			vo.setTreeintro(multi.getParameter("treeintro"));
			vo.setTreearea(multi.getParameter("treearea"));
			vo.setTreeclass1(multi.getParameter("treeclass1"));
			vo.setTreeclass2(multi.getParameter("treeclass2"));
			vo.setTreeclass3(multi.getParameter("treeclass3"));
			vo.setTreeclass4(multi.getParameter("treeclass4"));
			vo.setTreeclass5(multi.getParameter("treeclass5"));
			vo.setTreeclass6(multi.getParameter("treeclass6"));
			vo.setTreeclass7(multi.getParameter("treeclass7"));
			vo.setTreeclass7(multi.getParameter("treeclass7"));
			vo.setTreePhoto(fileName1);
			cnt = dao.addTree(vo);
		}
		if(cnt > 0) out.println("<script>alert('나무정보 등록에 성공하였습니다.'); location.replace('treeInfoList.jsp');</script>");
		else out.println("<script>alert('나무정보 등록 실패. 다시 시도해주세요.'); location.replace('addTree.jsp');</script>");			
	}catch (Exception e){
		e.printStackTrace();
		out.println("<script>alert('파일을 올리지 못하였습니다.'); location.replace('addTree.jsp');</script>");
	}
%>