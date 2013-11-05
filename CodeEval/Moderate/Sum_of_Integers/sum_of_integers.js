/**
 * Created by jastix on 05.11.13.
 * Write a program to determine the largest sum
 * of contiguous integers in a list.
 */
var fs  = require("fs");

// fix parseInt to work with map.
function returnInt(element) {
    return parseInt(element, 10);
}

// use Kadane's algorithm.
// It returns 0 if max sum is negative.
function maxSubArray(arr) {
    var maxEndingHere = 0,
        maxSoFar = 0;
    arr.forEach(function (el) {
        maxEndingHere = Math.max(0, maxEndingHere + el);
        maxSoFar = Math.max(maxSoFar, maxEndingHere);
    });
    return maxSoFar;
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        console.log(maxSubArray(line.trim().split(',').map(returnInt)));
    }
});
