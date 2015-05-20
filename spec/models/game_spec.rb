require "rails_helper"

describe "Game" do

  describe "#display_inning" do
    game = Game.new
    game2 = Game.new
    game3 = Game.new
    game2.inning = 5
    game3.inning = 10

    it "shows the default inning" do
      expect(game.display_inning).to eq("Top 1")
    end

    it "displays the correct top of the inning" do
      expect(game2.display_inning).to eq("Top 3")
    end

    it "displays the correct bottom of the inning" do
      expect(game3.display_inning).to eq("Bot 5")
    end
  end

  describe "#read_inning" do
    it "should take a Top X and set self.inning to an odd number" do
      game = Game.new
      game.read_inning("Top 8")
      expect(game.inning).to eq(15)
      game.read_inning("Top 3")
      expect(game.inning).to eq(5)
    end

    it "should take a Bot X and set self.inning to an even number" do
      game = Game.new
      game.read_inning("Bot 8")
      expect(game.inning).to eq(16)
    end
  end
end