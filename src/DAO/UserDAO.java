package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.UserVO;
import conn.JDBCConn;

public class UserDAO {
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	
	private static UserDAO instance;
	public static UserDAO getInstance() {
		if(instance == null)
			instance = new UserDAO();
		return instance;
			
	}
	
	public int addUser(UserVO vo) {
		int cnt = 0;
		try {
			System.out.println(vo);
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("insert into userinfo values(?,?,?,?,?)" );
			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getUserpw());
			stmt.setString(3, vo.getUserName());
			stmt.setString(4, vo.getUsergender());
			stmt.setString(5, vo.getUsernickname());
			cnt = stmt.executeUpdate();
			if(cnt > 0)
				conn.commit();
			else
				conn.rollback();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("유저 등록에서 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		
		return cnt;
	}
	public int idDoubleCheck(String id) {
		int state = 0;   // 0 → 있음.(가입불가) 1 → 없음.(가입가능) 
		
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("select * from userinfo where userid=?");
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(!rs.next())
				state = 1;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("아이디 중복확인 검증에서 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		
		return state;
	}
}
