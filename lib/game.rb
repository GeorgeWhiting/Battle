class Game

attr_reader :player1, :player2
attr_accessor :current_turn

  def initialize(name1,name2)
    @player1 = Player.new(name1)
    @player2 = Player.new(name2)
    @current_turn = @player1.name
  end

  def attack(victim)
    victim.remove_hp(10)
  end

  def next_turn
    @current_turn = (@current_turn == @player1.name ? @player2.name : @player1.name)
  end

end
