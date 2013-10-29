/**
 * Created by jastix on 29.10.13.
 * Having a string representation of a set of numbers you need to print this numbers.
 * All numbers are separated by semicolon.
 * There are up to 20 numbers in one line. The numbers are "zero" to "nine"
 */
var fs  = require("fs");

// mapping of words, which represent digits, to actual digits
function wordToDigit(word) {
    switch (word) {
        case 'zero':
            return 0;
        case 'one':
            return 1;
        case 'two':
            return 2;
        case 'three':
            return 3;
        case 'four':
            return 4;
        case 'five':
            return 5;
        case 'six':
            return 6;
        case 'seven':
            return 7;
        case 'eight':
            return 8;
        case 'nine':
            return 9;

    }
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var result = line.trim().split(';').map(wordToDigit).join('');
        console.log(result);
    }
});
