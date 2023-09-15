pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) {
        return ComputationError.IllegalArgument;
    }
    var result: usize = number;
    var itter: usize = 0;
    while (result != 1) {
        switch (result % 2 == 0) {
            true => result /= 2,
            false => result = result * 3 + 1,
        }
        itter += 1;
    }
    return itter;
}
