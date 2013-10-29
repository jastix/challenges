/**
 * Created by jastix on 29.10.13.
 * In this challenge you need to find the longest word in a sentence.
 * If the sentence has more than one word of the same length you should pick the first one.
 */
var fs  = require("fs");

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var result = line.trim().split(' ').reduce(function (prev, curr) {
            return prev.length >= curr.length ? prev : curr;
        });
        console.log(result);
    }
});
