# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message, class: 'ActsAsMessageable::Message' do
    body  "Hello"
    topic "Happy Drunk Day!"
  end
end
