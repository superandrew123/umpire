require 'rails_helper'

describe "not logged in, games can be viewed but not modified", type: :feature do 
  before(:each) do
    @user = User.create(email: "test@email.net", password: "password")
    @game = Game.create(user_id: 1, home_name: "People's Court", away_name: "Bad Guys")
  end

  describe "clicking watch directs to game page" do
    it "clicks watch from root page" do
      visit root_path
      click_link("Watch", :match => :first)
      expect(current_path).to eq("/games/#{@game.id}")
    end
  end

  describe "clicking watch displays game information" do
    it "shows the outs, runs, team names, and inning" do
      visit game_path(@game)
      expect(current_path).to eq("/games/#{@game.id}")
      expect(page).to have_content(@game.home_name)
      expect(page).to have_content(@game.away_name)
      expect(page).to have_content("Outs")
      expect(page).to have_content(@game.display_inning)
    end
  end
end