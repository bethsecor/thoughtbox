require 'rails_helper'

RSpec.feature "UserCanMarkLinkAsUnreads", type: :feature do
  it "can mark a link as unread" do
    user = create(:user_with_link)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    link = user.links.first
    link.update(read: true)

    visit '/'


    within("#link-#{link.id}") do
      click_on "Mark As Unread"
      expect(page).to have_content("Mark As Read")
    end
    expect(page).to have_css(".read-false")
  end
end
