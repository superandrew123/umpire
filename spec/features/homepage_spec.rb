require 'rails_helper'

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


  context "user signs in," do
    it "clicks log in and goes to the log in page" do 
      visit root_path
      click_link('log in')
      fill_in('Email', with: @user.email)
      fill_in('Password', with: @user.password)
      find('[value="Log in"]').click
      expect(page).to have_content("New Game")
    end
  end
end