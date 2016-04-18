require 'rails_helper'

RSpec.feature "UserCanEditLinks", type: :feature do
  it 'should see a button to edit a link' do
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
    fill_in "Url", with: "https://www.youtube.com/watch?v=OxgKvRvNd5o"
    click_on "Submit"

    expect(current_path).to eq root_path

    within("#link-#{link.id}") do
      expect(page).to have_link "Crazy CATS", href: "https://www.youtube.com/watch?v=OxgKvRvNd5o"
    end
  end
end
