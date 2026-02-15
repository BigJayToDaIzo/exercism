static class LogLine
{
  public static string Message(string logLine)
  {
    char[] delimiterChars = ['[', ':'];
    var statusLvlMsg = logLine.Split(delimiterChars);
    return statusLvlMsg[2].Trim();
  }

  public static string LogLevel(string logLine)
  {
    char[] delimiterChars = ['[', ']'];
    var statusLvlMsg = logLine.Split(delimiterChars);
    return statusLvlMsg[1].Trim().ToLower();
  }

  public static string Reformat(string logLine)
  {
    return Message(logLine) + " (" + LogLevel(logLine) + ")";
  }
}
