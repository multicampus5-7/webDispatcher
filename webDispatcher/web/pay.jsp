<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="center">
<br><h3>PAY complete</h3><br><br>
<div id="paycomplete">
<table>
	<tr height=30px>
		<th>�޴�</th>	<th>����</th> <th>�ݾ�</th>
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
		<th colspan="3">�հ� : ${totalprice }</th>
	</tr>
</table>
</div>

<br><a href="posload.mc">�ٽ� �ֹ��ϱ�</a><br>
</div>