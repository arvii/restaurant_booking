FactoryGirl.define do
  factory :poll do
    number_of_people { Faker::Number.between(1, 10) }
    budget { Faker::Number.between(1000, 2000) }
    occasion { "#{Faker::Name.first_name}'s Birthday" }
    status { 'wew' }
  end
end
