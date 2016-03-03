FactoryGirl.define do
  factory :list do
    sequence(:title) { |n| "List no. #{n}" }
    user
  end
end
