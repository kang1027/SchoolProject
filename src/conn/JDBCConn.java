package conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCConn {
	//커넥션풀
		public static Connection getC() throws Exception {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
			Connection conn = ds.getConnection();
			return conn;
		}
		//DB끊기
		public static void closeDB(Connection conn, ResultSet rs, PreparedStatement stmt) {
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
}
