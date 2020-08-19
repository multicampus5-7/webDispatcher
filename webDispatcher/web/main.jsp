<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

header {
	width: 700px;
	height: 100px;
	background: #D0D0D0;
	margin: 0 auto;
}

header>h1 {
	margin: 0 auto;
	width: 200px;
}

header>ul {
	margin: 0 auto;
	width: 500px;
	list-style: none;
}

header>ul>li {
	float: left;
	margin: 0 10px;
}

section {
	width: 700px;
	background: gray;
	margin: 0 auto;
}

section>#center {
	width: 500px;
	background: white;
	margin: 0 auto;
	text-align: center;
}

footer {
	width: 700px;
	height: 30px;
	background: #D0D0D0;
	margin: 0 auto;
}

a { 
	text-decoration: none;
	font-weight: bolder;
	font-size: 120%;
} 

#product {
	width: 100%;
	height: 200px;
	border: 2px solid blue;
}

#cart {
	width: 100%;
	height: 200px;
	border: 2px solid red;
	overflow: auto;
}

#charge {
	width: fit-content;
	height: auto;
	border: 2px solid orange;
}

img {
	width: 100px;
}

#posL{
	width: 70%;
	height: 500px;
	float: left;
}
#posL>table{
	width: 100%;
	height: 100%;
}
#posR{
	width: 30%;
	height: 500px;
	float: right;
}
#posR>table{
	width: 100%;
	height: 100%;
}

#pospay{
	width: 100%;
}
#paycomplete{
	text-align:center;
}
#paycomplete>table{
	float: center;
	margin:0 auto;
	padding: 10px;
	background: #F0F0F0;
}
</style>
</head>

<body>
	<header>
		<h1>POS SYSTEM</h1>
		<ul>
			<li><a href="main.mc">MAIN</a></li>
			<li><a href="admin.mc">ADMIN</a></li>
			<li><a href="map.mc">MAP</a></li>
		</ul>


	</header>
	<section>
		<c:choose>
			<c:when test="${centerpage == null }">
				<jsp:include page="center.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="${centerpage}.jsp"></jsp:include>
			</c:otherwise>
		</c:choose>


	</section>
	<footer></footer>
</body>
</html>






