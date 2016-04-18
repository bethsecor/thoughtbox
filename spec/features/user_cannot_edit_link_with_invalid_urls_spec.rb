require 'rails_helper'

RSpec.feature "UserCannotEditLinkWithInvalidUrls", type: :feature do
  it "should see an error message when editing with an invalid link" do
    user = create(:user_with_link)
    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "123"
    click_on "Submit"

    link = user.links.first

    within("#link-#{link.id}") do
      expect(page).to have_link link.title, link.url
      click_on "Edit"
    end

    expect(current_path).to eq edit_link_path(id: link.id)

    fill_in "Title", with: "Crazy CATS"
    fill_in "Url", with: "youtube.c"
    click_on "Submit"

    expect(page).to have_content "Url is not a valid URL"
  end
end
