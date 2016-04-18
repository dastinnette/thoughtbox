require "rails_helper"

RSpec.feature "user log in" do

  scenario "with correct credentials" do
    create_user
    visit root_path

    click_on "log in"

    expect(current_path).to eq(login_path)

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_on "enter"

    expect(current_path).to eq(links_path)
  end

end
