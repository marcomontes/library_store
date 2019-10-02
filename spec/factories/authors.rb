FactoryBot.define do
  factory :author do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
  end
end