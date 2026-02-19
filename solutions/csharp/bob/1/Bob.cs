public static class Bob
{
    public static string Response(string statement) {
        // I tried taking csharpiers advice and turning this into a bigazz ternary
        // it looked like doodoo, so I left in the ifs, way more readable.
        var trimmed = statement.Trim();
        if (IsSilent(trimmed)) {
            return "Fine. Be that way!";
        }
        if (IsYelling(trimmed)){
            return IsQuestion(trimmed) ? "Calm down, I know what I'm doing!" : "Whoa, chill out!";
        }
        return IsQuestion(trimmed) ? "Sure." : "Whatever.";
    }

    public static bool IsSilent(string statement) => statement == string.Empty;

    public static bool IsYelling(string statement) =>
        string.Equals(statement, statement.ToUpper()) 
        && !string.Equals(statement.ToUpper(), statement.ToLower());

    public static bool IsQuestion(string statement) => statement.EndsWith('?');
}
