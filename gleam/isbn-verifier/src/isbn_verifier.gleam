import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn is_valid(isbn: String) -> Bool {
  isbn
  |> preprocess
  |> validate_length
  |> result.try(validate_x_pos)
  |> result.try(strings_to_ints)
  |> result.map(verifier)
  |> result.unwrap(False)
}

fn preprocess(isbn: String) -> List(String) {
  isbn
  |> string.replace(each: "-", with: "")
  |> string.to_graphemes
}

fn validate_x_pos(isbn: List(String)) -> Result(List(String), Nil) {
  case list.contains(isbn, "X") {
    False -> Ok(isbn)
    True -> {
      case list.last(isbn) {
        Ok("X") -> Ok(isbn)
        _ -> Error(Nil)
      }
    }
  }
}

fn validate_length(isbn: List(String)) -> Result(List(String), Nil) {
  case list.length(isbn) == 10 {
    True -> Ok(isbn)
    _ -> Error(Nil)
  }
}

fn verifier(isbn: List(Int)) -> Bool {
  let sum =
    list.zip(isbn, list.range(10, 1))
    |> list.fold(0, fn(acc, tup) { acc + tup.0 * tup.1 })
  sum % 11 == 0
}

fn strings_to_ints(isbn: List(String)) -> Result(List(Int), Nil) {
  list.try_fold(isbn, [], fn(acc, str) {
    case int.parse(str), str == "X" {
      Ok(i), False -> Ok([i, ..acc])
      _, True -> Ok([10, ..acc])
      _, _ -> Error(Nil)
    }
  })
}
