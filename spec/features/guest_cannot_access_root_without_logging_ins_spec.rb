require 'rails_helper'

RSpec.feature "GuestCannotAccessRootWithoutLoggingIns", type: :feature do
  it "should redirect to login page if user not signed in" do
    user = create(:user)
    visit '/'

    expect(current_path).to eq login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "123"
    click_on "Submit"

    expect(current_path).to eq root_path
  end
end
