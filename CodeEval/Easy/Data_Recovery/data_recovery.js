var fs = require("fs");                                                                                   ;

var words,
    hints,
    result;

function returnInt(element) {
    return parseInt(element, 10);
}

function findMissingIdx(arr, maxEl) {
    for (var i = 1; i <= maxEl; i++) {
        if (arr.indexOf(i) === -1 ){
            return i;
        }
    }
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line !== '') {
    result = []
    splitLine = line.split(';');
    words = splitLine[0].split(' ');
    length = words.length;
    hints = splitLine[1].split(' ').map(returnInt);
    hints.push(findMissingIdx(hints, length));
    for (var i = 0; i < length; i++) {
        result[hints[i]] = words[i];
    }
    console.log(result.join(' '));
  }

});
