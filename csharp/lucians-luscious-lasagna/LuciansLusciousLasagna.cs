class Lasagna
{
    public int ExpectedMinutesInOven() {
        return 40;
    }

    public int RemainingMinutesInOven(int actual_mins) {
        return ExpectedMinutesInOven() - actual_mins;
    }

    // TODO: define the 'PreparationTimeInMinutes()' method
    public int PreparationTimeInMinutes(int num_layers) {
        return 2 * num_layers;
    }

    // TODO: define the 'ElapsedTimeInMinutes()' method
    public int ElapsedTimeInMinutes(int num_layers, int actual_mins) {
        return actual_mins + PreparationTimeInMinutes(num_layers);
    }
}
