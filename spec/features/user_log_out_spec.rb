require "rails_helper"

RSpec.feature "user log out" do

  scenario "registered user can log out" do
    login_user

    click_on "log out"

    expect(current_path).to eq(login_path)
  end

end
