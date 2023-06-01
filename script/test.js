import { Octokit } from '@octokit/rest';

// Octokit.js
// https://github.com/octokit/core.js#readme
const octokit = new Octokit({
    auth: ''
})

const list_pr = await octokit.request('GET /repos/{owner}/{repo}/pulls', {
    owner: 'HisashiSawada0405',
    repo: 'terraform-test',
    state: 'open',
    head: 'HisashiSawada0405:main'
})

console.log(list_pr.status)
console.log(list_pr.data)

console.log(list_pr.length)

if (list_pr.data.length) {
    console.log("true.")
}else{
    console.log("false.")
}
