<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<style>
	.pagination {
		display: flex;
		justify-content: center;
	}
</style>
<!-- 설렉트박스 -->
<div class="d-flex justify-content-end">
	<div class="dropdown">
		<button class="btn btn-primary dropdown-toggle companySelect" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
			전체
		</button>
		<ul class="dropdown-menu border-0 shadow p-3 companyList">

		</ul>
	</div>
</div>


<div class="row clearfix">
	<div class="col-md-12">
		<div class="card border-0 mb-4 no-bg">
			<div class="card-header py-3 px-0 d-flex align-items-center  justify-content-between border-bottom">
				<h3 class=" fw-bold flex-fill mb-0">가입 신청자</h3>
			</div>
		</div>
	</div>
</div><!-- Row End -->


	<div class="row clearfix g-3">
		<div class="col-sm-12">
			<div class="card mb-3">
				<div class="card-body">
					<input type="hidden" class="form-control" placeholder="Search" id="searchIssue" >
					<table id="myProjectTable" class="table table-hover align-middle mb-0" style="width: 100%">
						<thead>
						<tr>
							<th>회사 이름</th>
							<th>회원 이름</th>
							<th>대기 상태</th>
							<th>가입/거절</th>
						</tr>
						</thead>
						<tbody id="memberList">
						<tr style="display: none">
							<th>회사 이름</th>
							<th>회원 이름</th>
							<th>대기 상태</th>
							<th>가입/거절</th>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<nav aria-label="Page navigation example">
	<ul class="pagination">
		<li class="page-item" id="previousPage"><a class="page-link" href="#">Previous</a></li>
		<li class="page-item" style="display: flex" id="pageContainer"><a class="page-link" href="#">1</a></li>
		<li class="page-item" id="nextPage"><a class="page-link" href="#">Next</a></li>
	</ul>
</nav>


