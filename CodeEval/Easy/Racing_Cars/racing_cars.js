var fs = require("fs");                                                                                   ;

var currPass,
    indexUnder,
    direction,
    indexC,
    resultLine;
var prevPass = -1;

function findPass(line) {
    indexUnder = line.indexOf('_');
    indexC = line.indexOf('C');
    if (indexC >= 0){
        return indexC;
    } else {
        return indexUnder;
    }
};

function turn(currPass, prevPass) {
    if ((prevPass === currPass) || (prevPass < 0)) {
        return '|';
    } else if (currPass > prevPass) {
        return '\\';
    } else {
        return '/';
    }
}
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line !== '') {
    currPass = findPass(line);
    direction = turn(currPass, prevPass);
    resultLine = line.slice(0, currPass) + direction + line.slice(currPass + 1);
    prevPass = currPass;
    console.log(resultLine);
  }

});
