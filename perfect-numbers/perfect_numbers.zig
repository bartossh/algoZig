pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    var sum: u64 = 0;
    for (1..n / 2 + 1) |candidate| {
        if (n % candidate == 0) {
            sum += candidate;
        }
    }
    if (sum < n) {
        return Classification.deficient;
    }
    if (sum > n) {
        return Classification.abundant;
    }
    return Classification.perfect;
}
