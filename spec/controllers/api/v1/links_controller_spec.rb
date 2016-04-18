require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do
  it '.update link to read as true' do
    link = create(:link)
    link_data = { link: { read: true }}

    put :update, id: link.id, format: :json, link: { read: true  }

    expect(response.status).to eq 204

    link_1_updated = Link.find(link_1.id)

    expect(link_1_updated.read).to be true
  end
end
