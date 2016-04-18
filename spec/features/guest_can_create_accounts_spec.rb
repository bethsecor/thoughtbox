require 'rails_helper'

RSpec.feature "GuestCanCreateAccounts", type: :feature do
  it 'should be able to create an account' do
    visit new_user_path

    fill_in "Email", with: "beth@turing.io"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_on "Submit"

    expect(current_path).to eq root_path
  end
end
