require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a unique email" do
    user = create(:user, email: "beth@turing.io")
    new_user = User.new(email: "beth@turing.io", password: "123")

    expect(new_user).to be_invalid
  end
end
