console.log('process.env.TOKEN:');
console.log(process.env.TOKEN);

// Initialize Github API Library
var Github = require('github-api');
var github = new Github({
  token: process.env.TOKEN,
  auth: 'oauth'
});
console.log('github:');
console.log(github);

// Repository API
var repo = github.getRepo('zeero', 'zeero_work');
console.log('repo:');
console.log(repo);
repo.show(function(err, data){
  if (err) { console.log('err: ' + err); }
  console.log('repo_show:');
  console.log(data.full_name);
});

// Read file
var fs = require('fs');
fs.readFile('./test.txt', 'utf8', function(err, text) {
  if (err) { console.log('err: ' + err); }
  console.log('text:');
  console.log(text);
  repo.write('gh-pages', 'text.txt', text, 'add test.txt', function(err, sha) {
    if (err) { console.log('err: ' + JSON.stringify(err)); }
    console.log('sha:');
    console.log(sha);
  });
});

// repo.read('gh-pages', 'index.html', function(err, data) {
//   if (err) { console.log('err: ' + err); }
//   console.log('read:');
//   console.log(data);
// });
//
// repo.write('gh-pages', 'text.txt', 'testtest', 'add test.txt', function(err, sha) {
//   if (err) { console.log('err: ' + JSON.stringify(err)); }
//   console.log('sha:');
//   console.log(sha);
// });
//
