import gleam/list
import gleam/string

const lowercase_a = 97

const lowercase_z = 122

const digit_0 = 48

const digit_9 = 57

pub fn encode(phrase: String) -> String {
  string.lowercase(phrase)
  |> string.to_graphemes
  |> list.filter(is_alphanumeric)
  |> list.map(transform_char)
  |> list.sized_chunk(5)
  |> list.map(string.concat)
  |> string.join(" ")
}

pub fn decode(phrase: String) -> String {
  string.to_graphemes(phrase)
  |> list.filter(fn(c) { c != " " })
  |> list.map(transform_char)
  |> string.concat
}

fn transform_char(char: String) -> String {
  case string.to_utf_codepoints(char) {
    [cp] -> {
      let code = string.utf_codepoint_to_int(cp)
      case is_lowercase_letter(code) {
        True -> {
          let assert Ok(new_cp) = string.utf_codepoint(atbash_transform(code))
          string.from_utf_codepoints([new_cp])
        }
        False -> char
      }
    }
    _ -> char
  }
}

fn is_lowercase_letter(code: Int) -> Bool {
  code >= lowercase_a && code <= lowercase_z
}

fn atbash_transform(code: Int) -> Int {
  lowercase_a + lowercase_z - code
}

fn is_digit(code: Int) -> Bool {
  code >= digit_0 && code <= digit_9
}

fn is_alphanumeric(char: String) -> Bool {
  case string.to_utf_codepoints(char) {
    [cp] -> {
      let code = string.utf_codepoint_to_int(cp)
      is_lowercase_letter(code) || is_digit(code)
    }
    _ -> False
  }
}
