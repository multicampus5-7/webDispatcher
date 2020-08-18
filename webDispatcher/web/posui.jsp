<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div id="center">
<h1>POS SYSTEM</h1>

<table>
	<c:forEach var="u" items="${userlist }">
		<tr>
			<td><a href="userdetail?id=${u.id }">${u.id }</a></td>  
			<td>${u.pwd }</td>  
			<td>${u.name }</td>
			<td><a href="userdetail?id=${u.id }">
					<button type="submit" value=${u.id }>상세보기</button></a>
				<a href="userupdate?id=${u.id }">
					<button type="submit" id="">수정</button></a>
				<a href="userdelete?id=${u.id }">
					<button type="submit" id="">삭제</button></a>
			</td>
		</tr>
	</c:forEach>
</table>


<div id="product"></div>
<h2>TOTAL:<span id="total"></span></h2>
<div id="cart"></div>
<h2>CHARGE:<span id="status"></span></h2>
<div id="charge">
	<button id="pay">PAY</button>
	<button id="admin">ADMIN</button>
	<button id="reset">RESET</button>
</div>
<h2>RECEIPT:</h2>
<div id="receipt" style="width: 100%; height: auto; border: 2px solid gray;"></div>
<div id="map" style="width: 100%; height: 600px; border: 2px solid blue;"></div>
</div>