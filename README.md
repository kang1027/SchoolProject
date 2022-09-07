# 제작 이유
무차별적인 벌목과 지역개발로인하여 점점 파괴되는 산림을 보존하고 싶어 만들었다.<br>
나무를 심기 위해 힘쓰는 기업들과 여러 나무심기 캠페인들을 모아놓는 사이트를 찾기 힘들어서 직접 만들어 여러 사람들에게 알려주고 싶어 만들었다.

# 코드사용 시
Tttipy 프로젝트는 커넥션풀을 사용해 사용 서버의 context.xml 파일에<br>
        <Resource<br>
        name="jdbc/oracle"<br>
        auth="Container"<br>
        type="javax.sql.DataSource"<br>
        driverClassName="oracle.jdbc.OracleDriver"<br>
        url="jdbc:oracle:thin:@localhost:1521:XE"<br>
        username="ttipy"<br>
        password="k2167512##"<br>
        maxActive="50"<br>
        maxWait="-1"><br><br>

코드 추가 필요.
<br>
실행 시 JDBC 드라이버 연결이 안 되면 JDBCConn.java파일 getC함수코드 아래로 수정 후 실행<br>
<br>
public static Connection getC() throws Exception {<br>
			Context init = new InitialContext();<br>
			Context envContext = (Context) init.lookup("java:/comp/env");<br>
            DataSource ds = (DataSource) envContext.lookup("jdbc/oracle");<br>
			Connection conn = ds.getConnection();<br>
			return conn;<br>
		}<br><br>
    

# ERD
https://www.erdcloud.com/d/dH7pTQZrWXHaJJzfA

