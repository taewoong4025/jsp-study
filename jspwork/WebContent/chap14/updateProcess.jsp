<%@page import="myUtil.HanConv"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!Connection conn = null;
	PreparedStatement pstmt = null;
	DataSource ds = null;%>

	<%
		try {
		/* Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection(); */
		// 세줄을 한 번에 처리↓↓↓↓

		conn = ((DataSource) (new InitialContext().lookup("java:comp/env/jdbcoracle"))).getConnection();

	} catch (NamingException ne) {
		ne.printStackTrace();
	} catch (SQLException se) {
		se.printStackTrace();
	}

	String id = "", name = "", vclass = "", tel = "";

	id = request.getParameter("id");
	name = request.getParameter("name");
	vclass = request.getParameter("mclass");
	tel = request.getParameter("tel");

	StringBuffer updateQuery = new StringBuffer();
	updateQuery.append("update member2 set name=?, class=? , tel=? where id =?");

	try {
		pstmt = conn.prepareStatement(updateQuery.toString());
		pstmt.setString(1, HanConv.toKor(name));
		pstmt.setInt(2, Integer.parseInt(vclass));
		pstmt.setString(3, tel);
		pstmt.setString(4, id);
		int re = pstmt.executeUpdate(); // 정상적으로 업데이트되면 1을 리턴

		if (re == 1) {
	%>
	<%=id%>의 정보가 수정 되었습니다.
	<br> [<a href="viewMember.jsp">목록보기</a>]
	<%
		} else {
	%>
	변경 실패.
	<%
		}
	} catch (SQLException se) {
	se.printStackTrace();
	%>
	서버 불량 잠시 후 다시 시도
	<%
		}
	%>
</body>
</html>