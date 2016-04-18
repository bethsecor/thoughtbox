require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'should only accept a valid url' do
    link = Link.new(title: "Cats", url: "www.reddit")

    expect(link).to be_invalid
  end

  it 'should have a url' do
    link = Link.new(title: "Cats")

    expect(link).to be_invalid
  end

  it 'should have a title' do
    link = Link.new(url: "https://www.reddit.com/r/cats/")

    expect(link).to be_invalid
  end
end
