require 'rails_helper'

RSpec.describe 'List all categories', type: :feature do
  before :each do
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end

  scenario 'lists categories' do
    visit categories_path
    expect(page).to have_text('sports')
    expect(page).to have_link('sports')
  end
end