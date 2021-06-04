package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


import VO.CampaignVO;
import VO.CorporationVO;
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
	
	public int updateCampaignState(ArrayList<CampaignVO> voList) {
		int state = 0;
		
		try {
			SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
			
			String format_time1 = format1.format (System.currentTimeMillis());
			 
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("update TREECAMPAIGN set tcstate=? where tccode =?");
			for(int i = 0; i < voList.size(); i++) {
				int compare = voList.get(i).getTcdate().compareTo(Date.valueOf(format_time1));
				if(compare > 0)	stmt.setInt(1, 1);
				else	
					stmt.setInt(1, -1);
				stmt.setInt(2, voList.get(i).getTccode());
				state = stmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("캠페인 상태에서 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		return state;
	}
	
	public ArrayList<CampaignVO> getCampaignList(){
		ArrayList<CampaignVO> list = null;
		
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("select * from treecampaign");
			rs = stmt.executeQuery();
			list = new ArrayList<CampaignVO>();
			while(rs.next()) {
				CampaignVO vo = new CampaignVO();
				vo.setTccode(rs.getInt("tccode"));
				vo.setCpname(rs.getString("cpname"));
				vo.setCpurl(rs.getString("cpurl"));
				vo.setTcname(rs.getString("tcname"));
				vo.setTcintro(rs.getString("tcintro"));
				vo.setTcurl(rs.getString("tcurl"));
				vo.setTccall(rs.getString("tccall"));
				vo.setTcdate(rs.getDate("tcdate"));
				vo.setTcphoto(rs.getString("tcphoto"));
				if(rs.getInt("tcstate") == 0)
					vo.setTcstate("마감");
				else if(rs.getInt("tcstate") == 1)
					vo.setTcstate("모집");
				else if(rs.getInt("tcstate") == 2)
					vo.setTcstate("예약");
				else if(rs.getInt("tcstate") == -1)
					vo.setTcstate("종료");
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("캠페인 리스트 가져오다 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		
		return list;
		
	}
	
	
	public int updateTree(String treename, TreeInfoVO vo) {
		int state = 0;
		
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("update treeinfo set treename=?, treelife=?, treepoint=?, treephoto=? where treename=?");
			stmt.setString(1, vo.getTreename());
			stmt.setString(2, vo.getTreelife());
			stmt.setString(3, vo.getTreePoint());
			stmt.setString(4, vo.getTreePhoto());
			stmt.setString(5, treename);
			state = stmt.executeUpdate();
			System.out.println(vo);
			if(state > 0)
				conn.commit();
			else
				conn.rollback();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("나무정보 수정하다 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		
		return state;
	}
	
	public int deleteTree(String name) {
		int state = 0;
		
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("delete treeinfo where treename=?");
			stmt.setString(1, name);
			state = stmt.executeUpdate();
			if(state > 0)
				conn.commit();
			else
				conn.rollback();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("나무 삭제하다 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		
		return state;
	}
	
	public ArrayList<CorporationVO> getCorporationList(){
		ArrayList<CorporationVO> list = null;
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("select * from treecorporation");
			rs = stmt.executeQuery();
			list = new ArrayList<CorporationVO>();
			while(rs.next()) {
				CorporationVO vo = new CorporationVO();
				vo.setCpname(rs.getString("cpname"));
				vo.setCpurl(rs.getString("cpurl"));
				vo.setCpintro(rs.getString("cpintro"));
				vo.setCpphoto(rs.getString("cpphoto"));
				vo.setCpcall(rs.getString("cpcall"));
				
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("기업 정보 가져오다 오류남");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		return list;
	}
	
	public int addCampaign(CampaignVO vo) {
		int state = 0;
		
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("select nvl(max(tccode),0)+1 tccode from treecampaign");
			rs = stmt.executeQuery();
			int max = 0;
			if(rs.next())
				max = rs.getInt("tccode");
			
			stmt = conn.prepareStatement("insert into treecampaign values(?,?,?,?,?,?,?,?,?,?)");
			stmt.setInt(1, max);
			stmt.setString(2, vo.getCpname());
			stmt.setString(3, vo.getCpurl());
			stmt.setString(4, vo.getTcname());
			stmt.setString(5, vo.getTcintro());
			stmt.setString(6, vo.getTcurl());
			stmt.setString(7, vo.getTccall());
			stmt.setDate(8, vo.getTcdate());
			stmt.setInt(9, 0);
			stmt.setString(10, vo.getTcphoto());
			state = stmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("캠페인 등록에서 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		return state;
	}
	
	public int deleteCampaign(int code) {
		int state = 0;
		
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("delete treecampaign where tccode=?");
			stmt.setInt(1, code);
			state = stmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("캠페인 삭제하다 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		
		return state;
	}
	
	public CampaignVO getCampaignInfo(int code){
		CampaignVO info = null;
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("select * from treecampaign where tccode = ?");
			stmt.setInt(1, code);
			rs = stmt.executeQuery();
			info = new CampaignVO();
			if(rs.next()) {
				info.setTccode(rs.getInt("tccode"));
				info.setCpname(rs.getString("cpname"));
				info.setCpurl(rs.getString("cpurl"));
				info.setTcname(rs.getString("tcname"));
				info.setTcintro(rs.getString("tcintro"));
				info.setTcurl(rs.getString("tcurl"));
				info.setTccall(rs.getString("tccall"));
				info.setTcdate(rs.getDate("tcdate"));
				info.setTcstate(rs.getString("tcstate"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("캠페인정보 가져오다 오류");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		return info;
	}
	
	public int updateCampaign(CampaignVO vo) {
		int state = 0;
		try{
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("update treecampaign set cpname=?, cpurl=?, tcname=?, tcintro=?, tcurl=?, tccall=?, tcdate=? where tccode=?");
			stmt.setString(1, vo.getCpname());
			stmt.setString(2, vo.getCpurl());
			stmt.setString(3, vo.getTcname());
			stmt.setString(4, vo.getTcintro());
			stmt.setString(5, vo.getTcurl());
			stmt.setString(6, vo.getTccall());
			stmt.setDate(7, vo.getTcdate());
			stmt.setInt(8, vo.getTccode());
			state = stmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("캠페인 수정하다 오류남.");
		}
		return state;
	}
	
	public int addCorporation(CorporationVO vo) {
		int cnt = 0;
		try {
			conn = JDBCConn.getC();
			stmt = conn.prepareStatement("insert into treecorporation values(?,?,?,?,?)");
			stmt.setString(1, vo.getCpname());
			stmt.setString(2, vo.getCpurl());
			stmt.setString(3, vo.getCpintro());
			stmt.setString(4, vo.getCpphoto());
			stmt.setString(5, vo.getCpcall());
			
			cnt = stmt.executeUpdate();
			if(cnt < 0)
				conn.rollback();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("corporation 등록하다 오류남.");
		}finally {
			JDBCConn.closeDB(conn, rs, stmt);
		}
		
		return cnt;
	
	}
	
}
