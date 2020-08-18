<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div id="center">
<h1>POS SYSTEM</h1>

<table>
	<c:forEach var="p" items="${poslist }">
		<tr>
			<td>${p.name }</td>  
			<td>${p.stock }</td>  
			<td>${p.price }</td>
			<td><img src=img/${p.img}></td>
		</tr>
	</c:forEach>
</table>

</div>