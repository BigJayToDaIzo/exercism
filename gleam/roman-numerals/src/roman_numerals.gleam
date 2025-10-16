pub fn convert(number: Int) -> String {
  let mappings = [
    #(1000, "M"),
    #(900, "CM"),
    #(500, "D"),
    #(400, "CD"),
    #(100, "C"),
    #(90, "XC"),
    #(50, "L"),
    #(40, "XL"),
    #(10, "X"),
    #(9, "IX"),
    #(5, "V"),
    #(4, "IV"),
    #(1, "I"),
  ]
  do_convert(mappings, number, "")
}

fn do_convert(mappings: List(#(Int, String)), n: Int, acc: String) -> String {
  case mappings {
    [#(value, symbol), ..] if value <= n ->
      do_convert(mappings, n - value, acc <> symbol)
    [_, ..rest] -> do_convert(rest, n, acc)
    [] -> acc
  }
}
