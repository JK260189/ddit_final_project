<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
 #ww_ad40e8a9f03e3{
	border-radius: 5px;
} 
 #ww_2c9fbd10a49a7{
	border-radius: 5px;
} 
 .ww_current{
 	display: flex;
 	
 }
 .ww_temp{
 	flex:1; 
 	transform: scale(0.8)
 }
 .ww_icon{
 	flex:1;
 }
 .ww-box{
 	height: 92px;
 }

</style>

<!-- sidebar -->
<div class="d-flex flex-column h-100">
    <a href="/ourmine/index" class="mb-0 brand-icon">
        <span class="logo-icon" >	<!--  style="margin-left: 30px;" class="logo-icon" -->
           <img width="80" height="80" src="${cPath}/resources/images/sm/마스코트_투명.png">
        </span>
        <span class="logo-text">OURmine</span>
    </a>

    <!-- Menu: main ul -->
    <ul class="menu-list flex-grow-1 mt-3">
        <hr>
        <!-- OURmine 소개 -->
        <li class="collapsed">
            <a class="m-link" href="/ourmine/homepage">    <!-- active : 선택된 상황 -->
                <i class="icofont-monitor fs-4"></i> <span>OURmine</span>
            </a>
        </li>

        <hr>

        <!-- 구독상품 -->
        <li  class="collapsed">
            <a class="m-link"  href="/ourmine/subscribe/itemList.do">
                <i class="icofont-credit-card fs-4"></i><span>구독상품</span>
            </a>
        </li>

        <hr>

        <!-- 회원정보 -->
        <li class="collapsed">
            <a class="m-link" data-bs-toggle="collapse" data-bs-target="#membership-Components" href="#">
                <i class="icofont-address-book fs-4"></i> <span>회원정보</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span>
            </a>
            <!-- Menu: Sub menu ul -->
            <ul class="sub-menu collapse" id="membership-Components">
                <li><a class="ms-link" href="/ourmine/company/companyList"> <span>회사</span></a></li>
                <li><a class="ms-link" href="/ourmine/member/memberList"> <span>회원</span></a></li>
            </ul>
        </li>

        <hr>

        <!-- 공지게시판 -->
        <li class="collapsed">
            <a class="m-link" data-bs-toggle="collapse" data-bs-target="#notice-Components" href="#">
                <i class="icofont-ui-clip-board fs-4"></i> <span>공지게시판</span> <span class="arrow icofont-dotted-down ms-auto text-end fs-5"></span>
            </a>
            <!-- Menu: Sub menu ul -->
            <ul class="sub-menu collapse" id="notice-Components">
                <li><a class="ms-link" href="/ourmine/noticeBoard/noticeBoardList"> <span>공지게시판</span></a></li>
                <li><a class="ms-link" href="/ourmine/noticeBoard/fnqNoticeboardList" > <span>F&Q</span></a></li>	<!-- FNQ내용 -->
            </ul>
        </li>
        
    </ul>
    <hr>
		<div>
		    <!-- ============= 날씨 ========================= -->
		    <!-- <div id="ww_ad40e8a9f03e3" v='1.3' loc='id' a='{"t":"ticker","lang":"ko","sl_lpl":1,"ids":["wl2308"],"font":"Arial","sl_ics":"one","sl_sot":"celsius","cl_bkg":"rgba(255,255,255,1)","cl_font":"rgba(88,89,126,1)","cl_cloud":"rgba(163,158,158,1)","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>Weather Data Source: <a href="https://wetterlabs.de/wetter_daejeon/woche/" id="ww_ad40e8a9f03e3_u" target="_blank">7 tage wetter Daejeon</a></div><script async src="https://app1.weatherwidget.org/js/?id=ww_ad40e8a9f03e3"></script> -->
		    <div id="ww_2c9fbd10a49a7"  v='1.3' loc='id' a='{"t":"horizontal","lang":"ko","sl_lpl":1,"ids":["wl2308"],"font":"Arial","sl_ics":"one","sl_sot":"celsius","cl_bkg":"rgba(255,255,255,1)","cl_font":"rgba(68,79,113,1)","cl_cloud":"rgba(191,191,191,1)","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722","el_phw":3,"el_whr":1}'>Weather Data Source: <a href="https://wetterlabs.de/wetter_daejeon/woche/" id="ww_2c9fbd10a49a7_u" target="_blank">wetter 7 tage Daejeon</a></div><script async src="https://app1.weatherwidget.org/js/?id=ww_2c9fbd10a49a7"></script> 
	    </div> 


       <!--  Body: Body -->
        <div class="body d-flex py-3" id="memoBody">
               <!--  <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div id="memoDiv" class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">메모장</h3>
                            <div class="col-auto d-flex">
                                <button type="button" class="btn btn-secondary btn-todo-hide" onclick="toggleHide()">모두 지우기</button>
                            </div>
                        </div>
                    </div>
                </div> Row end  -->
                <div class="row mb-3">
                    <div class="col-12">
                        <div id="memoBody" class="card my-todo">
                            <div class="card-header border-bottom-0 todo-wrapper">
                                <h5>메모장</h5>
                                <hr>
                                <div class="input-group mb-2">
                                    <input style="font-size: 13px" type="text" class="form-control" id="TodoInput" >
                                    <button type="button" class="btn btn-primary btn-todo-add">추가</button>
                                </div>
                                <span class="todo-error text-danger small ms-3" style="display: none;">내용이 없습니다!</span>
                            </div>
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-0 todo-list">
									
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!--  Row end  -->
        </div>

    <!-- Theme: Switch Theme -->
    <ul class="list-unstyled mb-0">
        <li class="d-flex align-items-center justify-content-center">
            <div class="form-check form-switch theme-switch">
                <input class="form-check-input" type="checkbox" id="theme-switch">
                <label class="form-check-label" for="theme-switch">Enable Dark Mode!</label>
            </div>
        </li>
        <li class="d-flex align-items-center justify-content-center">
            <div class="form-check form-switch theme-rtl">
                <input class="form-check-input" type="checkbox" id="theme-rtl">
                <label class="form-check-label" for="theme-rtl">Enable RTL Mode!</label>
            </div>
        </li>
    </ul>

    <!-- Menu: menu collepce btn -->
    <button type="button" class="btn btn-link sidebar-mini-btn text-light">
        <span class="ms-2"><i class="icofont-bubble-right"></i></span>
    </button>
</div>