<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.0.min.js">
	
</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
#div {
	margin-top: 12%;
	overflow: hidden;
	text-align: center;
	width: 430px;
	height: 800px;
}

#header {
	width: 108.5%;
	height: 25%;
}

#img {
	margin-top: 1%;
	float: left;
	width: 100%;
	height: 100%;
}

loge {
	float: left;
	height: 100%;
}

.text_label {
	text-align: left;
	width: 100%;
	height: 100%;
}

select {
	padding: 10%;
	padding-right: 20px;
}

.ui-datepicker {
	margin: 5px;
}
</style>
<style>
.ui-datepicker-trigger {
	cursor: pointer;
}

.hasDatepicker {
	cursor: pointer;
}
</style>

<!-- 		날자 달력 이벤트 (동현)				 -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function()
    {
	    $.datepicker.setDefaults(
	    {
	        dateFormat : 'yy-mm-dd',
	        showOtherMonths : true,
	        showMonthAfterYear : true,
	        changeYear : true,
	        changeMonth : true,
	        showOn : "both",
	        buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	        buttonImageOnly : true,
	        buttonText : "날짜 선택",
	        yearSuffix : "년",
	        monthNamesShort :
	        [
	            '1',
	            '2',
	            '3',
	            '4',
	            '5',
	            '6',
	            '7',
	            '8',
	            '9',
	            '10',
	            '11',
	            '12'
	        ],
	        monthNames :
	        [
	            '1월',
	            '2월',
	            '3월',
	            '4월',
	            '5월',
	            '6월',
	            '7월',
	            '8월',
	            '9월',
	            '10월',
	            '11월',
	            '12월'
	        ],
	        dayNamesMin :
	        [
	            '일',
	            '월',
	            '화',
	            '수',
	            '목',
	            '금',
	            '토'
	        ],
	        dayNames :
	        [
	            '일요일',
	            '월요일',
	            '화요일',
	            '수요일',
	            '목요일',
	            '금요일',
	            '토요일'
	        ],
	        minDate : "-100y",
	        yearRange : 'c-100:c+1'
	    
	    });
	    
	    $("#datepicker").datepicker();
	    
	    if("${ loginType != 'kakao' }")
	    {
	    	$('#datepicker').datepicker('setDate', 'today');
	    }
    });
</script>

<!-- 		날자 달력 이벤트 (동현)				 -->

<script>
	$(function()
    {
	    $("#pwtext2").on("focusout", function()
	    { // 패스워드 랑 패스워드 확인 의 값이 같은지 구별
		    var pw = $("#pwtext").val();
		    var pw2 = $("#pwtext2").val();
		    if(pw == pw2)
		    {
			    $("#pwcheckin").text("사용가능 합니다.");
			    $("#pwcheckin").css("color", "blue");
		    }
		    else
		    {
			    $("#pwcheckin").text("사용불가능 합니다.");
			    $("#pwcheckin").css("color", "red");
			    $("#pwtext").val("");
			    $("#pwtext2").val("");
		    }
	    })
	    $("#idtext").on("focusout", function()
	    {// 아이디 이메일 형식이 맞는지 구별 regex
		    var idtext = $("#idtext").val();
		    var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g
		    if(regex.exec(idtext) != null)
		    {
			    $("#idcheckin").text("사용가능 합니다.");
			    $("#idcheckin").css("color", "blue");
		    }
		    else
		    {
			    $("#idcheckin").text("사용불가능 합니다.");
			    $("#idcheckin").css("color", "red");
		    }
	    })
	    $("#phonetext").on("focusout", function()
	    {// 핸드폰 형식이 맞는지 구별 regex
		    var phonetext = $("#phonetext").val();
		    var regex = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/g
		    if(regex.exec(phonetext) != null)
		    {
			    $("#phonecheckin").text("사용가능 합니다.");
			    $("#phonecheckin").css("color", "blue");
		    }
		    else
		    {
			    $("#phonecheckin").text("사용불가능 합니다.");
			    $("#phonecheckin").css("color", "red");
		    }
	    })
	    $("#pwtext").on("focusout", function()
	    {// 패스워드 형식이 맞는지 구별 regex
		    var pwtext = $("#pwtext").val();
		    var password = /^[A-Za-z0-9]{6,12}$/g
		    if(password.exec(pwtext) != null)
		    {
			    $("#pwcheckin").text("정확합니다.");
			    $("#pwcheckin").css("color", "blue");
		    }
		    else
		    {
			    $("#pwcheckin").text("올바르지 않습니다.");
			    $("#pwcheckin").css("color", "red");
			    $("#pwtext").val("");
		    }
	    })
	    $("#delete").on("click", function()
	    { // 취소 버튼 누를시 모든값 초기화 이벤트
		    $("#idtext").val("");
		    $("#pwtext").val("");
		    $("#pwtext2").val("");
		    $("#nicnamektext").val("");
		    $("#birthtext1").val("");
		    $("#birthtext2").val("");
		    $("#birthtext3").val("");
		    $("#phonetext").val("");
		    $("#idcheckin").text("");
		    $("#pwcheckin").text("");
		    $("#birthcheckin").text("ex) 1997년 02월 03일");
		    $("#birthcheckin").css("color", "black");
		    $("#phonecheckin").text("");
	    })
    })
