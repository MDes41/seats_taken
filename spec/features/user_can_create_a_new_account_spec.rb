require 'rails_helper'

RSpec.describe 'User' do
  it 'can create a new account' do
    visit root_path
    click_on 'Create a New Account'
    expect(current_path).to eq(new_user_path)
    fill_in 'user_name', with: 'New User'
    fill_in 'user_email', with: 'newuser@example.com'
    fill_in 'user_phone', with: '3035555555'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    click_on 'Create Account'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Helpful Driver')
    expect(page).to have_content('Thankful Passenger')
  end


  it 'is taken back to the create page with invalid credentials' do
    visit root_path
    click_on 'Create a New Account'
    expect(current_path).to eq(new_user_path)
    fill_in 'user_name', with: ''
    fill_in 'user_email', with: ''
    fill_in 'user_phone', with: ''
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: ''
    click_on 'Create Account'
    expect(current_path).to eq('/users')
    expect(page).to have_content('6 errors prohibited this account from being created:')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Phone can't be blank")
    expect(page).to have_content("Password confirmation can't be blank")
  end

  it 'can logout' do
    visit root_path
    click_on 'Create a New Account'
    expect(current_path).to eq(new_user_path)
    fill_in 'user_name', with: 'New User'
    fill_in 'user_email', with: 'newuser@example.com'
    fill_in 'user_phone', with: '3035555555'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    click_on 'Create Account'

    expect(page).to have_content('Logout')

    click_on 'Logout'
    expect(current_path).to eq(root_path)
  end
end
