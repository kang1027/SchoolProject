package conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class jdbcConn {
	public static Connection getC() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
	}
}
