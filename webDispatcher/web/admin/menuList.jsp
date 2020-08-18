<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<div id="center">
	<h1>menu control</h1>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>재고</th>
				<th>가격</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="menu" items="${menulist }">
				<tr>
					<td><a href="selectMenu?name='${menu.name}'">${menu.name}</a></td>
					<td>${menu.stock}</td>
					<td>${menu.price}</td>
					<td>${menu.img }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>