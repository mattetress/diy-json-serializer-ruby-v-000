require 'rails_helper'

describe 'navigate' do
  before do
    @post = Post.create(title: "My Post", description: "My post desc")
    @post.author = Author.create(name: "Lynn Flewelling", hometown: "Seattle, WA")
    @post.save
  end

  it 'shows the title on the show page in a h1 tag' do
    visit post_path(@post)
    expect(page).to have_css("h1", text: "My Post")
  end

  it 'to post pages' do
    visit post_path(@post)
    expect(page.status_code).to eq(200)
  end

  it 'shows the description on the show page in a p tag' do
    visit post_path(@post)
    expect(page).to have_css("p", text: "My post desc")
  end
end
