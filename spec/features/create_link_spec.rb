require "rails_helper"

RSpec.feature "create links" do

  scenario "logged in user can create links" do
    login_user

    visit links_path

    fill_in "link_title", with: "Sports!"
    fill_in "link_url", with: "http://espn.go.com/"
    click_on "submit link"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Sports!")
  end

end
