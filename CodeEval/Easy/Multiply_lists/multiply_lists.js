/**
 * Created by jastix on 10.11.13.
 * You have 2 lists of positive integers.
 * Write a program which multiplies corresponding elements in these lists.
 */

var fs  = require("fs");

// fix parseInt to work with map.
function returnInt(element) {
    return parseInt(element, 10);
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var vals = line.trim().split('|');

        // find numbers on left and right sides
        var vals1 = vals[0].match(/\d+/g).map(returnInt);
        var vals2 = vals[1].match(/\d+/g).map(returnInt);

        var res = vals1.map(function (el, idx) {
            return el * vals2[idx];
        });

        console.log(res.join(' '));
    }
});
