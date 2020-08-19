<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="center">
<br><h2>주문할 메뉴 선택</h2><br>
<div id="posL">
<table>
	<tr height=30px>
		<th>메뉴</th>	<th>주문가능수량</th> <th>가격</th> <th></th>
	</tr>
	<c:forEach var="p" items="${poslist }">
	<tr height=80px>
		<td>${p.name}</td>  
		<td>${p.stock}</td>  
		<td>${p.price}</td>
		<td><a href=""><img src=img/${p.img}></a></td>
	</tr>
	</c:forEach>
</table>
</div>

<div id="posR">
<table>
	<tr height=30px><th>주문수량</th></tr>
	<c:forEach var="s" items="${saleslist }">
	<tr height=80px>
		<td><a href="basketupdate?name=${s.name }&func=minus">- </a>
		${s.amount} 
		<a href="basketupdate?name=${s.name }&func=plus"> +</a>
		</td>
	</tr>
	</c:forEach>
</table>
</div>

<div id="pospay">
<a href="pay.mc"><h1>PAY</h1></a>
</div>

</div>