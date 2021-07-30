<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
window.onload= function(){
	$('#specialRelationcheck').change(function(){
	if ($('#specialRelationcheck').prop("checked", true)) {
	    $('#specialRelation').val('Y');
	}else {
	    $('#specialRelation').val('N');
	}
	});
	$('#tradeStopcheck').change(function(){
	if ($('#tradeStopcheck').prop("checked", true)) {
	    $('#tradeStop').val('Y');
	} else {
	    $('#tradeStop').val('N');
	}
});


};


</script>
<script>
function subclick(str){
	if(str=='insert'){
		 answer = confirm("저장하시겠습니까?");
		
		if(answer == true){
		formaction.action="insert.do";
		}else{
			return false;
		}
	}else if(str=='update'){
		formaction.action="update.do";
	}else if(str=='delete'){
		
		answer = confirm("데이터를 삭제하시겠습니까?");
		if(answer == true){
		formaction.action="delete.do";
		}else{
			  return;
		}
	}
}

function subclick1(){
	var answer = confirm("데이터를 삭제하시겠습니까?");
	
	if(answer == true){
		var busiNum = $('#busiNum').val();
		location.href="delete.do?busiNum="+busiNum;
	}
		
}
</script>
<script>
window.onload = function() {
	d = new Date();
	d = d.toISOString().slice(0, 10);
	bir = document.getElementById("contractPeriodE");
	bir1 = document.getElementById("contractPeriodS");
	bir.value = d;
	bir1.value = d;
	
	dateset();
	
}

function dateset(){
	d = new Date();
	
	$('#regiInfoDate').val(d.getFullYear() + "-" + ("00" + (d.getMonth() + 1)).slice(-2) + "-" + 
			("00" + d.getDate()).slice(-2) + " " + ("00" + d.getHours()).slice(-2) + ":" + 
			("00" + d.getMinutes()).slice(-2) + ":" + ("00" + d.getSeconds()).slice(-2));
	$('#modiInfoDate').val( d.getFullYear() + "-" + ("00" + (d.getMonth() + 1)).slice(-2) + "-" + 
			("00" + d.getDate()).slice(-2) + " " + ("00" + d.getHours()).slice(-2) + ":" + 
			("00" + d.getMinutes()).slice(-2) + ":" + ("00" + d.getSeconds()).slice(-2) );
}
</script>
<script>
function getallinfo(){
	let custom = event.target.nextElementSibling.getAttribute("name");
	let param = {
			custom  : custom
	}
	list = new Array();
	 $.ajax({
		type : "POST",
		url : "getAllinfo.do",
		data : param,
		dataType:'JSON',
		error : function(){
			alert("통신실패");
		},
		success : function(data){
			 
			InsertToText(data);
		}
	}); 
}

let InsertToText = function(arr){
	//변경날짜 현재시각 설정
	var d = new Date();
	$.each(arr, function(i,item){
		$('#busiNum').val(item.busiNum);
		$('#custom').val(item.custom);
		$('#shortt').val(item.shortt);
		$('#ceo').val(item.ceo);
		$('#chargePerson').val(item.chargePerson);
		$('#busiCondition').val(item.busiCondition);
		$('#item').val(item.item);
		$('#postNum').val(item.postNum);		
		$('#addr1').val(item.addr1);
		$('#addr2').val(item.addr2);
		$('#tel').val(item.tel);
		$('#fax').val(item.fax);
		$('#homePage').val(item.homePage);
		$('#coYn').val(item.coYn);
		if(item.foreignYn=='1'){
			$('.foreignYn1').prop("checked", true);
		}else if(item.foreignYn=='2'){
			$('.foreignYn2').prop("checked", true);
		} 
		if(item.coYn=='1'){
			$('.coYn1').prop("checked", true);
		}else if(item.coYn=='2'){
			$('.coYn2').prop("checked", true);
		}
		if(item.countryEng!=null){
			$('.countryval').val('ENG');
		}else if(item.countryKor!=null){
			$('.countryval').val('KOR');
		}
		//$('#countryEng').val(item.countryEng);
		//$('#countryKor').val(item.countryKor);
		$('#specialRelation').val(item.specialRelation);
		$('#tradeStop').val(item.tradeStop);
		//$('#contractPeriodS').val(item.contractPeriodS);
		//$('#contractPeriodE').val(item.contractPeriodE);
		$('#regiInfoMan').val(item.regiInfoMan);
		$('#regiInfoDate').val(item.regiInfoDate);
		$('#modiInfoMan').val(item.modiInfoMan);
		$('#modiInfoDate').val( d.getFullYear() + "-" + ("00" + (d.getMonth() + 1)).slice(-2) + "-" + 
				("00" + d.getDate()).slice(-2) + " " + ("00" + d.getHours()).slice(-2) + ":" + 
				("00" + d.getMinutes()).slice(-2) + ":" + ("00" + d.getSeconds()).slice(-2) );
		
	/* 	$('#factory').val(item.accountVO.factory);
		$('#tradeBank').val(item.accountVO.tradeBank);
		$('#accountNum').val(item.accountVO.accountNum); */
	});
}
</script>
<!-- <script>
    function test1(){
        var formData = $("#testForm").serialize();
        $.ajax({
            cache : false,
            url : "getinfo.do", // 요기에
            type : 'POST', 
            data : formData, 
            dataType:'JSON',
            success : function(data) {
                alert(data);
            }, 
    
            error : function() {
                alert("aa");
            }
        }); // $.ajax */
    }
