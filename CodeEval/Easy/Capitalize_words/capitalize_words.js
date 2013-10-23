//*Challenge Description:*
//Write a program which capitalizes words in a sentence.
//*Input sample:*
//Your program should accept as its first argument a path to a filename.
//Input example is the following
// ========
//Hello world
//javaScript language
//a letter
// ========
//
//*Output sample:*
//Print capitalized words in the following way:
// ========
//Hello World
//JavaScript Language
//A Letter
// ========
//
var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line !== "") {
    answer_line = line.split(' ').map(function(word){
      return word.charAt(0).toUpperCase() + word.slice(1);
    }).join(' ');
    console.log(answer_line);
  }
 });
