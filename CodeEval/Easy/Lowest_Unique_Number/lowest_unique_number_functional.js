/**
 * Created by jastix on 24.10.13.
 * There is a game where each player picks a number from 1 to 9, writes it on a paper and gives to a guide.
 * A player wins if his number is the lowest unique. We may have 10-20 players in our game.
 */
var fs  = require("fs");

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        line = line.trim().split(' ');

        var hash, unique, result;
        // create a hash where key is a value from the original array
        // and value is number of occurrences of that value
        // e.g., { '1': 3, '2': 2, '8': 3, '9': 3 }
        hash = line.reduce(function (prev, curr) {
            if (curr in prev) {
                prev[curr]++;
            } else {
                prev[curr] = 1;
            }
            return prev;
        }, {});

        // filter array of keys from hash to contain only unique numbers
        // apply Math.min to the resulting array to find minimal value.
        // set initial value to 10 since it is more than we can have.
        unique = Object.keys(hash).filter(function (itm) {
            return hash[itm] === 1;
        }).reduce(function (prev, curr) {
            return Math.min(prev, curr);
            }, 10);

        result = line.indexOf(unique.toString()) + 1;
        console.log(result);
    }
});
