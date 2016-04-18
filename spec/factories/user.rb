FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "123"

    factory :user_with_link do
      transient do
        links_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:link, evaluator.links_count, user: user)
      end
    end
  end
end
