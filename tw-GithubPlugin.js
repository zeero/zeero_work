console.log('process.env.TOKEN:');
console.log(process.env.TOKEN);

// Initialize Github API Library
var Github = require('github-api');
var github = new Github({ token: process.env.TOKEN });
console.log('github:');
console.log(github);

// Repository API
var repo = github.getRepo('zeero', 'zeero_work');
console.log('repo:');
console.log(repo);
repo.show(function(err, data){
  console.log('repo_show:');
  console.log(data.full_name);
  console.log('err: ' + err);
});

// Read file
var fs = require('fs');
fs.readFile('./index.html', 'utf8', function(err, text) {
  console.log('text:');
  console.log(text);
  console.log('err: ' + err);
});


