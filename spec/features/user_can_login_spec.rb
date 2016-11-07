require 'rails_helper'

RSpec.describe 'User' do
  it 'can login' do
    visit root_path

    create :user, password: 'test', email: 'newuser@example.com', password_confirmation: 'test'

    click_on 'Login'
    fill_in 'sessions_email', with: 'newuser@example.com'
    fill_in 'sessions_password', with: 'test'
    click_on 'Login'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Helpful Driver')
    expect(page).to have_content('Thankful Passenger')
  end
end
