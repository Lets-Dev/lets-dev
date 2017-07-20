FactoryGirl.define do
  factory :financial_movement do
    amount { Faker::Number.decimal(2) }
    description { Faker::DrWho.quote }

    user
  end
end
