<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!--달력이미지-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
</head>
<style>
.ui-datepicker-trigger {
	cursor: pointer;
}

.hasDatepicker {
	cursor: pointer;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #5cb85c;
	cursor: pointer;
	border: 1px solid #4cae4c;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.filebox label:hover {
	background-color: #6ed36e;
}

.filebox label:active {
	background-color: #367c36;
}

.filebox input[type="file"] {
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
<style>
body {
	margin: 10px;
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	preview-image clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display {
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}
</style>
<style>
body {
	padding: 20px;
	margin: auto;
}

.head, .send, .class {
	float: left;
}

.array {
	box-sizing: border-box;
	overflow: hidden;
}

.img {
	background-image: url(메인곰2.jpg);
	width: 150px;
	height: 150px;
	background-size: contain;
	float: left;
}

.img2 {
	width: 200px;
	height: 200px;
	background-size: contain;
	float: left;
}

.head {
	margin-right: 10px;
}

.input-group {
	width: 150px;
}

.list {
	width: 680px;
	height: 200px;
	border: 1px solid black;
}

#inputimg {
	clear: both;
	width: 500px;
}

.card-body {
	width: 680px;
	padding: 10px;
	box-sizing: border-box;
	overflow: hidden;
}

.clear {
	clear: both;
}

#datepicker, #datepicker2 {
	width: 130px;
	text-align: center;
}

.btm {
	margin-top: 10px;
}

.color {
	background-color: aqua;
}

.intro {
	width: 200px;
	height: 95px;
	overflow-y: auto;
	border: 1px ridge red;
	outline: none;
}

#id {
	width: 200px;
	height: 30px;
	border: 1px ridge red;
	outline: none;
}

.intro:empty:not (:focus ):before {
	content: attr(data-placeholder)
}

.cash:empty:not (:focus ):before {
	content: attr(data-placeholder)
}

.welcome {
	width: 200px;
	text-align: center;
}

.main {
	height: 200px;
	overflow-y: auto;
	border: 1px ridge red;
	outline: none;
}

.cash {
	height: 34px;
	outline: none;
}

.inputcash {
	width: 100%;
	height: 100%;
	border: 1px solid #dec99a;
}

div:focus, cash:focus, input:focus, input[type]:focus, .inputcash:focus
	{
	border-color: rgba(229, 103, 23, 0.8);
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px
		rgba(229, 103, 23, 0.6);
	outline: 0 none;
	background: none;
}

.addr {
	width: 100%;
}

.searchaddr {
	width: 250px;
}
/*
		*{
		border: 1px solid black
		}
		*/
