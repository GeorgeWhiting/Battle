describe Game do

  subject(:game) { described_class.new }
  # let(:player1)  { double :player1 }
  let(:player2)  { double :player2 }

  describe "#attack" do
    it "should make a player attack another player" do
      expect(player2).to receive(:remove_hp)
      game.attack(player2)
    end
  end

end
