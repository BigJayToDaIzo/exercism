import gleam/int

pub type Item {
  Item(value: Int, weight: Int)
}

pub fn maximum_value(items: List(Item), maximum_weight: Int) -> Int {
  case items {
    [] -> 0
    [head, ..tail] if head.weight <= maximum_weight -> {
      let take_it =
        head.value + maximum_value(tail, maximum_weight - head.weight)
      let leave_it = maximum_value(tail, maximum_weight)
      int.max(take_it, leave_it)
    }
    [_, ..tail] -> maximum_value(tail, maximum_weight)
  }
}
