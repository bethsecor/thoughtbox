require 'rails_helper'

RSpec.feature "UserCanFilterLinksByStatuses", type: :feature do
  it "should filter links on the page when selecting unread only", js: true do
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

  it "should filter links on the page when selecting read only", js: true do
    user = create(:user)
    user.links.create(title: "JavaScript for Cats", url: "http://jsforcats.com/")
    user.links.create(title: "Cats", url: "https://www.reddit.com/r/cats/")
    user.links.create(title: "Flowers", url: "http://www.bonniebraeflowers.com/", read: true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/'

    select "Read", :from => "link_status[filter]"

    expect(page).to have_content("Flowers")

    expect(page).to_not have_content("Cats")
    expect(page).to_not have_content("JavaScript for Cats")
  end

  it "should show all links when selecting blank option", js: true do
    user = create(:user)
    user.links.create(title: "JavaScript for Cats", url: "http://jsforcats.com/")
    user.links.create(title: "RedditCats", url: "https://www.reddit.com/r/cats/")
    user.links.create(title: "Flowers", url: "http://www.bonniebraeflowers.com/", read: true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/'

    select "", :from => "link_status[filter]"

    expect(page).to have_content("Flowers")
    expect(page).to have_content("RedditCats")
    expect(page).to have_content("JavaScript for Cats")
  end
end
