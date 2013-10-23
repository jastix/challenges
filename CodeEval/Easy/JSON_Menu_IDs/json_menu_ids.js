/**
 * Created by jastix on 23.10.13.
 * You have JSON string which describes a menu.
 * Calculate the SUM of IDs of all "items" in case a "label" exists for an item
 */
var fs  = require("fs");

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var sum = 0;
        var parsedLine = JSON.parse(line);

        parsedLine.menu.items.forEach(function(item){
            if (item && item.label){
                sum += item.id;
            }
        });
        console.log(sum);
    }
});
