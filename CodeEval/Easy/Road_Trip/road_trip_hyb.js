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
    cities = line.split(';').map(splitMap).filter(isEmpty).map(getDistance).
               map(returnInt).concat(0).sort(compareNumbers);
    for (var i = 1, l = cities.length; i < l; i++) {
        results.push(cities[i] - cities[i-1]);
    }
    console.log(results.join(','));
  }
});
