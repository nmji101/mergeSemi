package ncs.kh.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import ncs.kh.DTO.DTO;

public class DAO {
	DTO dto = new DTO();
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String pw = "kh";
		return DriverManager.getConnection(url,user,pw);
	}
	
	public int insert(DTO dto) throws Exception{//클래스 등록
//                                                                  클래스id,     소개, 카테,우편,도로,지번,상세,인원,금액,제목,시작,끝,설명
		String sql = "insert into classinfo values(info_classid_seq.nextval ,  ?   ,   ?   , ? ,   ?   ,  ?  ,   ?   ,  ?  ,  ?  ,  ?  ,  ?  ,  ? ,   ?   )";
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setInt(1, dto.getInfo_classid_seq()); //클래스아이디
		pstat.setString(2, dto.getIntro());//튜터소개
		pstat.setString(3, dto.getCategory());//카테고리
		pstat.setInt(4, dto.getAddr1());//우편번호
		pstat.setString(5, dto.getAddr2());//도로명
		pstat.setString(6, dto.getAddr3());//지번
		pstat.setString(7, dto.getAddr4());//상세
	    pstat.setInt(8, dto.getMaxperson());//희망인원
	    pstat.setInt(9, dto.getPrice());//희망금액
	    pstat.setString(10, dto.getTitle());//제목입력
	    pstat.setString(11, dto.getStart());//시작날짜
	    pstat.setString(12, dto.getEnd());//끝날짜
	    pstat.setString(13, dto.getExplain());//클래스 설명
		
		int result = pstat.executeUpdate();
		con.close();
		con.commit();
	    return result;
	}
	
	public int test(String intro, String category, int add1, String add2, String add3, String add4,int max,int cash,String start, String end, String explain) 
			throws Exception{
		String sql = "insert into classinfo values(info_classid_seq.nextval , ?, ? ,? ,? ,? ,?,?,?,?,?,?)";
		Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1,intro);//튜터소개, 인자값
		pstat.setString(2,category);//카테고리
		pstat.setInt(3, add1);
		pstat.setString(4, add2);
		pstat.setString(5, add3);
		pstat.setString(6, add4);
		pstat.setInt(7, max);
		pstat.setInt(8, cash);
		pstat.setString(9, start);
		pstat.setString(10, end);
		pstat.setString(11, explain);
		
		int result = pstat.executeUpdate();
		con.commit();
		con.close();
		return result;
		
	}
}
