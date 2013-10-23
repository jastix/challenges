/**
 Penultimate Word
 Challenge Description:

 Write a program which finds the next-to-last word in a string.
 *Input sample:*

 Your program should accept as its first argument a path to a filename. Input example is the following

 some line with text
 another line

 Each line has more than one word.
 *Output sample:*

 Print the next-to-last word in the following way.

 with
 another

 */
var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line !== "") {
        var words = line.split(' ');
        var answer_line = words[words.length - 2];
        console.log(answer_line);
    }
})