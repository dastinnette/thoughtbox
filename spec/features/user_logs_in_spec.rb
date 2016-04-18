require "rails_helper"

RSpec.feature "user log in" do

  scenario "with correct credentials" do
    User.create(email: "david@example.com", password: "password")
    visit root_path

    click_on "log in"

    expect(current_path).to eq(login_path)

    fill_in "Email", with: "david@example.com"
    fill_in "Password", with: "password"
    click_on "log in"

    expect(current_path).to eq(links_path)
  end

end
