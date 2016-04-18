require 'rails_helper'

RSpec.describe User, type: :model do

  it "must have a unique email address" do
    user1 = User.create(email: "1@example.com", password: "password")
    user2 = User.new(email: "1@example.com", password: "password")

    expect(user2.save).to be false
  end

end
