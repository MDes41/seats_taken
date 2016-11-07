FactoryGirl.define do
  factory :user do
    name  Faker::Name.name
    email Faker::Internet.email
    phone Faker::PhoneNumber.cell_phone
    password 'test'
    role 0
  end
end