</style>
<body>
	<form action="tutor.con" method="post">
		<div class="container">
			<div class="row">
				<!-- 헤더부분 -->
				<div class="top col-lg-12">
					<div class="head welcome">
						<h4>
							<span class="badge welcome badge-warning">'튜터'님 환영합니다</span>
						</h4>
					</div>
					<div class=send>
						<img src="쪽지.png" alt="">
					</div>
				</div>
				<br>
				<div class="array col-lg-12">
					<div class=img></div>
					<!--튜터 본인 사진-->
					<div id=id class="array border-warning"></div>
					<!--ID-->
					<br>
					<div class="intro array border-warning" id="imtutor"
						contentEditable="true" data-placeholder="튜터를 소개하세요"></div>
					<input type="hidden" name="intro">
				</div>
			</div>
			<br>
			<!-- 헤더부분 끝 -->

			<p>
				<a class="btn btn-warning" data-toggle="collapse"
					href="#collapseExample" role="button" aria-expanded="false"
					aria-controls="collapseExample"> Class 만들기 ▼ </a>
			</p>

			<div class=row>
				<!-- 컨텐츠 부분-->
				<div class=" col-lg-12 col-md-12 col-sm-12 p-0 m-0"
					id="collapseExample">
					<div 	class="card m-3 col-lg-12 col-md-12 col-sm-12 card-body array border-warning">
						<!--Class등록 Show부분-->
						<div class=" drop p-0 ">
							<!-- 드랍버튼 3개-->

							<div class="mr-1 ml-4 p-0 head col-2 btn-group">
								<button type="button" id="mystatus2"
									class="btn btn-warning p-1 dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">카테고리</button>

								<ul id="mytype" class="dropdown-menu" role="menu"
									aria-labelledby="searchType">
									<li><a class="dropdown-item" href="#">디자인</a></li>
									<li><a class="dropdown-item" href="#">IT</a></li>
									<li><a class="dropdown-item" href="#">언어</a></li>
									<li><a class="dropdown-item" href="#">라이프</a></li>
									<li><a class="dropdown-item" href="#">스타일</a></li>
									<li><a class="dropdown-item" href="#">재테크</a></li>
								</ul>
								<input type="hidden" name="down">
							</div>



							<div class="mr-1 ml-4 p-0 head col-2 btn-group">
								<button type="button"
									class="btn btn-warning p-1 dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">희망지역</button>
								<div class="dropdown-menu">
									<input type="button" onclick="sample4_execDaumPostcode()" class="btn addr" value="주소 찾기 클릭"> 
										<span id="guide"	style="color: #999; display: none"></span>
									<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
									<script>
										//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
										function sample4_execDaumPostcode() {
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

															// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
															// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
															var roadAddr = data.roadAddress; // 도로명 주소 변수
															var extraRoadAddr = ''; // 참고 항목 변수

															// 법정동명이 있을 경우 추가한다. (법정리는 제외)
															// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
															if (data.bname !== ''
																	&& /[동|로|가]$/g
																			.test(data.bname)) {
																extraRoadAddr += data.bname;
															}
															// 건물명이 있고, 공동주택일 경우 추가한다.
															if (data.buildingName !== ''
																	&& data.apartment === 'Y') {
																extraRoadAddr += (extraRoadAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
															if (extraRoadAddr !== '') {
																extraRoadAddr = ' ('
																		+ extraRoadAddr
																		+ ')';
															}

															// 우편번호와 주소 정보를 해당 필드에 넣는다.
															document
																	.getElementById('sample4_postcode').value = data.zonecode;
															document
																	.getElementById("sample4_roadAddress").value = roadAddr;
															document
																	.getElementById("sample4_jibunAddress").value = data.jibunAddress;

														}
													}).open();
										}
									</script>
									<input type="text" id="sample4_postcode"class=" searchaddr zipcode text" placeholder="우편번호"
										name=zipcode readonly > 
									<input type="text" id="sample4_roadAddress" class=" searchaddr road text"
										placeholder="도로명주소" name=add1 readonly> 
									<input type="text" id="sample4_jibunAddress" class=" searchaddr road text" placeholder="지번주소" 
									name=add2 readonly   readonly> 
									<input type="text"id="sample4_detailAddress" class=" searchaddr text"
										placeholder="상세주소 입력하기" name=add3>
								</div>
							</div>
							<div class="mr-1 ml-4 p-0 cash col-2 head cash form-group">
								<input type="text" class="inputcash form-control" placeholder="희망인원" name=max>
							</div>
							<div class="mr-1 ml-4 p-0 cash col-2 head cash form-group">
								<input type="text" class="inputcash form-control"	placeholder="희망금액" name=cash>
							</div>
						</div>
						<br>
						<div class="array clear">
							<!-- 날짜 고르는 부분 -->
							<div class="head p-0 m-0 col-2">
								<h3>
									<span class="badge m-0 p-1 badge-warning">날짜선택</span>
								</h3>
							</div>
							<div class="head pt-1 m-0 pick col-10">
								<div class="head p-0 m-0 col-lg-6 col-md-6 col-sm-6">
									시작: <input type="text" id="datepicker" name=startdate>
								</div>
								<div class="head p-0 m-0 col-lg-6 col-md-6 col-sm-6">
									종료: <input type="text" id="datepicker2" name=enddate>
								</div>
								<script>
									$(function() {
										//모든 datepicker에 대한 공통 옵션 설정
										$.datepicker
												.setDefaults({
													dateFormat : 'yy-mm-dd',
													showOtherMonths : true,
													showMonthAfterYear : true,
													changeYear : false,
													changeMonth : true,
													showOn : "both",
													buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
													buttonImageOnly : true,
													buttonText : "날짜 선택",
													yearSuffix : "년",
													monthNamesShort : [ '1',
															'2', '3', '4', '5',
															'6', '7', '8', '9',
															'10', '11', '12' ],
													monthNames : [ '1월', '2월',
															'3월', '4월', '5월',
															'6월', '7월', '8월',
															'9월', '10월', '11월',
															'12월' ],
													dayNamesMin : [ '일', '월',
															'화', '수', '목', '금',
															'토' ],
													dayNames : [ '일요일', '월요일',
															'화요일', '수요일',
															'목요일', '금요일', '토요일' ],
													minDate : "-0M",
													maxDate : "+8M"
												});

										$("#datepicker").datepicker();
										$("#datepicker2").datepicker();

										$('#datepicker').datepicker('setDate',
												'today');
										$('#datepicker2').datepicker('setDate',
												'+1D');

									});
								</script>
							</div>
						</div><!-- 날짜 고르는 부분 끝-->
						<br>

						<div class="array col-12 p-0 m-0">
							<!-- 사진 캐러셀+내용입력-->
