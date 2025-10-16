import dice_trio
import gleam/int
import gleam/io
import gleam/list
import gleam/string
import prng/random

pub type Character {
  Character(
    charisma: Int,
    constitution: Int,
    dexterity: Int,
    hitpoints: Int,
    intelligence: Int,
    strength: Int,
    wisdom: Int,
  )
}

pub fn generate_character() -> Character {
  let constitution = ability()
  Character(
    strength: ability(),
    dexterity: ability(),
    constitution:,
    intelligence: ability(),
    wisdom: ability(),
    charisma: ability(),
    hitpoints: 10 + modifier(constitution),
  )
}

pub fn modifier(score: Int) -> Int {
  let difference = score - 10
  case difference >= 0 {
    True -> difference / 2
    False -> { difference - 1 } / 2
  }
}

fn rng_fn(max: Int) -> Int {
  let roll = random.int(1, max)
  random.random_sample(roll)
}

pub fn ability() -> Int {
  let four_d_six_drop_one = dice_trio.detailed_roll("4d6", rng_fn)
  case four_d_six_drop_one {
    Ok(detailed_roll) -> {
      list.sort(detailed_roll.individual_rolls, by: int.compare)
      |> list.reverse
      |> list.drop(up_to: 1)
      |> list.fold(0, fn(acc, roll) { acc + roll })
    }
    Error(e) -> {
      io.println_error(
        "Warning: RNG engine failed during ability roll (error: "
        <> string.inspect(e)
        <> ") - using default value of 10",
      )
      // default value
      10
    }
  }
}
