public class Player
{
  public int RollDie()
  {
    var rng = new Random();
    return rng.Next(1, 19);
  }

  public double GenerateSpellStrength()
  {
    var rng = new Random();
    return rng.NextDouble() * 100;
  }
}
