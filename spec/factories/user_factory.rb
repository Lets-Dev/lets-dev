FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    email {"#{username}@lets-dev.fr"}
    password {'password'}
    password_confirmation {'password'}
  end
end
