describe Player do

  subject(:player) {described_class.new("Ellie")}
  subject(:player2) {described_class.new("George")}
  describe "#name" do
    it "returns the players name" do
      expect(player.name).to eq "Ellie"
    end
  end

  describe "#remove_hp" do
    it "should remove hp" do
      expect{player2.remove_hp(10)}.to change {player2.hp}.by(-10)
    end
  end

  describe "#hp" do
    it "returns the hp of the player" do
      expect(player.hp).to eq described_class::DEFAULT_HP
    end
  end

end
