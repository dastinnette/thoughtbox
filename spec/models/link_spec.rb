require 'rails_helper'

RSpec.describe Link, type: :model do

  it "must have a valid url" do
    valid_link   = Link.new(title: "Sports!", url: "http://espn.go.com/")
    invalid_link = Link.new(title: "Sports!", url: "esspnn.io")

    expect(valid_link.save).to be true
    expect(invalid_link.save).to be false
  end

end
