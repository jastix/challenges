var fs = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line !== " ") {
      answer_line = line.split(' ').reverse().join(' ');
      console.log(answer_line);
     }
});
