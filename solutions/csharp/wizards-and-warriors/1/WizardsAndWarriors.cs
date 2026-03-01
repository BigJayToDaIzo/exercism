abstract class Character(string characterType)
{
    private readonly string _characterType = characterType;

    public abstract int DamagePoints(Character target);

    public virtual bool Vulnerable()
    {
      return false;
    }

    public override string ToString()
    {
      return $"Character is a {_characterType}";
    }
}

class Warrior : Character
{
    public Warrior() : base("Warrior")
    {
    }

    public override int DamagePoints(Character target)
    {
      if(target.Vulnerable()) return 10;
      return 6;
    }
}

class Wizard : Character
{
    bool spellPrepped;
    public Wizard() : base("Wizard")
    {
    }
    
    public override bool Vulnerable() => !spellPrepped;
      

    public override int DamagePoints(Character target)
    {
      if(spellPrepped) return 12;
      return 3;
    }

    public void PrepareSpell()
    {
      spellPrepped = true;
    }
}
