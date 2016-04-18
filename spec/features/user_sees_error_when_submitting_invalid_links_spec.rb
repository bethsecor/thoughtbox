require 'rails_helper'

RSpec.feature "UserSeesErrorWhenSubmittingInvalidLinks", type: :feature do
  it "should see an error when submitting an invalid link" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/'

    fill_in "Title", with: "Cats"
    fill_in "Url", with: "www.reddit"
    click_on "Submit"

    expect(page).to have_content "Url is not a valid URL"
  end
end
