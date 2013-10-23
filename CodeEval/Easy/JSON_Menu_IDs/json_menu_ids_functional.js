/**
 * Created by jastix on 23.10.13.
 * You have JSON string which describes a menu.
 * Calculate the SUM of IDs of all "items" in case a "label" exists for an item
 */
var fs  = require("fs");

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {

        var parsedLine = JSON.parse(line);

        // checks if an item is present and if it has property 'label'
        function isNotNull(item){
            return (item && item.label);
        }

        // remove (filter) all elements that are null or do not have a property 'label'
        // then for each element add value of a key 'id' to accumulator 'prevValue'
        // initial value is zero. Without it, the function would fail on empty array.
        var result = parsedLine.menu.items.filter(isNotNull).reduce(function(prevValue, currValue){
            return prevValue + currValue.id;
        }, 0);
        console.log(result);
    }
});
