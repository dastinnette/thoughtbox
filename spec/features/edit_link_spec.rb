require "rails_helper"

RSpec.feature "edit links" do

  scenario "logged in user can edit links" do
    login_user
    link = create_link
    visit links_path

    click_on "edit"

    expect(current_path).to eq(edit_link_path(link))

    fill_in "link_title", with: "More sports!"
    fill_in "link_url", with: "http://sports.yahoo.com/"
    click_on "update link"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("More sports!")
    expect(page).to have_content("link")

    expect(page).to_not have_content(link.title)
    expect(page).to_not have_content(link.url)
  end

  scenario "invalid url not saved during edit" do
    login_user
    link = create_link
    visit links_path

    click_on "edit"

    expect(current_path).to eq(edit_link_path(link))

    fill_in "link_title", with: "More sports!"
    fill_in "link_url", with: "esspnn.io"
    click_on "update link"

    expect(current_path).to eq(link_path(link))
  end
end
