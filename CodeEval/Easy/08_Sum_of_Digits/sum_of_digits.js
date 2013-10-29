/**
 * Created by jastix on 29.10.13.
 *
 * Given a positive integer, find the sum of its constituent digits.
 */
var fs  = require("fs");

// fix parseInt to work with map.
function returnInt(element) {
    return parseInt(element, 10);
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var result = line.trim().split('').map(returnInt).reduce(function (prev, curr) {
            return prev + curr;
        });
        console.log(result);
    }
});


