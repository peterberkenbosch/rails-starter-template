require "system_helper"

RSpec.describe "Static pages" do
  it "visiting index" do
    visit root_path
    expect(page).to have_content("Welcome")
    expect(page).to have_content("Hello World From StimulusController!")
  end
end
