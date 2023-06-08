<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .grid-container {
        display: grid;
        grid-template-columns: 1fr 300px;
        grid-template-areas: "main  main right"
                                "main main  right"
    ;
        height: 100vh;
        align-items: center; /* 이 부분을 추가합니다 */
    }

    .grid-main {
        grid-area: main;
    }

    .grid-right {
        grid-area: right;
    }
</style>

 <button type="button" class="btn btn-dark btn-set-task w-sm-100" data-bs-toggle="modal" data-bs-target="#tickadd"><i class="icofont-plus-circle me-2 fs-6"></i>부서 추가</button>
 <button type="button" class="btn btn-dark btn-set-task w-sm-100" data-bs-toggle="modal" data-bs-target="#tickaddDelete"><i class="icofont-minus-circle me-2 fs-6"></i>부서 삭제</button>
 <button type="button" class="btn btn-dark btn-set-task w-sm-100" data-bs-toggle="modal" data-bs-target="#tickaddUpdate"><i class="icofont-exchange me-2 fs-6"></i>부서 수정</button>




<!--    ========================================================    -->


<div class="grid-container">
    <div id="chart_div" class="grid-main">


    </div>


    <!--조직도를 클릭시 나올 네비게이션바 -->
    <div class="gird-right" style="display: none">
        <div
                class="card card-chat border-right border-top-0 border-bottom-0  w380 grid-right">
            <div class="px-4 py-3 py-md-4">
                <div class="input-group mb-3" style="display: flex; justify-content: right">
                    <button type="button" class="btn btn-secondary navBtnCancel" data-bs-dismiss="modal">닫기</button>
                </div>

                <div class="nav nav-pills justify-content-between text-center"
                     role="tablist">
                    <a class="flex-fill rounded border-0 nav-link active" data-bs-toggle="tab" href="#chat-recent" role="tab" aria-selected="true">부서인원</a>
                    <a class="flex-fill rounded border-0 nav-link" data-bs-toggle="tab" href="#chat-contact" role="tab" aria-selected="false">직원 추가</a>
                    <a class="flex-fill rounded border-0 nav-link" data-bs-toggle="tab" href="#chat-groups" role="tab" aria-selected="false">상급 부서 수정</a>
                </div>
            </div>

            <div class="tab-content border-top">
                <div class="tab-pane fade show active" id="chat-recent"
                     role="tabpanel">
                    <ul
                            class="list-unstyled list-group list-group-custom list-group-flush mb-0 orgMemberList">
                    </ul>
                </div>
                <div class="tab-pane fade" id="chat-groups" role="tabpanel">
                    <ul class="list-unstyled list-group list-group-custom list-group-flush mb-0">
                        <select class="form-select orgSenior">

                        </select>
                    </ul>
                    <div style="display: flex; justify-content: right">
                        <br>
                        <br>
                    <button type="button" class="btn btn-dark btn-set-task w-sm-100 seniorOrgInsert" data-bs-toggle="modal" data-bs-target="#">상급 부서 수정</button>
                    </div>
                </div>
                <div class="tab-pane fade" id="chat-contact" role="tabpanel">
                    <ul class="list-unstyled list-group list-group-custom list-group-flush mb-0 memberCheckList">

                    </ul>
                    <div style="display: flex; justify-content: center;">

                        <ul class="pagination">
                            <li class="page-item" id="previousPage"><a class="page-link" href="#">이전</a></li>
                            <li class="page-item" id="nextPage"><a class="page-link" href="#">다음</a></li>
                        </ul>
                    </div>
                    <div style="display: flex; justify-content: right">
                    <button type="button" class="btn btn-dark btn-set-task w-sm-100 memberOrgInsert" data-bs-toggle="modal" data-bs-target="#">인원 추가</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!--부서추가 -->
