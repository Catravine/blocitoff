FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "some do-to thing: #{n}" }
    user
  end
end
