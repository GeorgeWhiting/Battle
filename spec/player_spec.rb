describe Player do

  subject(:player) {described_class.new("Ellie")}

  describe "#name" do
    it "returns the players name" do
      expect(player.name).to eq "Ellie"
    end
  end

end
