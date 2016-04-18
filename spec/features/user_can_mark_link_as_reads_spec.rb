require 'rails_helper'

RSpec.feature "UserCanMarkLinkAsReads", type: :feature do
  it "should gray link out and update link to read", js: true do
    user = create(:user_with_link)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/'

    link = user.links.first

    within("#link-#{link.id}") do
      click_on "Mark As Read"
      expect(page).to have_content("Mark As Unread")
    end
    expect(page).to have_css(".read-true")
  end
end
