require "rails_helper"

RSpec.describe User, :type => :model do
  it "has a factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end
  it "is invalid without a first name" do
    user = FactoryGirl.build(:user, firstname: nil)
    expect(user).to be_invalid
  end
  it "is invalid without a last name" do
    user = FactoryGirl.build(:user, lastname: nil)
    expect(user).to be_invalid
  end
  it "returns a user's full name as a string"
  it "is invalid without an email"
  it "is invalid if the email isn't formatted properly"
  it "is invalid if the email is already in the database"
end