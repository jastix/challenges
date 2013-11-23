/**
 * Created by jastix on 23.11.13.
 * Write a program to determine the shortest repetition in a string.
 * A string is said to have period p if it can be formed by
 * concatenating one or more repetitions of another string of length p.
 * For example, the string "xyzxyzxyzxyz" has period 3,
 * since it is formed by 4 repetitions of the string "xyz".
 * It also has periods 6 (two repetitions of "xyzxyz") and
 * 12 (one repetition of "xyzxyzxyzxyz").
 */
var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var pattern = "";
        var regExp = new RegExp("^(" + pattern + ")+$");
        var chars = line.trim().split("");

        //regexp should be recompiled
        for (var i = 0; i < chars.length; i++) {
            if (line.trim().match(regExp) === null) {
                pattern += chars[i];
                regExp = new RegExp("^(" + pattern + ")+$");

            } else {
                break;
            }
        }

        console.log(pattern.length);
    }
});
