<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="center">
<br><h3>PAY complete</h3><br><br>
<div id="paycomplete">
<table>
	<tr height=30px>
		<th>메뉴</th>	<th>수량</th> <th>금액</th>
	</tr>
	<c:forEach var="t" items="${totallist }">
	<tr>
		<td>${t.name}</td>  
		<td>${t.amount}</td>  
		<td>${t.price}</td>
	</tr>
	</c:forEach>
	<tr><td colspan="3">-----------------</td></tr>
	<tr>
		<th colspan="3">합계 : ${totalprice }</th>
	</tr>
</table>
</div>

<br><a href="posload.mc">다시 주문하기</a><br>
</div>