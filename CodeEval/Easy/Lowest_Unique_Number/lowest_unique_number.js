/**
 * Created by jastix on 24.10.13.
 * There is a game where each player picks a number from 1 to 9, writes it on a paper and gives to a guide.
 * A player wins if his number is the lowest unique. We may have 10-20 players in our game.
 */
var fs  = require("fs");

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        line = line.trim().split(' ');

        // create a hash where key is a value from the original array
        // and value is number of occurrences of that value
        // e.g., { '1': 3, '2': 2, '8': 3, '9': 3 }
        var hash = line.reduce(function (prev, curr) {
            if (curr in prev) {
                prev[curr]++;
            } else {
                prev[curr] = 1;
            }
            return prev;
        }, {});

        // filter array of keys from hash to contain only unique numbers
        var unique = Object.keys(hash).filter(function (itm) {
            return hash[itm] === 1;
        });
        // possibly reduce could be used, but it requires initial value for empty array
        // if initial value is zero, then it will always be the lowest value.
        var uniqueValue;

        // check if returned value is not Infinity.
        // Math.min.apply returns Infinity for empty array.
        if (isFinite(Math.min.apply(Math, unique))) {
            uniqueValue = Math.min.apply(Math, unique);
        } else {
            uniqueValue = 0;
        }

        var result = line.indexOf(uniqueValue.toString()) + 1;
        console.log(result);
    }
});
