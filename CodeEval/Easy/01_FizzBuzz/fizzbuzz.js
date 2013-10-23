var fs  = require("fs");

var fizzbuzz = function (a, b, n) {
  var result = [];

  for (var i = 1; i <= n; i++) {
    if (i % (a * b) === 0) {
      result.push('FB');
    } else if (i % a === 0) {
      result.push('F');
    } else if ( i % b === 0) {
      result.push('B');
    } else {
      result.push(i);
    }
  }
  return result.join(' ');
}
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line !== '') {
    var params = line.split(' ')
    console.log(fizzbuzz(params[0], params[1], params[2]))
  }
})

