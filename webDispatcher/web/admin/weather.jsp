<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<style>
.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script>
	var taMax = [];
	var taMin = [];
	
	$(document).ready(function() {
		getTemp();
	});

	function getTemp() {
		var urlstr = 'weather2';
		$.ajax({
			url : urlstr,
			dataType : 'xml',
			success : function(data) {
				console.log(data);

				importDb(data);
				getCharts();
			},
			error : function() {
				alert('eerr');
			}
		});
	};

	function importDb(data) {
		var items = $(data).find('item');
		$(items).each(function(index, d) {
			taMax[0] = parseInt($(d).find('taMax3').text());
			taMax[1] = parseInt($(d).find('taMax4').text());
			taMax[2] = parseInt($(d).find('taMax5').text());
			taMax[3] = parseInt($(d).find('taMax6').text());
			taMax[4] = parseInt($(d).find('taMax7').text());
			taMax[5] = parseInt($(d).find('taMax8').text());

			taMin[0] = parseInt($(d).find('taMin3').text());
			taMin[1] = parseInt($(d).find('taMin4').text());
			taMin[2] = parseInt($(d).find('taMin5').text());
			taMin[3] = parseInt($(d).find('taMin6').text());
			taMin[4] = parseInt($(d).find('taMin7').text());
			taMin[5] = parseInt($(d).find('taMin8').text());
		});
	}
	function getCharts() {
		Highcharts.chart('container', {
			chart : {
				type : 'line'
			},
			title : {
				text : '모레 이후 7일간 최저/최고기온'
			},
			subtitle : {
				text : 'Source: data.go.kr'
			},
			xAxis : {
				categories : [ '3일 후', '4일 후', '5일 후', '6일 후', '7일 후', '8일 후',
						'9일 후' ]
			},
			yAxis : {
				title : {
					text : 'Temperature (°C)'
				}
			},
			plotOptions : {
				line : {
					dataLabels : {
						enabled : true
					},
					enableMouseTracking : false
				}
			},
			series : [ {
				name : 'Max',
				data : taMax
			}, {
				name : 'Min',
				data : taMin
			} ]
		});
	};
</script>

<div id="center">
	<h1>Weather</h1>
	<figure class="highcharts-figure">
		<div id="container"></div>
	</figure>
</div>