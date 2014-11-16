// You are given a text. Write a program which outputs its lines according to the following rules:
//
// If line length is ≤ 55 characters, print it without any changes.
// If the line length is > 55 characters, change it as follows:
// Trim the line to 40 characters.
// If there are spaces ‘ ’ in the resulting string, trim it once again to the last space (the space should be trimmed too).
// Add a string ‘... <Read More>’ to the end of the resulting string and print it.

var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  var line = line.trim()
  if (line.length > 55) {
      line = line.slice(0, 40)
      if (line.indexOf(' ') != -1) {
        line = line.slice(0, line.lastIndexOf(' '))
      }
      line += '... <Read More>'
    }
  console.log(line)
});
