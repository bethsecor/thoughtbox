require 'rails_helper'

RSpec.feature "GuestRedirectedAndCanClickOnSignUps", type: :feature do
  it 'should redirect unauthenticated user to create account' do
    visit '/'

    expect(current_path).to eq login_path

    click_on "Sign Up"

    expect(current_path).to eq new_user_path

    fill_in "Email", with: "beth@turing.io"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"
    click_on "Submit"

    expect(current_path).to eq root_path
  end
end
