require "rails_helper"

RSpec.feature "user sign in" do

  it "signs in with correct credentials" do
    visit root_path

    expect(page.status_code).to eq(200)
    expect(page).to have_content("thoughtbox")

    click_link("sign up")

    expect(page).to have_content("enter your email address")
    expect(current_path).to eq(new_user_path)

    fill_in "email", with: "david@example.com"
    fill_in "password", with: "password"
    fill_in "confirm password", with: "password"
    click_on "create account"

    expect(page).to have_content("hello, david@example.com")
    expect(current_path).to eq(links_path)
  end

end
