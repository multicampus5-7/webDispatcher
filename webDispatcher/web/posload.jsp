<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="center">
<h3>주문할 메뉴 선택</h3>
<table>
	<tr>
		<td>메뉴</td>	<td>주문가능수량</td> <td>가격</td> <td></td>
	</tr>
		<c:forEach var="p" items="${poslist }">
			<td>${p.name}</td>  
			<td>${p.stock}</td>  
			<td>${p.price }</td>
			<td><a href=""><img src=img/${p.img}></a></td>
		</tr>
	</c:forEach>
</table>
<table>

<c:forEach var="s" items="${saleslist }">
	<tr>
		<td>${s.amount} 
		<a href="basketupdate?name=${s.name }&func=plus">더하기</a>
		<a href="basketupdate?name=${s.name }&func=minus">빼기</a></td>
	</tr>
</c:forEach>
</table>

<h1><a href="pay.mc">PAY</a></h1>

</div>