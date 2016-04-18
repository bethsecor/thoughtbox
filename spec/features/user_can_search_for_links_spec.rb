require 'rails_helper'

RSpec.feature "UserCanSearchForLinks", type: :feature do
  it "should filter links on the page when entering search term", js: true do
    user = create(:user)
    user.links.create(title: "JavaScript for Cats", url: "http://jsforcats.com/")
    user.links.create(title: "Cats", url: "https://www.reddit.com/r/cats/")
    user.links.create(title: "Flowers", url: "http://www.bonniebraeflowers.com/")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/'

    fill_in "Search", with: "cat"

    expect(page).to_not have_content("Flowers")

    expect(page).to have_content("Cats")
    expect(page).to have_content("JavaScript for Cats")
  end
end
