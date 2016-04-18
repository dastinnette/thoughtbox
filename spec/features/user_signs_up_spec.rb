require "rails_helper"

RSpec.feature "user sign in" do

  scenario "with correct credentials" do
    visit root_path

    click_on "sign up"

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "create account"

    expect(current_path).to eq(links_path)
  end

  scenario "rejected with non matching passwords" do
    visit root_path

    click_on "sign up"

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "pw"
    click_button "create account"

    expect(current_path).to eq(new_user_path)
  end

end
