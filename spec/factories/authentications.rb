# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication do
    provider "provider"
    uid      "provider-id"
    email    "user@example.com"
    user     { create(:user) }
  end
end
