var fs = require("fs");                                                                                   ;
function getDistance(data) {
  return data[1];
};

function returnInt(element) {
    return parseInt(element, 10);
};

function compareNumbers(a, b) {
  return a - b;
};

function splitMap(elem) {
    return elem.split(',');
};
function isEmpty(arr) {
    return !(arr.length < 2);
};

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line !== '') {
    var results = [];
    cities = line.trim().split(';').map(splitMap).filter(isEmpty).map(getDistance);
    cities.map(returnInt).sort(compareNumbers).reduce(function(prev, curr, idx, arr){
        results.push(curr - prev)
        return arr[idx]
    }, 0);
    console.log(results.toString())
  }
});
