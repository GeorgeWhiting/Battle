class Player
DEFAULT_HP = 100
  attr_reader :name, :hp

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def attack(victim)
    victim.remove_hp(10)
  end

  def remove_hp(amount)
    @hp -= amount
  end
end
