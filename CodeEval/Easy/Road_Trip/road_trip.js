var fs = require("fs");                                                                                   ;
function getDistance(data) {
  return data.trim().match(regexp);
};

function returnInt(element) {
    return parseInt(element, 10);
};

function compareNumbers(a, b) {
  return a - b;
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line !== '') {
    var distances = [];
    regexp = /\d+/g
    cities = line.trim().match(regexp).map(returnInt).concat(0).sort(compareNumbers);
    for (var i = 1, l = cities.length; i < l; i ++) {
      var curr = cities[i];
      var prev = cities[i-1];
      distances.push(curr - prev);
    }
    console.log(distances.toString())
  }
});
