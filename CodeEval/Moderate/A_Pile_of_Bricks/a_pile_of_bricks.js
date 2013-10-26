/**
 * Created by jastix on 26.10.13.
 * You have a pile of bricks. Every brick has it's index number and coordinates of opposite vertices.
 * You know that somewhere on the wall there is a rectangular hole,
 * and you are given coordinates of opposite vertices of that hole.
 * Determine which bricks may pass through that hole.
 * In situations where brick and hole have an equal sizes, we assume that it can pass through this hole.
 * All of the bricks represent a rectangular boxes
 */

var fs  = require("fs");

// calculate distance between two points
function calcDistance(x1, y1, x2, y2) {
    return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
}

function isSuitableForHole(holeDist, brickDist) {
    "use strict";
    return brickDist <= holeDist;
}

function returnInt(element) {
    return parseInt(element, 10);
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    "use strict";
    if (line.trim() !== '') {
        var hole = {},
            holeCoord,
            bricks,
            holeDist,
            holeCoordRegExp,
            bricksCoordRegExp,
            suitableBricks = [];
        console.log("Line: " + line);
        // define Regular Expression to match numerical data about a hole
        holeCoordRegExp = /\d+|[+|-]\d+/g;

        holeCoord = line.trim().split('|')[0].match(holeCoordRegExp);

        // parse coordinates for the hole
        hole.x1 = parseInt(holeCoord[0], 10);
        hole.y1 = parseInt(holeCoord[1], 10);
        hole.x2 = parseInt(holeCoord[2], 10);
        hole.y2 = parseInt(holeCoord[3], 10);

        // calculate distance between two points for the hole
        holeDist = calcDistance(hole.x1, hole.y1, hole.x2, hole.y2);

        // define Regular Expression to match numerical data about each brick
        bricksCoordRegExp = /[+|-]\d+|\d+(?=\s)|\d+(?=,|\])/g;

        bricks = line.trim().split('|')[1].split(';');

        bricks.forEach(function (brick) {
            var brickCoord = brick.match(bricksCoordRegExp).map(returnInt);
            var brickDist = calcDistance(brickCoord[1], brickCoord[2], brickCoord[4], brickCoord[5]);
            if (isSuitableForHole(holeDist, brickDist)) {
                suitableBricks.push(brickCoord[0]);
            }
        });

        if (suitableBricks.length === 0) {
            console.log('-');
        } else {
            console.log(suitableBricks.join(','));
        }
    }
});
