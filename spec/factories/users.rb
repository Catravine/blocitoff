FactoryGirl.define do
  factory :user do
    email "fakeuser@bloccitoff.com"
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
end
