<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<div id="center">
	<h2>${pos.name}</h2>
	<h2>${pos.stock}</h2>
	<h2>${pos.price}</h2>
	<h2>${pos.img}</h2>
	<h3>
		<a href='deleteMenu?name="${pos.name}"'>Delete</a>
	</h3>
	<h3>
		<a href="updateMenu?name='${pos.name}'">Update</a>
	</h3>
</div>