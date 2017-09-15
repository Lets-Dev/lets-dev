FactoryGirl.define do
  factory :challenge do
    title { Faker::Book.title }
    subject { Faker::Lorem.paragraph(20) }
    starts_at { Time.now - 1.week }
    ends_at { Time.now + 1.week }

    language_set
  end
end
