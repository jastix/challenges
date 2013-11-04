/**
 * Created by jastix on 04.11.13.
 * You are given two sequences. Write a program to determine
 * the longest common subsequence between the two strings
 * (each string can have a maximum length of 50 characters).
 * NOTE: This subsequence need not be contiguous.
 * The input file may contain empty lines, these need to be ignored
 */
var fs  = require("fs");
function longestCommonSubsequence(string1, string2) {
    return lcs(string1, string2, string1.length, string2.length);
}

function lcs(string1, string2, str1Length, str2Length) {
    var x = [],
        y = [],
        str = [];

    // create 2d array and fill it with 0's
    x = Array.apply(null, new Array(str1Length)).map(Number.prototype.valueOf, 0);
    for (var i = 0; i <= str1Length; i++){
        x[i] = Array.apply(null, new Array(str2Length)).map(Number.prototype.valueOf, 0);
    }

    for (var i = str1Length; i >= 0; i--) {
        for (var j = str2Length; j >= 0; j--) {
            if (i == str1Length || j == str2Length) {
                x[i][j] = 0;
            }
            else if (string1[i] == string2[j]) {
                x[i][j] = 1 + x[i+1][j+1];
            } else {
                x[i][j] = Math.max(x[i+1][j], x[i][j+1]);
            }
        }
    }
    // to find just a length of the subsequence return x[0][0]
    // return x[0][0];

    // code to find common characters
    var k = 0,
        l = 0;

    while (k < str1Length && l < str2Length) {
        if (string1[k] == string2[l]) {
            str.push(string1[k]);
            k++;
            l++;
        } else if (x[k+1][l] >= x[k][l+1]){
            k++;
        } else {
            l++;
        }
    }
    return str.join('');
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var lines = line.trim().split(';');
        var result = longestCommonSubsequence(lines[0], lines[1]);
        console.log(result);
    }
});
