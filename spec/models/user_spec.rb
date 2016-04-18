require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a unique email" do
    user = create(:user, email: "beth@turing.io")
    new_user = User.new(email: "beth@turing.io", password: "123")

    expect(new_user).to be_invalid
  end

  it "should have email" do
    new_user = User.new(password: "123")

    expect(new_user).to be_invalid
  end

  it "should have password" do
    new_user = User.new(email: "beth@turing.io")

    expect(new_user).to be_invalid
  end

  it "should have matching password and password confirmation" do
    new_user = User.new(email: "beth@turing.io", password: "123", password_confirmation: "1234")

    expect(new_user).to be_invalid
  end
end
