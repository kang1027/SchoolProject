# Why I development this project.

It wanted to preserve forests that were increasingly destroyed by indiscriminate logging and regional development.<br>
And it was hard to find a site that collects companies working hard to plant trees and various tree planting campaigns, so I wanted to make it myself and let people know.

# If you use this code
Ttipy project is using connection pull and and you should've update your context.xml file of your using server
<br>
        <Resource<br>
        name="jdbc/oracle"<br>
        auth="Container"<br>
        type="javax.sql.DataSource"<br>
        driverClassName="oracle.jdbc.OracleDriver"<br>
        url="jdbc:oracle:thin:@localhost:1521:XE"<br>
        username="scott"<br>
        password="tiger"<br>
        maxActive="50"<br>
        maxWait="-1" /><br><br>


<br>
If you when running this code, not connecting JDBC driver, you should update getC() function and run.
If the JDBC driver does not connect at runtime, you should update getC() function with the code below.<br>

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

