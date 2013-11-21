/**
 * Created by jastix on 21.11.13.
 * Write a program which swaps letters' case in a sentence.
 * All non-letter characters should remain the same
 */
var fs  = require("fs");

function swapCase(ch) {
    if (ch === ch.toUpperCase()) {
        return ch.toLowerCase();
    } else {
        return ch.toUpperCase();
    }
}
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
       var res = line.trim().split('').map(swapCase).join('');
       console.log(res);
    }
});
