import { Octokit } from '@octokit/rest';

// Octokit.js
// https://github.com/octokit/core.js#readme
const octokit = new Octokit({
    auth: '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'
})

const response = await octokit.request('GET /repos/{owner}/{repo}/pulls', {
    owner: 'HisashiSawada0405',
    repo: 'terraform-test',
    headers: {
        'X-GitHub-Api-Version': '2022-11-28'
    }
})

console.log(response)