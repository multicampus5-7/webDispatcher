<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<div id="center">
	<form action="updateMenuImp.mc" method="post">
		<h2>이름 : ${pos.name}</h2>
		<h2>
			재고: <input type="text" name="stock" value="${pos.stock}">
		</h2>
		<h2>
			가격: <input type="text" name="price" value="${pos.price}">
		</h2>
		<h2>
			이미지: <input type="text" name="img" value="${pos.img}">
		</h2>
		<input type="hidden" name="name" value="${pos.name}"> <input
			type="submit" value="update">
	</form>
</div>