</script>
</head>
<body>
	<form action="Input.insert" method="post">
		<div class="container col-md-5 mt-5" id="div">
			<div class="row" id="header">
				<div class="col-1"></div>
				<loge class="col-10"> <img
					src="%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1.png" alt="" id="img">
				</loge>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label ">
					<label for="" class="mt-3 mb-1 mr-3">아이디 </label><span
						id="idcheckin"></span>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label">
					<input type="text" class="form-control" placeholder="아이디를 입력하세요."
						name="id" id="idtext" required onkeyup="noSpaceForm(this);"
						onchange="noSpaceForm(this);">
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label ">
					<label for="" class="mt-2 mb-1 mr-3">비밀번호 </label><span
						id="pwcheckin"></span>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label">
					<input type="password" class="form-control"
						placeholder="비밀번호를 입력하세요." name="pw" id="pwtext" required
						onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label ">
					<label for="" class="mt-2 mb-1">비밀번호 확인 </label>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label">
					<input type="password" class="form-control"
						placeholder="비밀번호를 입력하세요." name="pw2" id="pwtext2" required
						onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label ">
					<label for="" class="mt-2 mb-1">닉네임</label>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label">
					<input type="text" class="form-control" placeholder="닉네임를 입력하세요."
						name="nickname" id="nicknametext" required
						onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
				<div class="col-1"></div>
			</div>
			<div id="gender_row" class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label">
					<label for="" class="mt-2 mb-1 mr-5">성 별</label> <input id="male_btn"
						type="radio" class="gender ml-4 mr-3" name="gender" value="M"
						required><span class="mr-3"> 남</span> <input id="female_btn" type="radio"
						class="gender ml-4 mr-3" name="gender" value="F" required><span>
						여</span>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label"></div>
				<div class="col-1"></div>
			</div>
			<div id="cal_row" class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label ">
					<label for="" class="mt-2 mb-1 mr-4">생년월일</label> <input
						type="text" id="datepicker" name="birth">
					<div class="col-1"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label">
					<label for="" class="mt-2 mb-1 mr-3">휴대폰</label><span
						id="phonecheckin" required></span>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 text_label">
					<input type="text" class="form-control"
						placeholder="휴대폰 번호를 입력하세요." name="phone" id="phonetext" required>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row pt-1 mt-2" id="main">
				<div class="col-1"></div>
				<div class="col-10 input_text">
					<button type="submit" class="btn btn-primary" id="ok" name="ok">확인</button>
					<button type="button" class="btn btn-primary ml-4" id="delete">취소</button>


				</div>
				<div class="col-1"></div>
			</div>
		</div>
	</form>
	<script>
		function noSpaceForm(obj)
        { // 공백사용못하게
	        var str_space = /\s/; // 공백체크
	        if(str_space.exec(obj.value))
	        { //공백 체크
		        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
		        obj.focus();
		        obj.value = obj.value.replace(' ', ''); // 공백제거
		        return false;
	        }
	        // onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
        }
	</script>
	
</body>
</html>