pub const QueenError = error{
    InitializationFailure,
};

pub const Queen = struct {
    row: i8,
    col: i8,

    pub fn init(row: i8, col: i8) QueenError!Queen {
        if (row >= 0 and row < 8 and col >= 0 and col < 8) {
            return Queen{ .row = row, .col = col };
        }
        return QueenError.InitializationFailure;
    }

    pub fn canAttack(self: Queen, other: Queen) QueenError!bool {
        if (self.row == other.row and self.col == other.col) {
            return QueenError.InitializationFailure;
        }
        var sameRow: bool = self.row == other.row;
        var sameCol: bool = self.col == other.col;
        var diagonal: bool = abs(self.col - other.col) == abs(self.row - other.row);
        return sameRow or sameCol or diagonal;
    }

    fn abs(v: i8) i8 {
        if (v < 0) {
            return -v;
        }
        return v;
    }
};
