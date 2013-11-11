/**
 * Created by jastix on 11.11.13.
 * You want to send your friend a package with different things.
 * Each thing you put inside of a package has such parameters as index number, weight and cost.
 * The package has a weight limitation.
 * Your goal is to determine which things to put into the package so that
 * the total weight is less than or equal to the package limit and
 * the total cost is as large as possible.
 * You would prefer to send a package which has less weight in case
 * there is more than one package with the same price.
 * This is a variation of Knapsack problem
 */
var fs  = require("fs");

// compare numeric values. First, compare by Value.
// if items have the same value, then compare by ValueToWeight ratio.
function compare(a, b) {
    if (a[2] === b[2]) {
        return b[3] - a[3];
    } else {
        return b[2] - a[2];
    }
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var totalCapacity = parseInt(line.trim().split(' : ')[0], 10);
        var items = [];
        var result = [];
        var things = line.trim().split(' : ')[1].split(' ');

        // parse values for items and make array of arrays
        things.forEach(function (el) {
            "use strict";
            var elems = el.split(',');
            var idx = parseInt(elems[0].match(/\d+/g), 10);
            var weight = parseFloat(elems[1]);
            var value = parseInt(elems[2].match(/\d+/g));
            var valToWeightRatio = value / weight;
            items.push([idx, weight, value, valToWeightRatio]);
        });

        // remove all overweight items and take items to fill totalCapacity
        items.sort(compare).filter(function (el) {
            return el[1] <= totalCapacity}).forEach(function (item) {
                "use strict";
                if (totalCapacity >= item[1]) {
                    result.push(item);
                    totalCapacity -= item[1];
                }
            });

        // print only '-' if there are no suitable items or
        // print only indexes of suitable items
        if (result.length < 1) {
            console.log('-')
        } else {
            console.log(result.map(function (el) { return el[0]}).join(','));
        }
    }
});
