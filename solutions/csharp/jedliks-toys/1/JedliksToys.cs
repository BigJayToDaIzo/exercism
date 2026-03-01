class RemoteControlCar
{
   public int DistanceDriven = 0;
   public int BatteryLevel = 100;

    public static RemoteControlCar Buy()
    {
      return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
      return "Driven " + DistanceDriven + " meters";
    }

    public string BatteryDisplay()
    {
      if (BatteryLevel > 0) 
      { return "Battery at " + BatteryLevel + "%"; }
      else return "Battery empty";
    }

    public void Drive()
    {
      if (BatteryLevel >= 1) {
        DistanceDriven += 20;
        BatteryLevel--;
      }
    }
}
