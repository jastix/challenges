var fs = require("fs");                                                                                   ;

var elements = [];
var el_length,
    dict,
    result;

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line !== '') {
    elements = line.split(',');
    el_length = Math.floor(elements.length/2);
    dict = elements.reduce(function (map, num) {
        map[num] = (map[num] || 0) + 1;
        return map;
    }, Object.create(null));
    result = Object.keys(dict).filter(function(el) {
        return dict[el] > el_length
    });
    console.log(result[0] === undefined ? "None": result.toString());
  }

});
