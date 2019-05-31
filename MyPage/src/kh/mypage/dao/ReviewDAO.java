package kh.mypage.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO
{
private DataSource ds;
	
	public ReviewDAO() throws Exception
	{
		Context ctx = new InitialContext();
		Context compenv = (Context)ctx.lookup("java:/comp/env");
		this.ds = (DataSource)compenv.lookup("jdbc");
	}
	
	public Connection getConnection() throws Exception
	{
		return ds.getConnection();
	}
	
	public int insertReview(String c_id, String m_id, String contents, String star, Date date) throws Exception
	{
		String sql = "insert into REVIEW values(re_seq_seq.nextval, ?, ?, ?, ?, ?, default, default, default)";
		try
		(
			Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
		)
		{
			pstat.setString(1, c_id);
			pstat.setString(2, m_id);
			pstat.setString(3, contents);
			pstat.setString(4, star);
			pstat.setDate(5, date);
			
			int result = pstat.executeUpdate();
			con.commit();
			
			return result;
		}
	}
}
