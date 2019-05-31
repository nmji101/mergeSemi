package kh.semi.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.semi.dto.MemberDTO;

public class MemberDAO
{
	private DataSource ds;
	
	public MemberDAO() throws Exception
	{
		Context ctx = new InitialContext();
		Context compenv = (Context)ctx.lookup("java:/comp/env");
		this.ds = (DataSource)compenv.lookup("jdbc");
	}
	
	public Connection getConnection() throws Exception
	{
		return ds.getConnection();
	}
	
	public boolean kakaoLoginCheck(String id) throws Exception
	{
		String sql = "SELECT * FROM MEMBER WHERE M_ID = ?";
		try(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setString(1, id);
			try(
				ResultSet rs = pstat.executeQuery();
			)
			{
				return rs.next();
			}
		}
	}
	
	public int kakaoSignUp(MemberDTO dto) throws Exception
	{
		String sql = "INSERT INTO MEMBER(m_id,m_password,m_nickname,m_gender,m_agerange,m_monthday,m_type) " + "VALUES (?,?,?,?,?,?,'normal')";
		try(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setString(1, dto.getM_id());
			pstat.setString(2, dto.getM_password());
			pstat.setString(3, dto.getM_nickname());
			pstat.setString(4, dto.getM_gender());
			pstat.setString(5, dto.getM_agerange());
			pstat.setString(6, dto.getM_monthday());
			
			int result = pstat.executeUpdate();
			con.commit();
			
			return result;
		}
	}
	
	public boolean emailLoginCheck(String id, String pw) throws Exception
	{
		String sql = "select * from member where m_id = ? and m_password = ?";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstet = con.prepareStatement(sql);
		)
		{
			pstet.setString(1, id);
			pstet.setString(2, pw);
			
			ResultSet rs = pstet.executeQuery();
			return rs.next();
		}
	}
	
	public String toSha256(String str)
	{
		String SHA = "";
		try
		{
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for(int i = 0 ; i < byteData.length ; i ++ )
			{
				sb.append(Integer.toString( ( byteData[i] & 0xff ) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		}catch(NoSuchAlgorithmException e)
		{
			e.printStackTrace();
			SHA = null;
		}
		return SHA;
	}
}