<script>
	const member1 = {
		memberId  : '',
	}
	headers['accept'] = 'application/json';
	headers['Content-Type'] = 'application/json';
	let companyList = document.querySelector('.companyList');
	let memberList = document.querySelector('#memberList');
	let companySelect = document.querySelector('.companySelect');
	let selectedCompanyId = 0;
	async   function adminCompanyList(){
		await 	axios.get('/ourmine/company/requstStatusOption',{headers:headers})
				.then(resp => {
					let data = resp.data;
					console.log("리퀘스트데이터 = ",data)
					companyList.innerHTML = createOption(data);
				})
	}

	let currentPageIndex = 0; // 페이지 번호 배열의 시작 인덱스를 표시
	let pageSize = 3; // 한 페이지에 표시되는 데이터의 개수
	let displayPageCount = 5; // 한 번에 표시되는 페이지 번호의 개수
	let pagesArray = []; // 페이지 번호 배열을 전역 변수로 선언

	async function adminCompanyMemberList(){
		await axios.get('/ourmine/company/companyMemberListJson', {headers: headers})
				.then(resp => {
					let data = resp.data;
					console.log("companyMemberListJson = ", data)
					let totalItems = (data[0] && data[0].totalData) ? data[0].totalData : 0; // 총 데이터 개수
					let totalPages = Math.ceil(totalItems / pageSize); // 총 페이지 개수
					pagesArray = Array.from({length: totalPages}, (_, i) => i + 1); // 페이지 번호 배열 생성
					memberList.innerHTML += createMemberCards(data);
					displayPages();
				})
	}

	function displayPages() {
		// 데이터가 없는 경우 페이지네이션을 그리지 않음
		if (pagesArray.length === 0) {
			document.querySelector('#pageContainer').innerHTML = '';
			document.querySelector('#previousPage').style.visibility = 'hidden';
			document.querySelector('#nextPage').style.visibility = 'hidden';
			return;
		}

		// 시작 인덱스부터 표시할 페이지 개수만큼의 페이지 번호를 가져옴
		let pagesToDisplay = pagesArray.slice(currentPageIndex, currentPageIndex + displayPageCount);
		console.log("pagesToDisplay = ", pagesToDisplay)
		console.log("currentPageIndex",currentPageIndex)
		console.log("displayPageCount",displayPageCount)
		document.querySelector('#previousPage').style.visibility = (currentPageIndex > 0) ? 'visible' : 'hidden';
		document.querySelector('#nextPage').style.visibility = (currentPageIndex + displayPageCount < pagesArray.length) ? 'visible' : 'hidden';
		document.querySelector('#pageContainer').innerHTML = pagesToDisplay
				.map(pageNumber => `<a href="#" data-page="\${pageNumber}" class="page-link pageItems">\${pageNumber}</a>`)
				.join('');
		setPageItemsEvent(); // 페이지 아이템들에 이벤트 리스너 설정
	}

	document.querySelector('#nextPage').addEventListener('click', () => {
		currentPageIndex += displayPageCount; // 페이지 번호 배열의 시작 인덱스를 변경
		displayPages(); // 다음 페이지 번호들을 표시
		setPageItemsEvent(); // 페이지 아이템들에 이벤트 리스너 설정
		// 버튼 그룹
		fetchDataForPage(pagesArray[currentPageIndex]);
	});

	document.querySelector('#previousPage').addEventListener('click', () => {
		currentPageIndex -= displayPageCount; // 페이지 번호 배열의 시작 인덱스를 변경
		if(currentPageIndex < 0) { // 시작 인덱스가 0보다 작아지는 것을 방지
			currentPageIndex = 0;
		}
		displayPages(); // 이전 페이지 번호들을 표시
		setPageItemsEvent(); // 페이지 아이템들에 이벤트 리스너 설정
		// 버튼 그룹
		fetchDataForPage(pagesArray[currentPageIndex + displayPageCount - 1]);
	});

	function setPageItemsEvent() {
		let pageItems = document.querySelectorAll('.pageItems');
		console.log("pageItems = ", pageItems);
		pageItems.forEach(item => {
			item.addEventListener('click', (e) => {
				let {page} = e.target.dataset;
				console.log("page = ", page)
				fetchDataForCompany(selectedCompanyId, page);
			});
		});
	}
	function fetchDataForPage(pageNumber) {
		fetchDataForCompany(selectedCompanyId, pageNumber); //
	}
	function companyListMember(){
		let companyListItem = document.querySelectorAll('.companyListItem');
		companyListItem.forEach(item => {
			item.addEventListener('click', (e) => {
				companySelect.innerHTML =  e.target.innerHTML
				selectedCompanyId = e.target.dataset.company;
				console.log("selectedCompanyId = ", selectedCompanyId);
				currentPageIndex = 0; // 페이지 번호 배열의 시작 인덱스를 0으로 재설정
				fetchDataForCompany(selectedCompanyId, 1); // 첫 페이지의 회사 데이터 가져오기
			})
		})
	}
	function fetchDataForCompany(companyId, pageNumber) {
		console.log("requestId = ",companyId)
		axios.get('/ourmine/company/companyMemberListJson',{
			params : {
				requestId : companyId,
				page: pageNumber,
			}
		},{headers:headers})
				.then(resp => {
					let data = resp.data;
					memberList.innerHTML = createMemberCards(data);
					// 총 데이터 개수를 기반으로 페이지 수 다시 계산
					let totalItems = (data[0] && data[0].totalData) ? data[0].totalData : 0;
					let totalPages = totalItems > 0 ? Math.ceil(totalItems / pageSize) : 0;
					// 데이터가 없으면 pagesArray를 빈 배열로 설정
					pagesArray = totalItems > 0 ? Array.from({length: totalPages}, (_, i) => i + 1) : [];
					// 페이지네이션 업데이트
					displayPages();
				})
	}

	// 이벤트 위임을 사용하여 companyListItem에 대한 이벤트 핸들러를 설정합니다.
	companyList.addEventListener('click', (e) => {
		if (e.target.matches('.companyListItem')) {
			companySelect.innerHTML =  e.target.innerHTML;
			selectedCompanyId = e.target.dataset.company;
			console.log("selectedCompanyId = ", selectedCompanyId);
			currentPageIndex = 0; // 페이지 번호 배열의 시작 인덱스를 0으로 재설정
			fetchDataForCompany(selectedCompanyId, 1); // 첫 페이지의 회사 데이터 가져오기
		}
	});

	// 이벤트 위임을 사용하여 accept에 대한 이벤트 핸들러를 설정합니다.
	memberList.addEventListener('click', (e) => {
		if (e.target.matches('.accept')) {
			const memberId = e.target.dataset.memberid;
			member1.memberId = memberId;
			console.log("memberId", memberId);
			axios.post('/ourmine/company/companyMemberInsert', member1, {headers: headers})
					.then(resp => {
						let data = resp.data;
						if (data > 0) {
							console.log("insert성공", data);
							Swal.fire({
								icon: 'success',
								title: '가입 승인하였습니다.',
								confirmButtonText: '확인',
							});
							// 페이지를 다시 로드합니다.
							fetchDataForCompany(selectedCompanyId, currentPageIndex + 1);
						}
					});
		}
	});

	// 이벤트 위임을 사용하여 acceptCancel에 대한 이벤트 핸들러를 설정합니다.
	memberList.addEventListener('click', (e) => {
		if (e.target.matches('.acceptCancel')) {
			const memberId = e.target.dataset.memberid;
			member1.memberId = memberId;
			console.log("memberId", memberId);
			axios.post('/ourmine/company/companyMemberRefuse', member1, {headers: headers})
					.then(resp => {
						let data = resp.data;
						if (data > 0) {
							console.log("update성공", data);
							Swal.fire({
								icon: 'success',
								title: '가입 거절하였습니다.',
								confirmButtonText: '확인',
							});
							// 페이지를 다시 로드합니다.
							fetchDataForCompany(selectedCompanyId, currentPageIndex + 1);
						}
					});
		}
	});
	// 첫 페이지 로딩시 데이터를 가져옵니다.
	adminCompanyList().then(adminCompanyMemberList).then(displayPages);







	function createOption(data){
		let content = '';
		content += `<li><button class="dropdown-item py-2 rounded companyListItem" href="#">전체</button></li>`
		data.map(item => {
			content += `<li><button data-company=\${item.requestStatusId} class="dropdown-item py-2 rounded companyListItem" href="#">\${item.requestStatus}</button></li>`
		})
		return content;
	}





	function createMemberCards(data) {
		console.log("회원 상태 = ", data);
		let content = '';
		data.map(item => {
			content += `
            <tr>
                <td>\${item.companyName}</td>
                <td>\${item.memberName}</td>
                <td>\${item.requestStatus}</td>
                <td>\${item.requestStatus === '승인됨' ?
                    `<button type="button" data-memberid=\${item.memberId} class="btn btn-outline-secondary acceptCancel">거절</button>` :
                    `<button type="button" data-memberid=\${item.memberId} class="btn btn-outline-secondary accept">수락</button>`
                }</td>
            </tr>
        `;
		})
		return content;
	}



</script>