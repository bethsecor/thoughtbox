require 'rails_helper'

RSpec.feature "UserCanFilterLinksByStatuses", type: :feature do
  it "should filter links on the page when entering search term", js: true do
    user = create(:user)
    user.links.create(title: "JavaScript for Cats", url: "http://jsforcats.com/", read: true)
    user.links.create(title: "Cats", url: "https://www.reddit.com/r/cats/")
    user.links.create(title: "Flowers", url: "http://www.bonniebraeflowers.com/")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/'

    select "Unread", :from => "link_status[filter]"

    expect(page).to_not have_content("JavaScript for Cats")

    expect(page).to have_content("Cats")
    expect(page).to have_content("Flowers")
  end
end
