public static class ScrabbleScore
{
  public static int Score(string input)

  {
    var scoreBoard = new Dictionary<int, char[]>
    {
      [1] = ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
      [2] = ['D', 'G'],
      [3] = ['B', 'C', 'M', 'P'],
      [4] = ['F', 'H', 'V', 'W', 'Y'],
      [5] = ['K'],
      [8] = ['J', 'X'],
      [10] = ['Q', 'Z'],
    };
    // build Dictionairy
    return Score(input, scoreBoard);
  }

  public static int Score(string input, Dictionary<int, char[]> alpha)
  {
    
  }
}
