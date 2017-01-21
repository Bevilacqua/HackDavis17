require "rails_helper"

describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:User)).to be_valid
  end

  it "requires email" do
    expect(FactoryGirl.build(:User, email: nil)).not_to be_valid
  end
end
