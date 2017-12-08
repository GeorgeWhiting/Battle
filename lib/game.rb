class Game

attr_reader :player1, :player2
attr_accessor :current_turn

  def initialize(player1,player2)
    @players = [player1, player2]

    @current_turn = @players[0]
  end

  def self.create_game(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.game_instance
    @game
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def attack(victim)
    victim.remove_hp(10)
  end

  def next_turn
    @current_turn = opposite(self.current_turn)
  end

  def opposite(current_player)
    @players.select{|player| player != current_player}.first
  end

  def game_over?
    player1.hp <= 0 || player2.hp <= 0
  end

  def loser
    player1.hp <= 0 ? player1 : player2
  end
end
