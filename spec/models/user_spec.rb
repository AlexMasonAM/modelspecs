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

  it "returns a user's full name as a string" do
    user = FactoryGirl.build(:user)
    user2 =  FactoryGirl.build(:user, firstname: "John", lastname: "Smith")
    expect(user.fullname).to eq("#{user.firstname} #{user.lastname}")
    expect(user2.fullname).to eq("John Smith")
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to be_invalid
  end

  it "is invalid if the email isn't formatted properly" do
    emails = ["leterrsin", "jdjwih@ncnji", "a.ss", "a n n", "some@inx.c"]
    emails.each do |email|
      user = FactoryGirl.build(:user, email: email)

      expect(user).to be_invalid
    end
  end

  it "is invalid if the email is already in the database" do
    user1 = FactoryGirl.create(:user, email: "email@example.com")
    user2 = FactoryGirl.build(:user, email: user1.email)

    expect(user2).to be_invalid
  end

  it "is invalid if the email is already in the database, regardless of capitalization" do
    user1 = FactoryGirl.create(:user, email: "email@example.com")
    user2 = FactoryGirl.build(:user, email: "Email@example.com")

    expect(user2).to be_invalid
  end
end