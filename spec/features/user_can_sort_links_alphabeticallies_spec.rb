require 'rails_helper'

RSpec.feature "UserCanSortLinksAlphabeticallies", type: :feature do
  it "should filter links on the page when selecting unread only", js: true do
    user = create(:user)
    user.links.create(title: "JavaScript for Cats", url: "http://jsforcats.com/", read: true)
    user.links.create(title: "Cats", url: "https://www.reddit.com/r/cats/")
    user.links.create(title: "Flowers", url: "http://www.bonniebraeflowers.com/")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/'

    click_on "Sort"

    within(".link:nth-of-type(1)") do
      expect(page).to have_content("Cats")
    end
    within(".link:nth-of-type(2)") do
      expect(page).to have_content("Flowers")
    end
      within(".link:nth-of-type(3)") do
      expect(page).to have_content("JavaScript for Cats")
    end
  end
end
