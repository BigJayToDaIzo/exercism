import gleam/list

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  case colors {
    [first, second, third, ..] -> {
      let base = color_to_int(first) * 10 + color_to_int(second)
      let exp = color_to_int(third)
      Ok(build_resistance(exp, base))
    }
    _ -> Error(Nil)
  }
}

fn build_resistance(exp: Int, base: Int) -> Resistance {
  case exp {
    e if e >= 9 -> Resistance("gigaohms", base * power_of_10(e - 9))
    e if e >= 6 -> Resistance("megaohms", base * power_of_10(e - 6))
    e if e >= 3 -> Resistance("kiloohms", base * power_of_10(e - 3))
    _ -> {
      let total = base * power_of_10(exp)
      case total >= 1000 {
        True -> Resistance("kiloohms", total / 1000)
        False -> Resistance("ohms", total)
      }
    }
  }
}

fn power_of_10(n: Int) -> Int {
  list.repeat(10, n)
  |> list.fold(1, fn(acc, x) { acc * x })
}

fn color_to_int(c: String) -> Int {
  case c {
    "black" -> 0
    "brown" -> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    _ -> 9
  }
}
