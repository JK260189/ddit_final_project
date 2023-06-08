<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>회원가입</title>
<style>
    #nextBtn{
        width: 380px;
    }
    .error {
        color: red;
    }
</style>
<script type="text/javascript">


$(document).ready(function(){
		$("#btnRegist").bind("click", function(){
			$("#frmRegist").submit();
		});
	})
</script>


<div id="mytask-layout" class="theme-indigo">

    <!-- main body area -->
    <div class="main p-2 py-3 p-xl-2">

        <!-- Body: Body -->
        <div class="body d-flex p-0 p-xl-2">
            <div class="container-xxl">

                <div class="row g-0">
                    <div class="col-lg-6 d-none d-lg-flex justify-content-center align-items-center rounded-lg auth-h100">
                        <div style="max-width: 40rem;">
                        	<img src="${cPath }/resources/images/interview.svg" alt="interview-img" style="max-width: 40rem;">
                        </div>
                    </div>

                    <div class="col-lg-6 d-flex justify-content-center align-items-center border-0 rounded-lg auth-h100">
                        <div class="w-100 p-3 p-md-5 card border-0 bg-dark text-light" style="max-width: 32rem;">
                            <!-- Form -->
                            <form id="frmRegist" class="row g-1 p-3 p-md-4" onsubmit="handleSubmit(event)">
                                <div class="col-12 text-center mb-1 mb-lg-5">
                                    <h1>회사 등록</h1>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">회사 이름</label>
                                        <input name="companyName" type="text" class="form-control form-control-lg" placeholder="주(삼성전자)" />
                                        <span id="companyName"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">회사 주소</label>
                                        <input type="button" class="btn btn-secondary" onclick="sample6_execDaumPostcode()" value="주소찾기" style="height:30px; margin-left:58%;"><br>
                                        <input type="text"  id="sample6_address" class="form-control form-control-lg" name="companyAddr" placeholder="대전광역시 중구 오류동" required>
                                        <!-- <input name="companyAddr" type="text" class="form-control form-control-lg" placeholder="대전광역시 중구 오류동" /> -->
                                        <span id="companyAddr"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-2">
                                        <label class="form-label">회사 전화번호</label>
                                        <input name="companyTel" type="tel" class="form-control form-control-lg" placeholder="042-628-0452" />
                                        <span id="companyTel"></span>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" onchange="handelCheckChange()">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            <a href="#" title="Terms and Conditions" class="text-secondary">서비스 이용약관, 개인정보 처리방침</a>을 확인하였고,이에 동의합니다.
                                        </label>
                                        <span id="termsCheck"></span>
                                    </div>
                                </div>
                                <div class="col-12 text-center mt-4">
                                    <button type="button" class="btn btn-lg btn-block btn-light lift text-uppercase" alt="SIGNUP" id="btnRegist">등록</button>
                                </div>
                            </form>
                            <!-- End Form -->
                        </div>
                    </div>
                </div> <!-- End Row -->
            </div>
        </div>
    </div>
</div>

<script>
    let companyName =  $('#companyName');
	let companyAddr =   $('#companyAddr');
    let companyTel =   $('#companyTel');
    let termsCheck =  $('#termsCheck');
    let isCheck = false
    const handelCheckChange = () => isCheck =!isCheck;

	const company = {
		companyName : '',
		companyAddr : '',
		companyTel : '',
    }
    const handleSubmit = (e) => {
	    e.preventDefault();
	    companyName.html('');
	    companyAddr.html('');
	    companyTel.html('');
	    $('#termsCheck').html('');
		let companyNameValue = $("input[name='companyName']").val();
		let companyAddrValue = $("input[name='companyAddr']").val();
		let companyTelValue = $("input[name='companyTel']").val();
		let isSubmit = true;
	    if(companyNameValue === ''){
		    companyName.html('회사 이름을 입력해주세요').css('color', 'red');
			isSubmit = false;
        }
	    if(companyAddrValue === ''){
		    companyAddr.html('회사 이름을 입력해주세요').css('color', 'red');
		    isSubmit = false;
        }
	    if(companyTelValue === ''){
		    companyTel.html('회사 이름을 입력해주세요').css('color', 'red');
		    isSubmit = false;
        }
		if( ! isCheck ){
			termsCheck.html('약관 체크를 해주세요').css('color','red');
			isSubmit = false;
        }

		if(isSubmit === false) return false;
        company.companyName = companyNameValue;
        company.companyTel = companyTelValue;
        company.companyAddr = companyAddrValue;
		console.log(company);
		console.log(JSON.stringify(company))

	    headers['Content-Type'] = 'application/json'
	    headers['accept'] = 'application/json'
	    fetch('/ourmine/company/companyForm',{
		    method : 'POST',
		    headers : headers,
		    body : JSON.stringify(company)
	    }).then(resp => resp.json())
		    .then(data => {
			    console.log(data)
			    if(data === -2){
				    termsCheck.html('이미 회사를 등록하셨습니다').css('color', 'red');
				    return false;
			    }
			    if(data > 0){
				    location.href = '/ourmine/index';
			    }
		    })
		    
    }
    
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    

</script>
