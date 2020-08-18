<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77051248a1682bf5a19186626f35773e&libraries=services"></script>
<script>
	let products = [];
	let orders = {};
	let sum = 0;
	let markers = [];
	let map = null;
	let ps = null;
	let infowindow = null;
	
	$(document).ready(function() {
		mapDisplay();
	});
	function mapDisplay() {
		let mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 8
		};
		map = new kakao.maps.Map(mapContainer, mapOption);
		ps = new kakao.maps.services.Places();
		infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		ps.keywordSearch('맥도날드', placesSearchCB);
	}
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {
			displayPlaces(data);
			displayPagination(pagination);
		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			alert('검색 결과가 존재하지 않습니다.');
			return;
		} else if (status === kakao.maps.services.Status.ERROR) {
			alert('검색 결과 중 오류가 발생했습니다.');
			return;
		}
	}
	function displayPlaces(places) {
		let listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
		$(listEl).each(function() {
			console.log(lsitEl);
		})
		removeMarker();
		for (let i = 0; i < places.length; i++) {
			let placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
			bounds.extend(placePosition);
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});
				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};
				itemEl.onmouseout = function() {
					infowindow.close();
				};
			})(marker, places[i].place_name);
			fragment.appendChild(itemEl);
		}
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;
		map.setBounds(bounds);
	}
	function getListItem(index, places) {
		let el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.place_name + '</h5>';
		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>'
					+ '   <span class="jibun gray">' + places.address_name
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address_name + '</span>';
		}
		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';
		el.innerHTML = itemStr;
		el.className = 'item';
		return el;
	}
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(13, 37)
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});
		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다
		return marker;
	}
	function removeMarker() {
		for (let i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}
	function displayPagination(pagination) {
		let paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			let el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;
			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}
			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}
	function displayInfowindow(marker, title) {
		let content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		infowindow.setContent(content);
		infowindow.open(map, marker);
	}
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}
</script>


<div id="center">
	<div id="map"
		style="width: 600px; height: 600px; border: 2px solid blue;"></div>
</div>