FactoryGirl.define do
  factory :contact do
    name { Faker::Company.name }
    description { Faker::Company.profession }
  end
end
