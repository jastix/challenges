/**
 * Created by jastix on 02.11.13.
 * Write a program to determine the sum of the first 1000 prime numbers.
 */

// use Sieve of Eratosthenes to find prime numbers
function primesGen(count) {
    var primes = [],
        isComposite = [],
        nextPrime,
        maxNum,
        stopAt;

    // estimate upper bound for prime numbers
    maxNum = parseInt(count * Math.log(count) + count * (Math.log(Math.log(count))), 10);

    // fill the array with false values
    isComposite = Array.apply(null, new Array(maxNum + 1)).map(Boolean.prototype.valueOf, false);

    // mark all even numbers
    for (var i = 4; i <= maxNum; i += 2) {
        isComposite[i] = true;
    }
    nextPrime = 3;
    stopAt = Math.sqrt(maxNum);
    while (nextPrime < stopAt) {
        for (var i = nextPrime * 2; i <= maxNum; i += nextPrime) {
            isComposite[i] = true;
        }

        nextPrime += 2;

        while ((nextPrime <= maxNum) && (isComposite[nextPrime])) {
            nextPrime += 2;
        }
    }

    // add all non-composite (prime) numbers to an array
    for (var i = 2; i <= maxNum && primes.length < count; i++) {
        if (!isComposite[i]) {
            primes.push(i);
        }
    }

    return primes;
}

var result = primesGen(1000).reduce(function (a, b) {
    return a + b;
});

console.log(result);
