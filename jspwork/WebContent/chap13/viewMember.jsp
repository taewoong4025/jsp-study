<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
	<!-- Oralce sql에서는 commit 필수! -->
	
<%!Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pwd = "tiger";
	String sql = "select * from member2";%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="400" border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>등급</td>
			<td>전화번호</td>
		</tr>
		<%
			try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td>
				<%
				int n_class = rs.getInt("class");
				if (n_class == 1) {
					out.print("일반회원");
				} else {
					out.print("교수님");
				}
				%>
			</td>
			<td><%=rs.getString("tel")%></td>
		</tr>
		<%
			}
		} catch (SQLException se) {
		se.printStackTrace();
		}finally{
			try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}	
		}
		%>
	</table>
</body>
</html>