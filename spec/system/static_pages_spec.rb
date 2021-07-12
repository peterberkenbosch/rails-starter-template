require "rails_helper"

RSpec.describe "Static pages" do
  it "visiting index" do
    visit root_path
    expect(page).to have_content("Welcome")
  end
end
