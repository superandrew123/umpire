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
      expect(page).to have_content("OUTS")
      expect(page).to have_content(@game.display_inning)
    end

    it "does not respond to clicks on strikes" do 
      visit game_path(@game)
      strikes = find(".strikes").text
      find(".strikesBox").click
      expect(strikes).to eq(find(".strikes").text)
    end

    it "does not respond to clicks on outs" do 
      visit game_path(@game)
      outs = find(".outs").text
      find(".outsBox").click
      expect(outs).to eq(find(".outs").text)
    end

    it "does not respond to clicks on home score" do 
      visit game_path(@game)
      home_score = find(".homeS").text
      find(".homeBox").click
      expect(home_score).to eq(find(".homeS").text)
    end

    it "does not respond to clicks on away score" do 
      visit game_path(@game)
      away_score = find(".awayS").text
      find(".awayBox").click
      expect(away_score).to eq(find(".awayS").text)
    end
  end
end