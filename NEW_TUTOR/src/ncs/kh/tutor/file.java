package ncs.kh.tutor;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ncs.kh.DAO.UfileDAO;
import ncs.kh.DTO.UfileDTO;


@WebServlet("*.file")
public class file extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqUri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqUri.substring(ctxPath.length());

		UfileDAO dao = new UfileDAO();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
		String time = sdf.format(date);
		
		if(cmd.equals("/upload.file")) {
			String rootPath = request.getServletContext().getRealPath("/");
			String filePath = rootPath + "files" ; //files는 본 저장소이며 임시저장소가 아니다
			String filePath2 = filePath + "/"+time;

			System.out.println(rootPath); //파일업로드 경로
			File uploadPath = new File(filePath2);
			if(!uploadPath.exists()) {//해당 폴더가 존재하지 않는다면 mkdir로 만들어라
				uploadPath.mkdir();
			}
			DiskFileItemFactory diskFactory = new DiskFileItemFactory();
			diskFactory.setRepository(new File(rootPath + "/WEB-INF/tmp")); 
			// 업로드 되는 파일들을 여기에 복사해줄게 . 경로 지정 안하면 이상한 폴더에 저장 됨
			ServletFileUpload sfu = new ServletFileUpload(diskFactory);
			sfu.setSizeMax(10 * 1024 * 1024);//업로드 파일사이즈 통제. 10메가(단위는 1바이트)
			try {
				List<FileItem> items = sfu.parseRequest(request);//넘어온 리퀘스트를 분석한다. 리턴값은 List
				for(FileItem fi : items) {
					if(fi.getSize() == 0) {continue;}//파일사이즈가 0이면 for-each문 끊기
					
					if(fi.isFormField()) {//파일인지 아닌지 검사. 파일이 아닌데(텍스트같은) parameter로 받은 건 if문으로 돌리고
						String paramString = new String(fi.getString().getBytes("ISO-8859-1"), "utf8") ;
						System.out.println(fi.getFieldName() + " : " + paramString);
						//파일과 텍스트 한번에 넘기기. 0521 추가내용
					}else {
					UfileDTO dto = new UfileDTO(); //파일 하나당 dto가 하나 와야 함
					dto.setOriFileName(fi.getName());//클라가 보낸 파일 이름(origin file)은 fi이다. 클라가 받을 진짜 이름
					dto.setFileSize(fi.getSize());
					dto.setFilePath(filePath2);
					String tempFileName = null;//서버에서 저장하려고 만든 임시 이름
					while(true) {
						try {
							long tempTime = System.currentTimeMillis();
							tempFileName = tempTime+"_"+fi.getName();//이미지 올릴 때 대괄호 삭제
							fi.write(new File(filePath2+"/"+tempFileName));
							dto.setServerFileName(tempFileName);
							break;
						}catch(Exception e) {
							e.printStackTrace();
						}
					}
		
					response.setCharacterEncoding("utf8");
					response.getWriter().append("files/" +time + "/"+dto.getServerFileName());//이걸 받은 ajax 클라는 콘솔에 출력한다
					//time이라는 폴더를 추가했으므로 append 경로도 추가해야 한다
					int result = dao.insert(dto);
					
				}//사진이 등록되는 else문
				}
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
		}else if(cmd.equals("/filelist.file")) {
			try {
				List<UfileDTO> fileList = dao.selectAll();
				request.setAttribute("filelist", fileList);
				request.getRequestDispatcher("filelist.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
		}else if(cmd.equals("/download.file")) {
			try {
				int seq = Integer.parseInt(request.getParameter("seq"));
				//DAO에서 해당 파일의 정보 하나만 꺼내오기 = 리스트가 아니다
				UfileDTO dto = dao.selectBySeq(seq);
				
				response.reset();//리스트 설정 초기화
				response.setContentType("application/octet-stream");
				//내가 보내려는건 파일의 '바이트배열'이라는걸 명시하는 단계
				String fileName = new String(dto.getOriFileName().getBytes("utf8"),"ISO-8859-1");
				//한글 깨짐 방지 처리
				response.setHeader
				("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
				//header에 키와 밸류 셋팅
				
				response.setHeader("Content-Length", String.valueOf(dto.getFileSize()));
				
				File target = new File(dto.getFilePath()+"/"+dto.getServerFileName());
				//대상 파일을 인스턴스로 만들기
				// 클라에 보여줄 이름이 아니라 서버에서 꺼내올 이름
				byte[] fileContents = new byte[(int)target.length()];
				
				try(//데이터스트림 만들기
						DataInputStream fromFile = 
							new DataInputStream(new FileInputStream(target));
						DataOutputStream toClient =//클라에게 보내는 아웃풋스트림
							new DataOutputStream(response.getOutputStream());
						){
					fromFile.readFully(fileContents);
					toClient.write(fileContents);
					toClient.flush();//파일 내보내기
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
		}
		
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}





