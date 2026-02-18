public static class LogAnalysis
{
  public static string SubstringAfter(this string unparsed, string delimiter)
  {
    return unparsed.Split(delimiter)[1];
  }

  public static string SubstringBetween(this string unparsed, string opening, string closing)
  {
    var openIndex = unparsed.IndexOf(opening);
    if (openIndex == -1) return string.Empty;
    var start = openIndex + opening.Length;
    var end = unparsed.IndexOf(closing, start);
    if (end == -1) return string.Empty;

    return unparsed[start..end];
  }

  public static string Message(this string unparsed)
  {
    return unparsed.SubstringAfter(": ");
  }

  public static string? LogLevel(this string unparsed)
  {
    return unparsed.SubstringBetween("[", "]");
  }
}
