require "rails_helper"

RSpec.feature "user sign in" do

  it "signs up with correct credentials" do
    visit root_path

    expect(page.status_code).to eq(200)
    expect(page).to have_content("please log in or sign up")

    click_link("sign up")

    expect(page).to have_content("create a new account")
    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "david@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "create account"

    expect(current_path).to eq(links_path)
  end

end
