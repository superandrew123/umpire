require 'rails_helper'

describe "Visit default home page,", type: :feature do
  context "no user signed in," do 
    Game.create(user_id: 1, home_name: "People's Court", away_name: "Bad Guys")
    it "opens homepage and shows all games" do
      visit root_path
      expect(page).to have_content("Games:")
    end

    it "shows all games" do
      visit root_path
      expect(page).to have_content("People's Court")
    end
  end

end