FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'sourcepad' }
  end
end
