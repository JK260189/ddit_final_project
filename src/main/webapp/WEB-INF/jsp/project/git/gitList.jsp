<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gitgraph.js/1.11.4/gitgraph.min.js"></script>

<style>
	.grid-container {
		display: grid;
/* 		grid-template-columns: 1fr 380px; */
		grid-gap: 50px;
		grid-template-areas:
			"main main main right"
			"left left bottom right"
            "left left bottom right";
        justify-content: center;
        align-items: stretch;
	}

	.grid-main {
		grid-area: main;
	}

	.grid-right {
		grid-area: right;
	}

	.grid-left-bottom {
		grid-area: left;
	}

	.grid-main-bottom {
		grid-area: bottom;
	}

	#overlay {
		position: fixed; /* Fixed position */
		z-index: 9999; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
	}
</style>

<div id="loading" style="display: none">
<div class="grid-container">
	<div class="grid-main mt-3">
		<canvas id="gitGraph">

	   </canvas>
	</div>


	<div class="card card-chat border-right border-top-0 border-bottom-0 w450 grid-right mt-3">
		<div class="px-4 py-3 py-md-4">
			<div class="input-group mb-3">
				<input type="text" class="form-control mb-1" placeholder="Search...">
			</div>

			<div class="nav nav-pills justify-content-between text-center" role="tablist">
				<a class="flex-fill rounded border-0 nav-link active"
					data-bs-toggle="tab" href="#chat-recent" role="tab"
					aria-selected="true">커밋 히스토리</a>
				<a class="flex-fill rounded border-0 nav-link" data-bs-toggle="tab"
					href="#chat-groups" role="tab" aria-selected="false">프로젝트 깃허브</a>
			</div>
		</div>

		<div class="tab-content border-top">
			<div class="tab-pane fade show active" id="chat-recent" role="tabpanel">
				<ul class="list-unstyled list-group list-group-custom list-group-flush mb-0 gitMemberCommit">


				</ul>
			</div>
			<div class="tab-pane fade" id="chat-groups" role="tabpanel">
				<ul class="list-unstyled list-group list-group-custom list-group-flush mb-0 gitHub-addr">

				</ul>
			</div>
			<div class="tab-pane fade" id="chat-contact" role="tabpanel">
				<ul class="list-unstyled list-group list-group-custom list-group-flush mb-0">
					<li class="list-group-item px-md-4 py-3 py-md-4">
						<a href="javascript:void(0);" class="d-flex">
						<img class="avatar rounded-circle"  width="200" height="200" src="${cPath}/resources/images/xs/마스코트_투명.png" alt="">
							<div class="flex-fill ms-3 text-truncate">
								<div class="d-flex justify-content-between mb-0">
									<h6 class="mb-0">Hannah Gill</h6>
									<div class="text-muted">
										<i class="fa fa-heart-o pl-2 text-danger"></i>
										<i class="fa fa-trash pl-2 text-danger"></i>
									</div>
								</div>
								<span class="text-muted">hannahgill@my-Task.com</span>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>


	<div class="col-lg-12 flex-column grid-left-bottom">
		<div class="row g-3">

			<div class="col-md-12">
				<div class="card">
					<div class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
						<h6 class="mb-0 fw-bold ">브랜치 현황</h6>
					</div>
					<div class="card-body">
						<div class="row g-2 row-deck">
							<div class="col-md-6 col-sm-6">
								<div class="card">
									<div class="card-body ">
										<i class="icofont-checked fs-3"></i>
										<h6 class="mt-3 mb-0 fw-bold small-14">커밋 갯수</h6>
										<span class="text-muted commitCount">400</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="card">
									<div class="card-body ">
										<i class="icofont-usb fs-3"></i>
										<h6 class="mt-3 mb-0 fw-bold small-14">병합 횟수</h6>
										<span class="text-muted merged">17</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="card">
									<div class="card-body ">
										<i class="icofont-crown-king fs-3"></i>
										<h6 class="mt-3 mb-0 fw-bold small-14">커밋왕</h6>
										<span class="text-muted commitKing">06</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="card">
									<div class="card-body ">
										<i class="icofont-architecture-alt fs-3"></i>
										<h6 class="mt-3 mb-0 fw-bold small-14">현재 에러 브랜치</h6>
										<span class="text-muted errorBranch">14</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</div>


			<div class="card grid-main-bottom">
				<div class="card-body">
					<h6 class="mb-3 fw-bold ">언어</h6>
					<div class="d-flex justify-content-end text-center">
						<div id="incomeanalytics11" class="p-3">

						</div>
					</div>
				</div>
			</div>
</div>

</div>
<!-- The Modal -->
<div class="modal fade" id="staticBackdropLive" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLiveLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLiveLabel">토큰을 입력해주세요</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<input id="userInput" type="text" class="form-control mb-1" placeholder="Search...">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="submitButton">전송</button>
			</div>
		</div>
	</div>
