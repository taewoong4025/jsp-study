<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%! String makeItLower(String data){
	return data.toLowerCase();
}
	%>
	<%out.print(makeItLower("HELLo WoRld")); %>
</body>
</html>