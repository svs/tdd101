require 'spec_helper'

describe "Game creation", :js => true do

  it "should allow visiting the home page" do
    visit "/"
    page.should have_content("Welcome to Tic Tac Toe")
    fill_in "Player One", with: "foo"
    fill_in "Player Two", with: "bar"
    click_on "Play a new game"
    #page.should have_content("Start playing")
  end

end
