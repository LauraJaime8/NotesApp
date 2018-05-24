FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@factory.com" }
    name Faker::Name.name
    password Faker::Internet.password

    trait :with_notes do
      after(:create) do |user|
        2.times { create(:note, user: user) }
      end
    end

    factory :user_with_notes, traits: [:with_notes]
  end
end