<form class="addInsertForm">
<div class="modal fade" id="tickadd" tabindex="-1"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title  fw-bold" id="leaveaddLabel"> 부서 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="sub" class="form-label">부서이름</label>
                    <input type="text" class="form-control orgAddInput" id="sub">
                    <span id="textCheck"></span>
                </div>

                <div class="mb-3">
                    <label  class="form-label">상위 부서 선택</label>
                    <select class="form-select orgInsertSelect">

                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary addBtnCancel" data-bs-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary">만들기</button>
            </div>
        </div>
    </div>
    </div>
</form>

<!--부서삭제 -->
<form class="addDeleteForm">
    <div class="modal fade" id="tickaddDelete" tabindex="-1"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-md modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title  fw-bold" id="leaveaddLabelDelete"> 부서 삭제</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label  class="form-label">부서 선택</label>
                        <select class="form-select orgDeleteSelect">

                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary deleteBtnCancel" data-bs-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary">삭제하기</button>
                </div>
            </div>
        </div>
    </div>
</form>



<!--부서수정 -->
<form class="addUpdateForm">
    <div class="modal fade" id="tickaddUpdate" tabindex="-1"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-md modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title  fw-bold" id="leaveaddUpdate">부서 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label  class="form-label"> 부서 선택</label>
                        <select class="form-select orgUpdateSelect">

                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="sub" class="form-label">수정하실 부서이름</label>
                        <input type="text" class="form-control orgUpdateInput" >
                        <span id="textCheckUpdate"></span>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary updateBtnCancel" data-bs-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary">수정하기</button>
                </div>
            </div>
        </div>
    </div>
</form>





