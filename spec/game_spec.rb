describe Game do


  let(:player1)  { double :player1, name: "name1", remove_hp: nil, hp: 0 }
  let(:player2)  { double :player2, name: "name2", hp: 0 }
  subject(:game) { described_class.new(player1,player2) }

  describe "#player1" do
    it "creates player 1 and gives them a name" do
      expect(game.player1.name).to eq "name1"
    end
  end

  describe "#player2" do
    it "creates player 2 and gives them a name" do
      expect(game.player2.name).to eq "name2"
    end
  end

  describe "#attack" do
    it "should make player 1 attack player 2" do
      expect(player2).to receive(:remove_hp)
      game.attack(player2)
    end

    it "should make player 2 attack player 1" do
      expect(player1).to receive(:remove_hp)
      game.attack(player1)
    end
  end

  describe "#current_turn" do
    it "displays the current turn" do
      expect(game.current_turn).to eq player1
    end
  end

  describe "#next_turn" do
    it "changes the current turn to the other player" do
      expect(game.next_turn).to eq player2
    end
  end

  describe "#opposite" do
    it "returns whoever is the opponent of the current player" do
      expect(game.opposite).to eq player2
    end
  end

  describe "#game_over?" do
    it "returns true when someone reaches 0 hp" do
      expect(game.game_over?).to eq true
    end
  end

  describe "#loser" do
    it "returns the loser" do
      expect(game.loser).to eq player1
    end
  end
end
