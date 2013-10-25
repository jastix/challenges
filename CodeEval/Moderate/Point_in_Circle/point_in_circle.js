/**
 * Created by jastix on 25.10.13.
 * Having coordinates of the center of a circle, it's radius and coordinates of a point
 * you need to define whether this point is located inside of this circle.
 */

var fs  = require("fs");

function isOdd(el, idx) {
    return (idx % 2) !== 0;
}

// use Pythagoras and measure distance between a given dot and the center of the circle.
// the distance should be less than radius, then the dot is within the circle.
function inCircle(center_x, center_y, radius, x, y) {
    var dist = Math.pow((x - center_x), 2) + Math.pow((y - center_y), 2);
    return dist < Math.pow(radius, 2);
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    "use strict";
    if (line.trim() !== '') {
        var center_x, center_y, radius, x, y, values;

        // split each string by ';', then split each set of values by ':'
        // then flatten resulting array and return only odd-indexed values
        values = line.trim().split(';').map(function (obj) {
            return obj.trim().split(':');
        }).reduce(function (a, b) {
                return a.concat(b);
            }).filter(isOdd);

        center_x = parseFloat(values[0].replace(/[()]/g, '').split(',')[0]);
        center_y = parseFloat(values[0].replace(/[()]/g, '').split(',')[1]);
        radius = parseFloat(values[1]);
        x = parseFloat(values[2].replace(/[()]/g, '').split(',')[0]);
        y = parseFloat(values[2].replace(/[()]/g, '').split(',')[1]);

        console.log(inCircle(center_x, center_y, radius, x, y));
    }

});
