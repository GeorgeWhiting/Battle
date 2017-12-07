describe Game do

  subject(:game) { described_class.new("name1","name2") }
  let(:player1)  { double :player1, name: "name1" }
  let(:player2)  { double :player2, name: "name2" }

  describe "#player1" do
    it "creates player 1 and gives them a name" do
      expect(game.player1.name).to eq "name1"
    end
  end

  describe "#attack" do
    it "should make a player attack another player" do
      expect(player2).to receive(:remove_hp)
      game.attack(player2)
    end
  end

end
