import gleam/list
import gleam/string

pub fn abbreviate(phrase phrase: String) -> String {
  string.replace(phrase, "-", " ")
  |> string.replace("_", "")
  |> string.split(" ")
  |> list.fold("", fn(acc, word) {
    let letter =
      string.capitalise(word)
      |> string.drop_end(string.length(word) - 1)
    acc <> letter
  })
}
