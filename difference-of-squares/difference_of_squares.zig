const math = @import("std").math;

pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;
    for (0..number + 1) |n| {
        sum += n;
    }
    return math.pow(usize, sum, 2);
}

pub fn sumOfSquares(number: usize) usize {
    var sumSqr: usize = 0;
    for (0..number + 1) |n| {
        sumSqr += math.pow(usize, n, 2);
    }
    return sumSqr;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
