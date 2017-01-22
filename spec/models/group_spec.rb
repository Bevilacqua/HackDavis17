require "rails_helper"

describe Group, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:Group)).to be_valid
  end
end
