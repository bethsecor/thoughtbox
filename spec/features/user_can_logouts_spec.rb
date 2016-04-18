require 'rails_helper'

RSpec.feature "UserCanLogouts", type: :feature do
  it 'user can click on sign out' do
    user = create(:user, password: "1234")
    visit '/login'

    fill_in "Email", with: user.email
    fill_in "Password", with: "1234"
    click_on "Submit"

    expect(current_path).to eq root_path

    click_on "Sign Out"

    expect(current_path).to eq login_path

    visit '/'
    
    expect(current_path).to eq login_path
  end
end