<script>
	const companyId = ${companyId};
	let subBtn = document.querySelector('.sub-btn');
	let subAdd = document.querySelector('.sub-add');
	let orgInsertSelect = document.querySelector('.orgInsertSelect'); // 설렉트 옵션
	let addInsertForm = document.querySelector('.addInsertForm'); // 부서추가버튼
	let orgAddInput = document.querySelector('.orgAddInput'); //
	let addBtnCancel = document.querySelector('.addBtnCancel'); // 부서추가 취소버튼
	let deleteBtnCancel = document.querySelector('.deleteBtnCancel'); // 부서삭제 취소버튼
	let orgMemberList = document.querySelector('.orgMemberList'); // 멤버리스트
	let addDeleteForm = document.querySelector('.addDeleteForm'); //
	let orgDeleteSelect = document.querySelector('.orgDeleteSelect'); //
	let updateBtnCancel = document.querySelector('.updateBtnCancel'); //
	let orgUpdateSelect = document.querySelector('.orgUpdateSelect'); //
	let addUpdateForm = document.querySelector('.addUpdateForm');
	let orgUpdateInput = document.querySelector('.orgUpdateInput');
	let memberCheckList = document.querySelector('.memberCheckList');
	let memberOrgInsert = document.querySelector('.memberOrgInsert');
    let gridRight = document.querySelector('.gird-right');
    let orgSenior = document.querySelector('.orgSenior');
    let seniorOrgInsert = document.querySelector('.seniorOrgInsert');




	let modalElement = document.getElementById('tickadd'); // 부서추가 모달
	let modalElementUpdate = document.getElementById('tickaddUpdate'); // 부서수정 모달

	let checkedMembers = [];

	let orgIdMap = {};

	google.charts.load('current', {packages: ['orgchart']});
	google.charts.setOnLoadCallback(drawChart)

	let currentPage = 1; // 현재 페이지 번호
	let selectedOrgId = null; // 현재 선택된 조직의 ID
	document.getElementById("nextPage").addEventListener("click", function() {
		if (selectedOrgId !== null) { // 선택된 조직이 있는 경우에만
			currentPage++; // 페이지 번호 증가
			loadMemberList(currentPage, selectedOrgId); // 새로운 페이지 번호로 멤버 리스트 로드
		}
	});

	document.getElementById("previousPage").addEventListener("click", function() {
		if (selectedOrgId !== null && currentPage > 1) { // 선택된 조직이 있고, 첫 페이지가 아닌 경우에만
			currentPage--; // 페이지 번호 감소
			loadMemberList(currentPage, selectedOrgId); // 새로운 페이지 번호로 멤버 리스트 로드
		}
	});


	async function drawChart() {
		let orgData = [];
		await axios.get(`/ourmine/company/\${companyId}/orgchart/orgchartListJson`, {headers: headers})
			.then(resp => {
				org = [...resp.data];
				console.log("org = ", org);
				orgData = resp.data;
			});

		let data = new google.visualization.DataTable();
		data.addColumn('string', 'Name');
		data.addColumn('string', 'Manager');
		data.addColumn('string', 'ToolTip');

		orgData.forEach((item) => {
			orgIdMap[item.orgchartId.toString()] = item.orgchartId;
			data.addRow([
				{'v': item.orgchartId.toString(), 'f': item.departmentName.toString()},
				item.seniorDepartmentId ? item.seniorDepartmentId.toString() : null,
				item.departmentCreateDate.toString(),
			]);
		});

		let chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
		chart.draw(data, {
			allowHtml: true,
			size: 'large'
		})
        await createOrgSelectOptionsAjax(); // 부서추가 부서삭제 의 셀렉트 옵션을 만들어줌
		await deleteOrg();
		await updateOrg();
		await memberInsert();
		await addModelClose();
		await updateModelClose();
		await navCancel();



		google.visualization.events.addListener(chart, 'select',async () => {
			let selectedItem = chart.getSelection()[0];
			if (selectedItem) {
				let orgId = data.getValue(selectedItem.row, 0);
				 gridRight.style.display = 'block'; // 오타 수정
				selectedOrgId = orgIdMap[orgId]; // UI 상에서 누른 부서의 ID 값을 가져옴

				await loadMemberList(1, selectedOrgId);
				checkedMembers = [];
			}
		});
	}

	function memberCheck(org){
		let memberCheckListInput = document.querySelectorAll('.memberCheckListInput');
		memberCheckListInput.forEach(item => {
			let memberId = item.getAttribute('data-memberid');
			if (checkedMembers.find(member => member.memberId === memberId)) {
				item.checked = true;
			}
			item.addEventListener('change', (e) => {
				if (e.target.checked) {
					// 객체를 배열에 추가
					checkedMembers.push({ memberId: memberId ,orgchartId : org});
					console.log("추가배열",checkedMembers);
				} else {
						checkedMembers = checkedMembers.filter(member => member.memberId !== memberId);
						console.log("삭제배열",checkedMembers);
				}
            })
        });
    }
	function memberInsert(){
		memberOrgInsert.addEventListener('click', () => {
			console.log('클릭됏냐 = ',checkedMembers)
			axios.post(`/ourmine/company/\${companyId}/orgchart/orgchartMember`,checkedMembers,{headers:headers})
                .then(resp => {
					let data = resp.data;
	                console.log("멤버 인설트 데이터",data)
                    if(data > 0){
	                    Swal.fire({
		                    icon: 'success',
		                    title: '부서가 배정되었습니다.',
		                    confirmButtonText: '확인',
	                    })
		                gridRight.style.display = 'none'; // 오타 수정
	                    drawChart();
                    }
                })
		})
    }

	function navCancel(){
		document.querySelector('.navBtnCancel').addEventListener('click', () => {
			gridRight.style.display = 'none'; // 오타 수정
        })
    }



	seniorOrgInsert.addEventListener('click', () => {
			let senior = {
				companyId : companyId,
				orgchartId : '',
				seniorDepartmentId : '',
			}
			let option = orgSenior.options[orgSenior.selectedIndex];
			senior.seniorDepartmentId = option.getAttribute('data-orgid');
			senior.orgchartId = selectedOrgId;
			console.log("시니어 아이디", senior)
			axios.post(`/ourmine/company/\${companyId}/orgchart/orgchartSeniorUpdate`,senior,{headers:headers})
				.then(resp => {
					let data = resp.data;
					console.log("시니어 업데이트 데이터", data);
					if(data > 0){
						Swal.fire({
							icon: 'success',
							title: '상위 부서가 수정되었습니다..',
							confirmButtonText: '확인',
						})
						gridRight.style.display = 'none'; // 오타 수정
						drawChart();
					}
				})
        })




	// 멤버 리스트를 로드하는 함수입니다.
	async function loadMemberList(page, orgId) {
		const memberListOrg = {orgchartId : orgId, companyId : companyId};
		console.log("memberListOrg=", memberListOrg);
		await axios.post(`/ourmine/company/\${companyId}/orgchart/orgchartMemberListJson`, memberListOrg, {headers: headers})
			.then(resp => {
				let data = resp.data;
				orgMemberList.innerHTML = createListMember(data);
			});

		await axios.get(`/ourmine/company/\${companyId}/orgchart/orgchartSelectMemberList`, {
			params: {
				page: page,
				orgchartId: orgId,
			}
		}, {headers:headers})
			.then(resp => {
				let data = resp.data;
				memberCheckList.innerHTML = createMemberCheckList(data);
				memberCheck(orgId);
			});
        await axios.post(`/ourmine/company/\${companyId}/orgchart/orgchartSeniorList`,memberListOrg,{headers:headers})
            .then(resp => {
                let data = resp.data;
                orgSenior.innerHTML = createOrgSelectOptions(data);
            })
	}



	addInsertForm.addEventListener('submit', handleAddOrgSubmit);
   async function handleAddOrgSubmit(e){

			e.preventDefault();
			if(orgAddInput.value.trim() === ''){
				document.getElementById('textCheck').innerHTML = '부서 이름을 입력해주세요';
				document.getElementById('textCheck').style.color = 'red';
				return false;
            }
			let orgAddInputValue = orgAddInput.value;
			const org = {
                companyId : '',
				departmentName : '',
				seniorDepartmentId : '',
            }
		    let option = orgInsertSelect.options[orgInsertSelect.selectedIndex];
		    org.companyId = companyId;
		    org.departmentName =  orgAddInputValue;
            if(!option.getAttribute('data-orgid')){
                org.seniorDepartmentId = null;
            }else{
                org.seniorDepartmentId = option.getAttribute('data-orgid')
            }
		    console.log("추가 org =",org);
		await axios.post(`/ourmine/company/\${companyId}/orgchart/orgchartInsert`,org,{headers:headers})
                .then(resp => {
					let data = resp.data;
					if(data > 0){
						addBtnCancel.click();
						orgAddInput.value = '';
						Swal.fire({
							icon: 'success',
							title: '부서가 생성되었습니다.',
							confirmButtonText: '확인',
						})
						drawChart();
                    }
                })
        }


	async function deleteOrg(){
		addDeleteForm.addEventListener('submit', async (e) => {
			e.preventDefault();
			const org = {
				orgchartId : '',
			}
			let option = orgDeleteSelect.options[orgDeleteSelect.selectedIndex];
			org.orgchartId = option.getAttribute('data-orgid');
			console.log("삭제 org =",org);
			await axios.post(`/ourmine/company/\${companyId}/orgchart/orgchartDelete`,org,{headers:headers})
				.then(resp => {
					let data = resp.data;

					if(data > 0){
						deleteBtnCancel.click();
						Swal.fire({
							icon: 'success',
							title: '부서가 삭제되었습니다.',
							confirmButtonText: '확인',
						})
						drawChart();
					}
				})
		})
	}


	async function updateOrg(){
		addUpdateForm.addEventListener('submit', async (e) => {
			e.preventDefault();
			if(orgUpdateInput.value.trim() === ''){
				document.getElementById('textCheckUpdate').innerHTML = '부서 이름을 입력해주세요';
				document.getElementById('textCheckUpdate').style.color = 'red';
				return false;
			}
			let orgUpdateInputValue = orgUpdateInput.value;
			const org = {
				companyId : '',
				departmentName : '',
				orgchartId : '',
			}
			let option = orgUpdateSelect.options[orgUpdateSelect.selectedIndex];
			org.companyId = companyId;
			org.departmentName =  orgUpdateInputValue;
			org.orgchartId = option.getAttribute('data-orgid');
			console.log("추가 org =",org);
			await axios.post(`/ourmine/company/\${companyId}/orgchart/orgchartUpdate`,org,{headers:headers})
				.then(resp => {
					let data = resp.data;
					if(data > 0){
						updateBtnCancel.click();
						orgUpdateInput.value = '';
						Swal.fire({
							icon: 'success',
							title: '부서 이름이 변경 되었습니다.',
							confirmButtonText: '확인',
						})
						drawChart();
					}
				})
		})
	}





	// 추가 모달 닫기 누르면 부서 이름을 입력해주세요 이거 초기화 시켜주기
	function addModelClose(){
		modalElement.addEventListener('hidden.bs.modal', () => {
			orgAddInput.value = '';
			document.getElementById('textCheck').innerHTML = '';
		});
	}

	function updateModelClose(){
		modalElementUpdate.addEventListener('hidden.bs.modal', () => {
			orgUpdateInput.value = '';
			document.getElementById('textCheckUpdate').innerHTML = '';
		});
	}

	function createOrgSelectOptionsAjax(){
		axios.get(`/ourmine/company/\${companyId}/orgchart/orgchartListJson`,{headers: headers})
			.then(resp => {
				let data = resp.data;
				orgInsertSelect.innerHTML = createOrgSelectOptions(data);
				orgDeleteSelect.innerHTML = createOrgSelectOptions(data);
				orgUpdateSelect.innerHTML = createOrgSelectOptions(data);
			})
	}



	// 부서 생성모달 select 옵션 html 만들어 주는 함수
	function createOrgSelectOptions(data){
        let content = '';
		data.map(item => {
			if(item.seniorDepartmentId === null){
				console.log('최상위 부서 = ',item)
				content += `<option selected data-orgid=\${item.orgchartId}>\${item.departmentName}</option>`
			}else{
				content += `<option data-orgid=\${item.orgchartId}>\${item.departmentName}</option>`
            }
        })
        return content;
	}


	function createListMember(item) {
		let content = '';
		if(item.length ===0){
			content +=   `<li class="list-group-item px-md-4 py-3 py-md-4">
				<a href="javascript:void(0);" class="d-flex">
					<div class="flex-fill ms-3 text-truncate">
						<span class="text-muted"> 부서에 인원이 등록되어 있지않습니다 !</span>
					</div>
				</a>
			</li>`;
        }else{
			item.map(user => {
				let defaultImage = '${cPath}/resources/images/lg/마스코트_투명.png';
				content +=   `<li class="list-group-item px-md-4 py-3 py-md-4">
				<a href="javascript:void(0);" class="d-flex">
					<img class="avatar rounded-circle" src="\${user.imageContents !== null  ? user.imageContents : defaultImage}" alt="">
					<div class="flex-fill ms-3 text-truncate">
						<h6 class="d-flex justify-content-between mb-0"><span>\${user.memberName}</span> <small class="msg-time"></small></h6>
						<span class="text-muted">\${user.departmentName}</span>
					</div>
				</a>
			</li>`;
			})
        }

		return content;
	}

	function createMemberCheckList(item) {
		let content = '';
		if(item.length ===0){
			return ;
		}
		item.map(user => {
			let defaultImage = '${cPath}/resources/images/lg/마스코트_투명.png';
			content +=  `        <li class="list-group-item px-md-4 py-3 py-md-4">
                      <a href="javascript:void(0);" class="d-flex"> <img class="avatar rounded-circle" src="\${user.imageContents !== null  ? user.imageContents : defaultImage}" alt="">
                            <div class="flex-fill ms-3 text-truncate">
                                <div class="d-flex justify-content-between mb-0">
                                    <h6 class="mb-0">\${user.memberName}</h6>
                                    <div class="text-muted">
                                        <input data-memberid=\${user.memberId} class="memberCheckListInput" type="checkbox">
                                    </div>
                                </div>
                                <span class="text-muted">\${user.departmentName}</span>
                            </div>
                        </a>
                        </li>`
		})
		return content;
	}

</script>