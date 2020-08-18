<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  
</script>

<div id="center">
<h3>주문할 메뉴 선택</h3>
<table>
	<c:forEach var="p" items="${poslist }">
		<tr>
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
		<a href="basketupdate?name=${s.name }&cnt=55&func=plus">더하기</a>
		<a href="basketupdate?name=${s.name }&cnt=55&func=minus">빼기</a></td>
	</tr>
</c:forEach>
</table>



<table>
<form name="form" method="get">
수량 : <input type=hidden name="sell_price" value="5500">
<input type="text" name="amount" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
</form>
</table>

</div>