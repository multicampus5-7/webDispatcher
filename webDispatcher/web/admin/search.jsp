<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>
	function getData() {
		var urlstr = "https://dapi.kakao.com/v2/search/vclip";
		var verb = $('input[name="verb"]').val();

		$.ajax({
			method : 'GET',
			url : urlstr,
			headers : {
				'Authorization' : 'KakaoAK 76019d1015be48b799e58092ee27dd86'
			},
			data : {
				'query' : verb
			},
			success : function(data) {
				$('#kakaoSearch').empty();
				displayData(data);
			},
			error : function() {
				alert('error');
			}
		});
	};
	function displayData(querys) {
		$(querys.documents).each(function(index, str) {
			var temp = '';
			temp += '<span><a href='+str.url+'>';
			temp += '<p>' + '<img src=' +str.thumbnail+'>';
			temp += str.title + '</p></a></span>';
			$('#kakaoSearch').append(temp);
		});
	};
	$(document).ready(function() {
		$('#kakaoButton').click(function() {
			getData();
		});
	});
</script>


<div id="center">
	<h1>search</h1>
	<input type="text" name="verb">
	<button id="kakaoButton">search</button>
	<div id="kakaoSearch"></div>
</div>