class RemoteControlCar
{
  public int speed;
  public int batteryDrain;
  public int distanceDriven;
  public int batteryRemaining;

  public RemoteControlCar(int speed, int batteryDrain)
  {
    this.speed = speed;
    this.batteryDrain = batteryDrain;
    distanceDriven = 0;
    batteryRemaining = 100;
  }

  public bool BatteryDrained()
  {
    return batteryRemaining < batteryDrain;
  }

  public int DistanceDriven()
  {
    return distanceDriven;
  }

  public void Drive()
  {
    if (batteryRemaining >= batteryDrain)
    {
      batteryRemaining -= batteryDrain;
      distanceDriven += speed;
    }
  }

  public static RemoteControlCar Nitro() { return new RemoteControlCar(50, 4); }
}

class RaceTrack
{
  private int distance;
  public RaceTrack(int distance) { this.distance = distance; }
  public bool TryFinishTrack(RemoteControlCar car)
  {
    return car.speed * (100 / car.batteryDrain) >= distance;
  }
}
