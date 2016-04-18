require 'rails_helper'

RSpec.feature "UserCanEditLinks", type: :feature do
  it 'should see a button to edit a link' do
    user = create(:user_with_link)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    
    visit '/'

    link = user.links.first

    within("#link-#{link.id}") do
      expect(page).to have_link link.title, link.url
      click_on "Edit"
    end

    expect(current_path).to eq edit_link_path(id: link.id)

    fill_in "Title", with: "Crazy CATS"
    fill_in "Url", with: "https://www.youtube.com/watch?v=OxgKvRvNd5o"
    click_on "Submit"

    expect(current_path).to eq  root_path

    within("#link-#{link.id}") do
      expect(page).to have_link "Crazy CATS", href: "https://www.youtube.com/watch?v=OxgKvRvNd5o"
    end
  end
end