</script> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
<h1>거래처 관리</h1>	
<div class="container">
<div class="trade_nav">
<div style="width:100%;height:60px;"></div>
<div class="custom_search">
<form action="getinfo.do">
<table style="width:300px;height:150px;" >
<tr>
<td>사업자번호</td><td colspan="2"><input type="text" name="busiNum" class="custom_search_text" /></td>
</tr>
<tr>
<td>거래처명</td>
<td><input type="text" name="custom" class="custom_search_text"/></td>
<td><input type="submit" value="조회" /></td>
</tr>
</table>
</form>
</div>
<div class="custom_list">
<table style="border: 1px solid #444444; width:100%;">
<tr>
<td>사업자번호</td><td>거래처명</td>
</tr>
<c:forEach var="cinfo" items="${alist}">
<tr>
<td>${cinfo.busiNum}</td>
<td><a  onclick="getallinfo()" style="cursor: pointer;" >${cinfo.custom}</a>
<input type="hidden" name="${cinfo.custom}"/></td>
</tr>
</c:forEach>
</table>
</div>

</div>
<div class="custom_info">
<form name="formaction" method=post>	
<div class="menu_bar">
<input type="submit"  value="저장" onclick="subclick('insert');"class="menu_button"/>
<input type="submit"  value="수정" onclick="subclick('update');" class="menu_button"/>
<input type="submit" value="삭제" onclick="subclick('delete');" class="menu_button"/>
</div>
<div class="custom_info_detail">
<table>
<tr><td>사업자번호</td><td><input type="text" name="busiNum" id="busiNum"required/></td><td>약 칭</td><td><input type="text" name="shortt" id="shortt"/></td></tr>
<tr><td>거래처명</td><td><input type="text" name="custom" id="custom"required/></td></tr>
<tr><td>대표자</td><td><input type="text" name="ceo" id="ceo"/></td><td>담당자</td><td><input type="text" value="홍길동"name="chargePerson" id="chargePerson"/></td></tr>
<tr>
	<td>업태</td>
	<td> <input type="text" name="busiCondition"id="busiCondition" /></td>
	<td>종목</td>
	<td> <input type="text" name="item" id="item"/></td>
</tr>
<tr>
	<td>우편번호</td>
	<td><input type="text" name="postNum" id="postNum"/>
	<input type="button" value="검색" /> </td>
	<td>주 소 1</td>
	<td> <input type="text" name="addr1"id="addr1" /></td>
</tr>
<tr>
<td>주 소 2</td>
<td> <input type="text" name="addr2" id="addr2"/> </td>
</tr>
<tr>
<td>전화번호</td>
<td><input type="text" name="tel"id="tel" /></td>
<td>팩스번호</td>
<td><input type="text" name="fax"id="fax" /></td></tr>
<tr>
<td>홈페이지</td>
<td><input type="text" name="homePage" id="homepage"/></td>
</tr>
<tr><td>법인여부</td>
<td><input type="radio" value="1" name="coYn" id="coYn" class="coYn1" checked/>법인
 <input type="radio" value="2"name="coYn" id="coYn" class="coYn2"/>개인</td>
 <td>해외 여부</td>
 <td><input type="radio" value="1" name="foreignYn" id="foreignYn" class="foreignYn1" checked/>국내
 <input type="radio" value="2"name="foreignYn" id="foreignYn" class="foreignYn2"/>해외</td>
 </tr>
 <tr><td>과세구분</td><td><select name="taxYn" id="taxYn">
 <option value="1">과세/면세</option>
 <option value="2">**/**</option>
 </select></td>
 <td>국 가</td>
 <td><!-- <input type="text" name="countryEng" id="countryEng" class="countryval" style="width:50px"readonly/> -->
 <input type="text" name="countryKor" id="countryKor" class="countryval" style="width:50px"readonly/>
 <input type="text" id="countrysearch" />
 <input type="button" value="검색" onclick="팝업창띄우기"/></td>
 </tr>
 <tr><td>특수관계자</td><td><input type="checkbox" name="specialRelationcheck" id="specialRelationcheck"/>
 <input type="hidden" name="specialRelation"id="specialRelation" value="N"/>
 </td>
 <td>거래중지</td><td><input type="checkbox" name="tradeStopcheck" id="tradeStopcheck" />
 <input type="hidden" name="tradeStop" id="tradeStop" value="N"/></td>
 </tr>
 <tr><td>계약기간</td><td><input type="date" name="contractPeriodS" id="contractPeriodS" ></td><td>~</td>
 <td><input type="date" name="contractPeriodE" id="contractPeriodE" ></td></tr>
<tr><td>등록정보</td><td><input type="text" name="regiInfoMan" id="regiInfoMan"value="홍길동" style="width:50px"  />
<input type="text" name="regiInfoDate" id="regiInfoDate" readonly/></td>
<td>변경정보</td>
<td><input type="text" name="modiInfoMan"  id="modiInfoMan"style="width:50px"/>
<input type="text" name="modiInfoDate" id="modiInfoDate" readonly/>
</td>
</tr>
<tr><td><h3>(거래처 계좌정보)</h3></td></tr>
<tr>
<table class="account_table"style="border: 1px solid #444444; width:100%;">
<tr><td>사무소</td><td>은행</td><td>계좌번호</td></tr>
<tr><td><input type="text" name="factory"id="factory" /></td>
<td><input type="text" name="tradeBank"id="tradeBank" /></td>
<td><input type="text" name="accountNum" id="accountNum"/></td>
</table>
</tr>

</table>

</div>
</form>
</div>


</div>

</body>
</html>