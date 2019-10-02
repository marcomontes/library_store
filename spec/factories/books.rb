FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    isbn  { Faker::Number.number(10) }
    price { Faker::Number.number(2) }
    short_description { Faker::Marketing.buzzwords }
    author_id nil
  end
end