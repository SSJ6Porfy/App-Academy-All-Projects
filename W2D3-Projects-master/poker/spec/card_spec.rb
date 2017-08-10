require "rspec"
require "card"


describe Card do
  let(:q_diamonds) { Card.new(:queen, :diamond, 12) }

  describe "#intialize" do
    it "gives card a type" do
      expect(q_diamonds.type).to eq(:queen)
    end

    it "gives card a suit" do
      expect(q_diamonds.suit).to eq(:diamond)
    end
    it "gives card a value" do
      expect(q_diamonds.value).to eq(12)
    end
  end
end