</div>

<div id="loadingImage" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 999999;">
	<img src="${cPath}/resources/images/Github.gif" alt="Loading..." />
</div>
<div id="overlay"></div>






<security:authentication property="principal" var="principal" />

<input id="projectIdHidden" type="hidden" value="${projectId }">
<input id="companyIdHidden" type="hidden" value="${companyId }">






<script>
	  let gitMemberCommit = document.querySelector('.gitMemberCommit');
  let projectIdHidden = document.querySelector('#projectIdHidden');
  let companyIdHidden = document.querySelector('#companyIdHidden');
	  let commitCount = document.querySelector('.commitCount');
	  let merged = document.querySelector('.merged');
	  let commitKing = document.querySelector('.commitKing');
	  let errorBranch = document.querySelector('.errorBranch');
	  let gitHubAddr = document.querySelector('.gitHub-addr');
	  let userInput = document.querySelector('#userInput');
  let projectIdHiddenValue = projectIdHidden.value;
  let companyIdHiddenValue = companyIdHidden.value;

	 let loading  = document.querySelector('#loading');

  headers['Content-Type'] = 'application/json'
  headers['accept'] = 'application/json'

	  $(document).ready(function() {
		  $('#staticBackdropLive').on('hide.bs.modal', function () {
			  let loadingImage = document.getElementById('loadingImage');
			  let overlay = document.getElementById('overlay');
			  loadingImage.style.display = "none";
			  overlay.style.display = "none";
		  });
	  });

	  document.addEventListener("DOMContentLoaded", function() {
		  let myModal = document.getElementById('staticBackdropLive')
		  let modal = new bootstrap.Modal(myModal, {
			  keyboard: false
		  });


		  modal.show();

		  document.getElementById('submitButton').addEventListener('click', function() {
			  modal.hide();
			  let loadingImage = document.getElementById('loadingImage');
			  let overlay = document.getElementById('overlay');
			  loadingImage.style.display = "block";
			  overlay.style.display = "block";
			  setTimeout(function() {
				  loadingImage.style.display = "none";
				  overlay.style.display = "none";
				  loading.style.display = 'block';
				  promiseControl();
			  }, 4000);
		  });
	  });

async function branch(){
await 	axios.get(`/ourmine/company/\${companyIdHiddenValue}/project/\${projectIdHiddenValue}/git/gitListJson`, {headers : headers})
			.then(resp => {
				let data = resp.data;
				console.log("git data :", data);

				// 사용자 정의 템플릿 생성
				let myTemplateConfig = {
					colors: ["#979797", "#008fb5", "#f1c109"], // 브랜치 색상 설정
					branch: {
						lineWidth: 10,
						spacingX: 20,
						mergeStyle: "bezier",
						showLabel: true,  // 레이블 표시 설정
						label: {
							color: "blue",
							strokeColor: "black",
							strokeWidth: 2,
							fontSize: "10pt",
							fontFamily: "Courier New"  // 레이블 폰트 변경
						},
					},
					commit: {
						spacingY: -20,
						dot: {
							size: 12,
						},
						message: {
							displayAuthor: false,
							displayBranch: false,
							displayHash: false,
							font: "normal 12pt Arial",
							color: "black",
						},
					},
				};

				let myTemplate = new GitGraph.Template(myTemplateConfig);

				// GitGraph 인스턴스 생성 시 사용자 정의 템플릿 적용
				let gitgraph = new GitGraph({template: myTemplate, mode: "compact", orientation: "horizontal", elementId: "gitGraph"});

				// main 브랜치 생성
				let main = gitgraph.branch("main");

// data를 시간 순으로 정렬
				data.sort((a, b) => new Date(a.commitDate) - new Date(b.commitDate));

// 브랜치를 담을 객체
				let branches = {};

// data 순회하면서 브랜치와 커밋 생성
				data.forEach((commitData, index) => {
					let branchName = commitData.branchName;

					// BRANCH_FROM에 해당하는 브랜치를 parentBranch로 설정
					let parentBranch = branches[commitData.branchFrom];

					// 브랜치가 존재하지 않으면 생성
					if (!branches[branchName]) {
						// 부모 브랜치가 있으면 해당 브랜치에서 새 브랜치 생성
						if (parentBranch) {
							branches[branchName] = parentBranch.branch(branchName);
						} else {
							branches[branchName] = gitgraph.branch(branchName);
						}
					}

					// 해당 브랜치에 커밋
					branches[branchName].commit({
						message: `Commit by \${commitData.memberName} at \${commitData.commitMessage} : \${commitData.commitDate} `,
						detailId: commitData.gitId,  // optional, adds hyperlinks to commits
						author: commitData.memberName,  // optional, specify the author of the commit
					});

					// IS_MERGED 값이 1이면 해당 브랜치를 MERGE_BRANCH_NAME으로 병합
					if (commitData.isMerged == 1) {
						let mergeBranch = branches[commitData.mergeBranchName];
						if (mergeBranch) {
							mergeBranch.merge(branches[branchName], `Merge \${commitData.memberName}'s work into \${commitData.mergeBranchName}`);
						}
					}
				})
				gitHubAddr.innerHTML = memberGitHubAddr(data);
			});
}


