import gleam/int

pub type Position {
  Position(row: Int, column: Int)
}

pub type Error {
  RowTooSmall
  RowTooLarge
  ColumnTooSmall
  ColumnTooLarge
}

pub fn create(queen: Position) -> Result(Nil, Error) {
  let Position(row: r, column: c) = queen
  case r, c {
    r, _ if r < 0 -> Error(RowTooSmall)
    r, _ if r > 7 -> Error(RowTooLarge)
    _, c if c < 0 -> Error(ColumnTooSmall)
    _, c if c > 7 -> Error(ColumnTooLarge)
    _, _ -> Ok(Nil)
  }
}

pub fn can_attack(
  black_queen black_queen: Position,
  white_queen white_queen: Position,
) -> Bool {
  black_queen.row == white_queen.row
  || black_queen.column == white_queen.column
  || int.absolute_value(black_queen.row - white_queen.row)
    == int.absolute_value(black_queen.column - white_queen.column)
}
