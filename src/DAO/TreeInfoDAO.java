package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.TreeInfoVO;
import conn.JDBCConn;

public class TreeInfoDAO {
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private static TreeInfoDAO instance = new TreeInfoDAO();
	// 싱글턴
	public static TreeInfoDAO getInstance() {
		if(instance == null)
			instance = new TreeInfoDAO();
		return instance;
	}
	

	public ArrayList<TreeInfoVO> getTreeInfoList(){
		ArrayList<TreeInfoVO> list = null;
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("select treename from treeinfo order by treename");
			rs = stmt.executeQuery();
			list = new ArrayList<TreeInfoVO>();
			while(rs.next()) {
				TreeInfoVO vo = new TreeInfoVO();
				vo.setTreename(rs.getString("treename"));
				
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("treeList 가져오다 오류");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		return list;
	}
	
	public TreeInfoVO getTreeInfo(String name){
		TreeInfoVO info = null;
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("select * from treeinfo where treename = ?");
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			info = new TreeInfoVO();
			if(rs.next()) {
				info.setTreename(rs.getString("treename"));
				info.setTreelife(rs.getString("treelife"));
				info.setTreePoint(rs.getString("treepoint"));
				info.setTreePhoto(rs.getString("treePhoto"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("treeInfo 가져오다 오류");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		return info;
	}
	
	public int addTree(TreeInfoVO vo) {
		int cnt = 0;
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("insert into treeinfo values(?,?,?,?)");
			stmt.setString(1, vo.getTreename());
			stmt.setString(2, vo.getTreelife());
			stmt.setString(3, vo.getTreePoint());
			stmt.setString(4, vo.getTreePhoto());
			
			cnt = stmt.executeUpdate();
			if(cnt < 0)
				conn.rollback();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("tree 등록하다 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		
		return cnt;
	}
	
}
