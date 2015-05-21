require 'rails_helper'

# methods in test_helper.rb: log_in(user)

describe "Visit /,", type: :feature do
  before(:each) do
    Game.create(user_id: 1, home_name: "People's Court", away_name: "Bad Guys")
    Game.create(user_id: 2, home_name: "Home", away_name: "Away")
    @user1 = User.create(email: "test1@email.net", password: "password")
    @user2 = User.create(email: "test2@email.net", password: "password")
    @user3 = User.create(email: "test3@email.net", password: "password")
  end

  context "no user signed in," do
    describe "root page" do 
      it "opens homepage and shows all games" do
        visit root_path
        expect(page).to have_content("Games:")
        expect(page).to have_content("People's Court")
        expect(page).to have_content("Bad Guys")
      end
    end

    describe "cannot resume games without being logged in" do
      it "resume is gone" do 
        visit root_path
        expect(page).to_not have_content("Resume")
      end

      it "watch is on the page" do 
        visit root_path
        expect(page).to have_content("Watch")
      end
    end
  end

  describe "clicks log in" do
    it "goes to log in page" do
      visit root_path
      click_link('log in')
      expect(current_path).to eq("/users/sign_in")
    end

    it "logs in and goes back to root page and show the New Game and log out link" do
      log_in(@user1)
      expect(current_path).to eq("/")
      expect(page).to have_content("New Game")
      expect(page).to_not have_content("log in")
      expect(page).to have_content("log out")
    end

    it "shows Resume for user's games" do 
      log_in(@user2)
      expect(current_path).to eq("/")
      expect(page).to have_content("Resume")
      expect(page).to have_content("Watch")
    end

    it "shows only Watch if there are no games by the user" do
      log_in(@user3)
      expect(current_path).to eq("/")
      expect(page).to_not have_content("Resume")
      expect(page).to have_content("Watch")
    end
  end
end