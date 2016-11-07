require 'rails_helper'

RSpec.describe 'Driver' do
  it 'can pick a destinaion' do
    user = create :user
    Destination.create(name: 'Arapahoe Basin')
    Destination.create(name: 'Beaver Creek')
    Destination.create(name: 'Breackenridge')

    login(user)

    visit dashboard_path

    click_on "Create a trip"

    expect(page).to have_content('Arapahoe Basin')
    expect(page).to have_content('Beaver Creek')
    expect(page).to have_content('Breackenride')
  end
end
