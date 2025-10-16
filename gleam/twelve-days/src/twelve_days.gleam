import gleam/int
import gleam/list
import gleam/string

pub fn verse(number: Int) -> String {
  let ordinal = ordinal_name(number)
  let gifts = build_gifts(number)
  "On the " <> ordinal <> " day of Christmas my true love gave to me: " <> gifts <> "."
}

pub fn lyrics(from starting_verse: Int, to ending_verse: Int) -> String {
  list.range(starting_verse, ending_verse)
  |> list.map(verse)
  |> string.join("\n")
}

fn ordinal_name(n: Int) -> String {
  case n {
    1 -> "first"
    2 -> "second"
    3 -> "third"
    4 -> "fourth"
    5 -> "fifth"
    6 -> "sixth"
    7 -> "seventh"
    8 -> "eighth"
    9 -> "ninth"
    10 -> "tenth"
    11 -> "eleventh"
    12 -> "twelfth"
    _ -> int.to_string(n)
  }
}

fn gift_name(n: Int) -> String {
  case n {
    1 -> "a Partridge in a Pear Tree"
    2 -> "two Turtle Doves"
    3 -> "three French Hens"
    4 -> "four Calling Birds"
    5 -> "five Gold Rings"
    6 -> "six Geese-a-Laying"
    7 -> "seven Swans-a-Swimming"
    8 -> "eight Maids-a-Milking"
    9 -> "nine Ladies Dancing"
    10 -> "ten Lords-a-Leaping"
    11 -> "eleven Pipers Piping"
    12 -> "twelve Drummers Drumming"
    _ -> ""
  }
}

fn build_gifts(day: Int) -> String {
  case day {
    1 -> gift_name(1)
    _ -> {
      list.range(2, day)
      |> list.reverse()
      |> list.map(gift_name)
      |> string.join(", ")
      |> fn(gifts) { gifts <> ", and " <> gift_name(1) }
    }
  }
}
