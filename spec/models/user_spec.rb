require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject { build(:user) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:api_key).allow_nil }
  end

  describe "email format validation" do
    it "should be valid" do
      user = build(:user, email: "user@example.com", password: "pass1234")
      expect(user).to be_valid
    end

    it "should be invalid if user email already exists" do
      create(:user, email: "user@example.com")
      user = build(:user, email: "user@example.com")
      expect(user).to be_invalid
    end
  end

  describe "api_key generation" do
    it "generates an api_key before create" do
      user = build(:user)
      expect(user.api_key).to be_nil
      user.save
      expect(user.api_key).not_to be_nil
    end
  end

  describe "password encryption" do
    it "encrypts the password" do
      user = User.create(email: "user@example.com", password: "password123")
      expect(user.password_digest).not_to eq("password123")
    end
  end
end