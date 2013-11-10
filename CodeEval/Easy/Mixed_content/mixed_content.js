/**
 * Created by jastix on 10.11.13.
 * You have a string of words and digits divided by comma.
 * Write a program which separates words with digits.
 * You shouldn't change the order elements.
 */
var fs  = require("fs");

function isNotFinite(el) {
    return !isFinite(el);
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var words = line.trim().split(',').filter(isNotFinite);
        var numbers = line.trim().split(',').filter(isFinite);

        if ((words.length > 0) && (numbers.length > 0)) {
            console.log(words.join(',') + '|' + numbers.join(','));
        } else {
            console.log(words.concat(numbers).join(','));
        }
    }
});
