/**
 * Created by jastix on 20.11.13.
 * Given a string comprising just of the characters (,),{,},[,]
 * determine if it is well-formed or not.
 */

var fs  = require("fs");

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line.trim() !== '') {
        var parens = line.trim().split('');
        var storage = [];
        var result = false;
        if (parens.length % 2 === 0) {
            for (var i = 0; i <= parens.length; i++) {
                //store opening brackets in a stack
                if (parens[i] === '(' || parens[i] === '{' || parens[i] === '[') {
                    storage.push(parens[i]);
                    // for each closing bracket check if previous bracket is opening.
                } else {
                    if (parens[i] === ')') {
                        result = (storage.pop() === '(');
                        if (!result) break;
                    } else if (parens[i] === '}') {
                        result = (storage.pop() === '{');
                        if (!result) break;
                    } else if (parens[i] === ']') {
                        result = (storage.pop() === '[');
                        if (!result) break;
                    } else if (parens.length === 0) {
                        result = false;
                    }
                }
            }
            };
        }
        console.log(result ? 'True' : 'False');
    }
);
