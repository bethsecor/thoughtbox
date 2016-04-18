require 'rails_helper'

RSpec.feature "GuestSeesErrorWhenTryingToCreateDuplicateAccounts", type: :feature do
  it 'should redirect guest if email already taken' do
    user = create(:user, email: "beth@turing.io")

    visit new_user_path

    fill_in "Email", with: "beth@turing.io"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"
    click_on "Submit"

    expect(page).to have_content("Email has already been taken")
  end
end
