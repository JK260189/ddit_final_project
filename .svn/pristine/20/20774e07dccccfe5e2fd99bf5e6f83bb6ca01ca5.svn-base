<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

    <h1>Git Commits</h1>

    <div>
        <label for="repository">Select Repository:</label>
        <select id="repository"></select>
    </div>

    <div>
        <h2>Commits:</h2>
        <ul id="commits"></ul>
    </div>

    <security:authentication property="principal" var="principal" />

<input id="projectIdHidden" type="hidden" value="${projectId }">
<input id="companyIdHidden" type="hidden" value="${companyId }">

    <script>

	    let projectIdHidden = document.querySelector('#projectIdHidden');
	    let companyIdHidden = document.querySelector('#companyIdHidden');

	    let projectIdHiddenValue = projectIdHidden.value;
	    let companyIdHiddenValue = companyIdHidden.value;
	    headers['Content-Type'] = 'application/json'
	    headers['accept'] = 'application/json'
	    let repositorySelect = document.getElementById('repository');
	    let commitsList = document.getElementById('commits');


	    async function gitHubRequest() {
		    await axios.get(`/ourmine/company/\${companyIdHiddenValue}/project/\${projectIdHiddenValue}/git/gitHub`, {headers: headers})
			    .then(resp => {
				    let data = resp.data;
				    console.log('깃허브 요청', data)
				    // Populate repositories dropdown
				    createOption(data.repositories);
				    // Populate commits list
				    populateCommits(data.commits);
			    }).catch(error => console.log(error))
	    }

	    function populateCommits(commits) {
		    commits.forEach(commit => {
			    let li = document.createElement('li');
			    li.textContent = `Author: \${commit.author}, Message: \${commit.message}, Date: \${commit.date}`;
			    commitsList.appendChild(li);
		    });
	    }
	    function createOption(repositories) {
		    repositories.forEach(repo => {
			    let option = document.createElement('option');
			    option.value = repo;
			    option.text = repo;
			    repositorySelect.appendChild(option);
		    });
	    }

	    gitHubRequest();



    </script>