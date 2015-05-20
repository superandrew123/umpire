require 'rails_helper'

# methods in test_helper.rb: log_in(user)

describe "Visit /,", type: :feature do
  before(:each) do
    Game.create(user_id: 1, home_name: "People's Court", away_name: "Bad Guys")
    @user = User.create(email: "test@email.net", password: "password")
  end

  context "no user signed in," do 
    it "opens homepage and shows all games" do
      visit root_path
      expect(page).to have_content("Games:")
      expect(page).to have_content("People's Court")
      expect(page).to have_content("Bad Guys")
      expect(page).to have_content("Resume")
    end

    it "cannot resume games without being logged in" do
      visit root_path
      click_link('Resume', match: :first)
      expect(current_path).to eq("/users/sign_in")
    end
  end

  describe "clicks log in" do
    it "goes to log in page" do
      visit root_path
      click_link('log in')
      expect(current_path).to eq("/users/sign_in")
    end

    it "logs in and goes back to root page and show the New Game and log out link" do
      log_in(@user)
      expect(current_path).to eq("/")
      expect(page).to have_content("New Game")
      expect(page).to_not have_content("log in")
      expect(page).to have_content("log out")
    end
  end
end