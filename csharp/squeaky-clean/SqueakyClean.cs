using System.Text;

public static class Identifier
{
  public static string Clean(string identifier)
  {
    StringBuilder sb = new();
    var capNext = false;
    foreach (char c in identifier)
    {
      if (c == '-')
      {
        capNext = true;
        continue;
      }
      else if (capNext)
      {
        capNext = false;
        sb.Append(char.ToUpper(c));
      }
      else if (char.IsControl(c))
        sb.Append("CTRL");
      else if (c == ' ')
        sb.Append('_');
      else if (char.IsLetter(c) && !IsGreekLower(c))
        sb.Append(c);
    }
    return sb.ToString();
  }

  private static bool IsGreekLower(char c)
  {
    return c >= 'α' && c <= 'ω';
  }
}