<!-- 							<div id="carouselExampleIndicators" -->
<!-- 								class="carousel p-0 slide img2 head col-5" data-ride="carousel"> -->
<!-- 								사진(캐러셀) 올리는 부분 -->
<!-- 								<ol class="carousel-indicators"> -->
<!-- 									<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li> -->
<!-- 									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li> -->
<!-- 									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
<!-- 								</ol> -->
<!-- 								<div class="carousel-inner"> -->
<!-- 									<div class="carousel-item active"> -->
<!-- 										<img src="" class="d-block w-100" alt="이미지가 없습니다"> -->
<!-- 									</div> -->
<!-- 									<div class="carousel-item"> -->
<!-- 										<img src="" class="d-block w-100" alt="이미지가 없습니다"> -->
<!-- 									</div> -->
<!-- 									<div class="carousel-item"> -->
<!-- 										<img src="" class="d-block w-100" alt="이미지가 없습니다"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<a class="carousel-control-prev" -->
<!-- 									href="#carouselExampleIndicators" role="button"data-slide="prev">  -->
<!-- 									<span class="carousel-control-prev-icon"aria-hidden="true"></span> <span class="sr-only">Previous</span> -->
<!-- 								</a> <a class="carousel-control-next" -->
<!-- 									href="#carouselExampleIndicators" role="button" -->
<!-- 									data-slide="next"> <span class="carousel-control-next-icon" -->
<!-- 									aria-hidden="true"></span> <span class="sr-only">Next</span> -->
<!-- 								</a> -->
<!-- 							</div>	사진등록 끝 -->
							<div contentEditable="true" class="main head p-0 m-0 col-7 border-warning " id=cont ></div>
							<input type="hidden" name="explain"><!-- Class 내용 등록-->	
						</div><!-- 사진 캐러셀 +내용입력 끝--><br>
						<!--  업로드 버튼 -->
						<form action=upload.file  method=post  enctype="multipart/form-data">
						<input type="file" value="" name="upload[]" multiple><br>
						</form>
						<br>
						<div class="head btm m-0 p-0 col-12">
							<button type="button" id="register" class="btn btn-outline-warning">등록하기</button>
							
						</div>
						<!--Class등록 Show부분 끝-->
					</div>
				</div>
			</div>
			<!-- 컨텐츠 부분 끝-->
			<br>

			<div class=row>
				<div id=myclass class="col-lg-12 col-md-12 col-sm-12">
					<h4>
						<span class="badge welcome badge-warning">MY CLASS 모아보기</span>
					</h4>
					<div class="list col-lg-12 col-md-12 col-sm-12 border-warning"></div>
					<br>
				</div>
			</div>

			<div class=row>
				<div id=afterclass class="col-lg-12 col-md-12 col-sm-12">
					<h4>
						<span class="badge welcome badge-warning">MY CLASS 후기</span>
					</h4>
					<div class="list col-lg-12 col-md-12 col-sm-12 border-warning"></div>
				</div>
			</div>
		</div>
	</form>

</body>

<script>


// $("#inputimg").summernote({
// 	callbacks: {
// 		onImageUpload; function(files, editor, welEditable) {
// 			var data = new FormData();//<form />의 기능	
// 			data.append('file',files[0]);//input type=file을 폼 안에 넣는 기능, 파일 0번 하나만 올림
// 			$.ajax({
// 				url:"upload.file",
// 				data:data,
// 				type:"POST",
// 				cache: false,//이건뭐지
// 				contentType: false,//이건뭐지
// 				enctype: 'multipart/form-data',//인코딩타입
// 				processData: false,
// 			}).done(function(resp){//성공시에 append를 어디에 할까?
// 					$(".active").append("<img src='"+resp+"'>");//이미지 추가시 이미지가 나오는 p태그를 포함하는 div의 클래스에 append할 것
// 			});
// 		}
// 	}

// });

$('#mytype li > a').on('click', function() {
	// 버튼에 선택된 항목 텍스트 넣기 
	$('#mystatus2').text($(this).text());
});

	document.getElementById("register").onclick = function() {
		$("input[name=intro]").val($("#imtutor").html());
		$("input[name=down]").val($('#mystatus2').text());
		$("input[name=zipcode]").val();
		$("input[name=add1]").val();
		$("input[name=add2]").val();
		$("input[name=add3]").val();
		$("input[name=max]").val();
		$("input[name=cash]").val();
		$("input[name=startdate]").val();
		$("input[name=enddate]").val();
		$("input[name=explain").val($('#cont').text());
		$("form").submit();
	};


// 	$(document).ready(function() {
// 						var fileTarget = $('.filebox .upload-hidden');

// 						fileTarget.on('change', function() {
// 							if (window.FileReader) {
// 								// 파일명 추출
// 								var filename = $(this)[0].files[0].name;
// 							}	else {
// 								// Old IE 파일명 추출
// 								var filename = $(this).val().split('/').pop()
// 										.split('\\').pop();
// 							};
// 							$(this).siblings('.upload-name').val(filename);
// 						});

// 						//preview image 
// 						var imgTarget = $('.preview-image .upload-hidden');

// 						imgTarget.on('change',	function() {
// 											var parent = $(this).parent();
// 											parent.children('.upload-display').remove();

// 											if (window.FileReader) {
// 												//image 파일만
// 												if (!$(this)[0].files[0].type.match(/image\//))
// 													return;

// 												var reader = new FileReader();
// 												reader.onload = function(e) {
// 													var src = e.target.result;
// 													parent.append('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
// 												}
// 												reader.readAsDataURL($(this)[0].files[0]);
// 											    }

// 											else {
// 												$(this)[0].select();
// 												$(this)[0].blur();
// 												var imgSrc = document.selection
// 														.createRange().text;
// 												parent.append('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

// 												var img = $(this).siblings(
// 														'.upload-display')
// 														.find('img');
// 												img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
// 														+ imgSrc + "\")";
// 											}
// 										});
// 					});
</script>


</html>