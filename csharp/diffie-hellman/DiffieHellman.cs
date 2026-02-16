using System.Numerics;

public static class DiffieHellman
{
  public static BigInteger PrivateKey(BigInteger hugePrimeNumber)
  {
    var rng = new Random();
    return (BigInteger)(1 + rng.NextDouble() * (double)hugePrimeNumber);
  }

  public static BigInteger PublicKey(
    BigInteger hugePrimeNumber,
    BigInteger primeG,
    BigInteger privateKey
  )
  {
    return BigInteger.ModPow(primeG, privateKey, hugePrimeNumber);
  }

  public static BigInteger Secret(
    BigInteger hugePrimeNumber,
    BigInteger publicKey,
    BigInteger privateKey
  )
  {
    return BigInteger.ModPow(publicKey, privateKey, hugePrimeNumber);
  }
}
