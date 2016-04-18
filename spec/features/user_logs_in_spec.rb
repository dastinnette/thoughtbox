require "rails_helper"

RSpec.feature "user log in" do

  it "logs in with correct credentials" do
    visit root_path

    expect(page.status_code).to eq(200)
    expect(page).to have_content("please log in or sign up")

    click_link("log in")

    expect(page).to have_content("log in")
    expect(current_path).to eq(login_path)

    fill_in "Email", with: "david@example.com"
    fill_in "Password", with: "password"
    click_on "log in"

    expect(current_path).to eq(links_path)
  end

end
