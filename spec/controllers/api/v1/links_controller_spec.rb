require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do
  it '.update link to read as true' do
    user = create(:user_with_link)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    link = user.links.first

    put :update, id: link.id, format: :json, link: { read: true  }

    expect(response.status).to eq 204

    link_updated = Link.find(link.id)

    expect(link_updated.read).to be true
  end
end
