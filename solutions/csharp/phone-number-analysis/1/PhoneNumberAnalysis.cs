public static class PhoneNumber
{
  public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
  {
    var splitArray = phoneNumber.Split("-");
    var (area, exchange, local) = (splitArray[0], splitArray[1], splitArray[2]);
    return (area == "212", exchange == "555", local);
  }

  public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo)
  {
    return phoneNumberInfo.IsFake;
  }
}
