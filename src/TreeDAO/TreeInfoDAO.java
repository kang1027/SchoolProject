package TreeDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import TreeVO.TreeInfoVO;

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
	//커넥션풀
	private static Connection getC() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		Connection conn = ds.getConnection();
		return conn;
	}
	//DB끊기
	private void closeDB() {
		try {
			if(conn != null)
				conn.close();
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}catch (Exception e) {
			System.out.println("DB연결 끊다 오류남.");
		}
	}

	public ArrayList<TreeInfoVO> getTreeInfoList(){
		ArrayList<TreeInfoVO> list = null;
		try {
			conn = getC();
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
			closeDB();
		}
		return list;
	}
	
	public TreeInfoVO getTreeInfo(String name){
		TreeInfoVO info = null;
		try {
			conn = getC();
			stmt = conn.prepareStatement("select treename, treelife, treepoint from treeinfo where treename = ?");
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			info = new TreeInfoVO();
			if(rs.next()) {
				info.setTreename(rs.getString("treename"));
				info.setTreelife(rs.getString("treelife"));
				info.setTreePoint(rs.getString("treepoint"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("treeInfo 가져오다 오류");
		}finally {
			closeDB();
		}
		return info;
	}
	
	public int addTree(TreeInfoVO vo) {
		
		int cnt = 0;
		try {
			conn = getC();
			stmt = conn.prepareStatement("insert into treeinfo(treename, treelife, treepoint) values(?,?,?)");
			stmt.setString(1, vo.getTreename());
			stmt.setString(2, vo.getTreelife());
			stmt.setString(3, vo.getTreePoint());
			cnt = stmt.executeUpdate();
			if(cnt > 0)
				conn.commit();
			else
				conn.rollback();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("tree 등록하다 오류남.");
		}
		
		return cnt;
	}
	
}
