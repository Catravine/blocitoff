FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "some do-to thing: #{n}" }
    list
  end
end
