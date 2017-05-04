FactoryGirl.define do
  factory :restaurant do
    name { "#{Faker::Name.name} Restaurant" }
    status { 'Petmalu' }
  end
end
