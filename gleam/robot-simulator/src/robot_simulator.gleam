import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction:, position:)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  list.fold(
    string.to_graphemes(instructions),
    Robot(direction:, position:),
    fn(r, inst) {
      case inst {
        "L" -> turn_left(r)
        "R" -> turn_right(r)
        _ -> advance(r)
      }
    },
  )
}

fn turn_left(r: Robot) -> Robot {
  case r.direction {
    North -> Robot(..r, direction: West)
    South -> Robot(..r, direction: East)
    East -> Robot(..r, direction: North)
    West -> Robot(..r, direction: South)
  }
}

fn turn_right(r: Robot) -> Robot {
  case r.direction {
    North -> Robot(..r, direction: East)
    South -> Robot(..r, direction: West)
    East -> Robot(..r, direction: South)
    West -> Robot(..r, direction: North)
  }
}

fn advance(r: Robot) -> Robot {
  case r.direction {
    North -> Robot(..r, position: Position(..r.position, y: r.position.y + 1))
    South -> Robot(..r, position: Position(..r.position, y: r.position.y - 1))
    East -> Robot(..r, position: Position(..r.position, x: r.position.x + 1))
    West -> Robot(..r, position: Position(..r.position, x: r.position.x - 1))
  }
}
