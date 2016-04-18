require "rails_helper"

RSpec.feature "change read status" do

  scenario "change unread to read" do
    login_user
    create_link
    visit links_path

    expect(page).to have_content "false"
    expect(page).to have_content "mark as read"

    click_on "mark as read"
    link.reload

    expect(link.read).to eq true

    expect(page).to have_content "true"
    expect(page).to have_content "mark as unread"

    click_on "mark as unread"
    link.reload

    expect(link.read).to eq false
  end

end
