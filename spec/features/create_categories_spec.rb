require 'rails_helper'

RSpec.describe 'Create a category', type: :feature do
  before :each do
    @user = User.create(username:'admin', email:'email@email.com', password:'password', admin: true)
  end

  scenario 'valid inputs' do
    sign_in_as(@user, "password")
    visit new_category_path
    fill_in 'Name', with: 'sports'
    click_on 'Create Category'
    expect(page).to have_text('sports')
  end

  scenario 'invalid inputs' do
    sign_in_as(@user, "password")
    visit new_category_path
    fill_in 'Name', with: ' '
    click_on 'Create Category'
    expect(page).to have_text("Name can't be blank")
  end

  scenario 'invalid user' do
    visit new_category_path
    expect(page).to have_current_path(categories_path)
  end
end