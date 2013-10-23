/*
 *Sum of Integers from File*
 Challenge Description:

 Print out the sum of integers read from a file.
 Input sample:

 The first argument to the program will be a text file containing a positive integer, one per line. e.g.

 5
 12

 Output sample:

 Print out the sum of all the integers read from the file.
 e.g.

 17
 */
var fs  = require("fs");
function returnInt(el) {
  return parseInt(el, 10);
}
var sum = fs.readFileSync(process.argv[2]).toString().split('\n').filter(function(e){
  return e;
}).map(parseFloat).reduce(function (a, b) {
  return a + b;
});
console.log(sum);

