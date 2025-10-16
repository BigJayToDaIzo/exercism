import gleam/list

pub type NestedList(a) {
  Null
  Value(a)
  List(List(NestedList(a)))
}

pub fn flatten(nested_list: NestedList(a)) -> List(a) {
  do_flatten([], nested_list)
  |> list.reverse
}

fn do_flatten(acc: List(a), nested_list: NestedList(a)) -> List(a) {
  case nested_list {
    Null -> acc
    Value(item) -> [item, ..acc]
    List(items) ->
      list.fold(items, acc, fn(acc, item) { do_flatten(acc, item) })
  }
}