async function memberCommitData(){
 await 	axios.get(`/ourmine/company/\${companyIdHiddenValue}/project/\${projectIdHiddenValue}/git/gitMemberCommitSelect`, {headers : headers})
			.then(resp => {
				let data = resp.data;
					gitMemberCommit.innerHTML = createListMember(data)
			})
}

async function branchStatus(){
	await axios.get(`/ourmine/company/\${companyIdHiddenValue}/project/\${projectIdHiddenValue}/git/gitCommitCount`, {headers : headers})
			.then(resp => {
				let data = resp.data;
				console.log("branchStatus =", data)
				commitCount.innerHTML = data.reduce((sum, git) => sum + git.commitCount,0);
				merged.innerHTML = data[0].isMerged;
				commitKing.innerHTML =  data.reduce((maxId, obj) => (maxId.value > obj.value ? maxId : obj.memberName), data[0].memberName);
				errorBranch.innerHTML = data[0].errorBranch;
			})
}

	  function createListMember(item) {
		  let content = '';
		 item.map(user => {
			 content +=   `<li class="list-group-item px-md-4 py-3 py-md-4">
				<a href="javascript:void(0);" class="d-flex">
					<img class="avatar rounded-circle" src="\${user.imageContents}" alt="">
					<div class="flex-fill ms-3 text-truncate">
						<h6 class="d-flex justify-content-between mb-0"><span>\${user.memberName}</span> <small class="msg-time">\${user.commitDate}</small></h6>
						<span class="text-muted">\${user.commitMessage}</span>
					</div>
				</a>
			</li>`;
		 })
		  return content;
	  }

	  function memberGitHubAddr(item){
	  		let content = '';
		  let uniqueMembers = item.filter((member, index, self) =>
						  index === self.findIndex((m) => (
								  m.gitHub === member.gitHub
						  ))
		  );
		  console.log("uniqueMembers = ", uniqueMembers)
		  uniqueMembers.map(user => {
			  content += `<a href="https://github.com/JJaeHwan/finalProject.git" target="_blank" rel="noopener noreferrer">
                    <li class="list-group-item px-md-4 py-3 py-md-4 ">
                        <div style="display: flex; align-items: center;">
                            <img src="${cPath}/resources/images/깃허브.png" style="margin-right: 10px;">
                            <div>ourmine</div>
                        </div>
                    </li>
                </a>`
		  })

		  return content;
	  }

	  function promiseControl(){
		  Promise.all([branch(), memberCommitData(), branchStatus(),drawChart()])
				  .then(() => {
					  console.log('All tasks finished successfully.');
				  })
				  .catch((error) => {
					  console.error('An error occurred:', error);
				  });
	  }


	  function drawChart() {
		  return new Promise((resolve, reject) => {
			  $(document).ready(function() {
				  try {
					  let options = {
						  align: 'center',
						  series: [1500, 1200, 1100, 1000],
						  responsive: [{
							  breakpoint: 420,
							  options: {
								  chart: {
									  width: 200,
									  align: 'center',
								  },
								  legend: {
									  position: 'bottom',
									  markers: {
										  fillColors:'var(--chart-color1)'
									  },
									  labels: {
										  colors: 'var(--chart-color1)'
									  },
								  }
							  }
						  }],
						  chart: {
							  height: 336,
							  type: 'polarArea',
							  toolbar: {
								  show: false,
							  },
						  },
						  labels: ['JavaScript', 'Java', 'Css',  'HTML' ],
						  fill: {
							  opacity: 1,
							  colors: ['var(--chart-color1)', 'var(--chart-color2)', 'var(--chart-color3)',  'var(--chart-color5)'],
						  },
						  stroke: {
							  width: 1,
							  colors: undefined
						  },
						  yaxis: {
							  show: false
						  },
						  legend: {
							  position: 'bottom', // left, right, top, bottom
							  horizontalAlign: 'center',  // left, right, center
						  },
						  plotOptions: {
							  polarArea: {
								  rings: {
									  strokeWidth: 0
								  }
							  }
						  },
						  theme: {
							  monochrome: {
								  enabled: true,
								  shadeTo: 'light',
								  shadeIntensity: 0.6
							  }
						  }
					  };
					  let chart = new ApexCharts(document.querySelector("#incomeanalytics11"), options);
					  chart.render();

					  resolve();  // Promise가 성공적으로 완료되었음을 알립니다.
				  } catch (error) {
					  reject(error);  // 문제가 발생했음을 알립니다.
				  }
			  });
		  });
	  }







  </script>
