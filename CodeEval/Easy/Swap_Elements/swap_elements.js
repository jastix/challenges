/**
 * Created by jastix on 31.10.13.
 * You are given a list of numbers which is supplemented with positions that have to be swapped.
 */
var fs  = require("fs");

// simple swapping through temp variable
function swapElements(arr, a, b) {
    var temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
    return arr;
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var arr,
            swapVar;

        arr = line.trim().split(' : ')[0].split(' ');
        swapVar = line.trim().split(' : ')[1].split(/,+[' ']/g);
        for (var i = 0; i < swapVar.length; i++) {
            arr = swapElements(arr, swapVar[i].toString().split('-')[0],
                                    swapVar[i].toString().split('-')[1]);
        }
        console.log(arr.join(' '));
    }
});
