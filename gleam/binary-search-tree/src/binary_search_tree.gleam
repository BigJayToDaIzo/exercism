import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  list.fold(data, Nil, insert)
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  to_tree(data)
  |> sort_tree
}

fn sort_tree(tree: Tree) -> List(Int) {
  case tree {
    Nil -> []
    Node(data:, left:, right:) -> {
      let left_side = sort_tree(left)
      let right_side = sort_tree(right)
      list.flatten([left_side, [data], right_side])
    }
  }
}

fn insert(tree: Tree, value: Int) -> Tree {
  case tree {
    Nil -> Node(data: value, left: Nil, right: Nil)
    Node(data, left, right) ->
      case value <= data {
        True -> Node(data:, left: insert(left, value), right:)
        False -> Node(data:, left:, right: insert(right, value))
      }
  }
}
