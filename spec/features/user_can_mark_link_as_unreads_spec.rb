require 'rails_helper'

RSpec.feature "UserCanMarkLinkAsUnreads", type: :feature do
  it "can mark a link as unread", js: true do
    user = create(:user_with_read_link)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    link = user.links.first

    visit '/'

    within("#link-#{link.id}") do
      click_on "Mark As Unread"
      expect(page).to have_content("Mark As Read")
    end
    expect(page).to have_css(".read-false")
  end
end
