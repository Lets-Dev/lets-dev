FactoryGirl.define do
  factory :desk do
    started_at { Time.now - 6.months }
    ended_at { Time.now + 6.months }
    current { true }
  end
end
