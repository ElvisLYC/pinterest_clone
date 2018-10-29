require "rails_helper"

RSpec.feature "New", :type => :feature do
  scenario "User creates a new form" do
    visit "/signup"
    fill_in "user[name]", :with => "google"
    fill_in "user[email]", :with => "google@gmail.com"
    fill_in "user[password]", :with => "google"
    fill_in "user[password_confirmation]", :with => "google"
    click_button "Submit"
    expect(page).to have_text("google")
  end
end
