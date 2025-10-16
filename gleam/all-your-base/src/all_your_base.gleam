import gleam/list
import gleam/result

pub type Error {
  InvalidBase(Int)
  InvalidDigit(Int)
}

pub fn rebase(
  digits digits: List(Int),
  input_base input_base: Int,
  output_base output_base: Int,
) -> Result(List(Int), Error) {
  case input_base < 2, output_base < 2 {
    True, _ -> Error(InvalidBase(input_base))
    _, True -> Error(InvalidBase(output_base))
    _, _ -> {
      use _ <- result.try(validate_digits(digits, input_base))
      parse_digits(digits, input_base, output_base)
    }
  }
}

fn validate_digits(digits: List(Int), input_base: Int) -> Result(Nil, Error) {
  list.try_each(digits, fn(digit) {
    case digit < input_base && digit >= 0 {
      True -> Ok(Nil)
      False -> Error(InvalidDigit(digit))
    }
  })
}

fn parse_digits(
  digits: List(Int),
  input_base: Int,
  output_base: Int,
) -> Result(List(Int), Error) {
  let output_digits =
    convert_to_base_10(digits, input_base)
    |> convert_to_output_base(output_base)
    |> list.reverse
  case list.is_empty(output_digits) {
    True -> Ok([0])
    _ -> Ok(output_digits)
  }
}

fn convert_to_base_10(digits: List(Int), input_base: Int) -> Int {
  list.fold(digits, 0, fn(acc, digit) { acc * input_base + digit })
}

fn convert_to_output_base(value: Int, output_base: Int) -> List(Int) {
  case value {
    0 -> []
    _ -> [
      value % output_base,
      ..convert_to_output_base(value / output_base, output_base)
    ]
  }
}
