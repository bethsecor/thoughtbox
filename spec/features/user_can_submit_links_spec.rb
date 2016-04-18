require 'rails_helper'

RSpec.feature "UserCanSubmitLinks", type: :feature do
  it 'should see a form to submit a link when logged in' do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/'

    fill_in "Title", with: "Cats"
    fill_in "Url", with: "https://www.reddit.com/r/cats/"
    click_on "Submit"

    link = user.reload.links.first

    within("#link-#{link.id}") do
      expect(page).to have_link "Cats", href: "https://www.reddit.com/r/cats/"
    end

    expect(page).not_to have_link other_link.title, href: other_link.url
  end
end
